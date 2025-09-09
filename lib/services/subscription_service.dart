import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../models/subscription.dart';

class SubscriptionService {
  static final SubscriptionService _instance = SubscriptionService._internal();
  factory SubscriptionService() => _instance;
  SubscriptionService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  bool _isInitialized = false;

  // Initialize RevenueCat - call this in main.dart after Firebase initialization
  Future<void> initialize({
    required String apiKey,
    String? appUserId,
  }) async {
    if (_isInitialized) return;

    try {
      // Configure RevenueCat
      final configuration = PurchasesConfiguration(apiKey);
      
      if (appUserId != null) {
        configuration.appUserID = appUserId;
      }

      // Set debug logs in debug mode
      if (kDebugMode) {
        await Purchases.setLogLevel(LogLevel.debug);
      }

      await Purchases.configure(configuration);

      // Listen to customer info updates
      Purchases.addCustomerInfoUpdateListener(_handleCustomerInfoUpdate);

      _isInitialized = true;
      debugPrint('SubscriptionService initialized successfully');
    } catch (e) {
      debugPrint('Failed to initialize SubscriptionService: $e');
      rethrow;
    }
  }

  // Dispose resources
  void dispose() {
    // RevenueCat v8 handles listener cleanup automatically
  }

  // Set user ID for RevenueCat when user logs in
  Future<void> setUserId(String userId) async {
    if (!_isInitialized) return;
    
    try {
      await Purchases.logIn(userId);
      debugPrint('User logged in to RevenueCat: $userId');
    } catch (e) {
      debugPrint('Failed to log in user to RevenueCat: $e');
    }
  }

  // Clear user when logging out
  Future<void> clearUser() async {
    if (!_isInitialized) return;
    
    try {
      await Purchases.logOut();
      debugPrint('User logged out from RevenueCat');
    } catch (e) {
      debugPrint('Failed to log out user from RevenueCat: $e');
    }
  }

  // Get available subscription offerings
  Future<List<SubscriptionType>> getAvailableSubscriptions() async {
    if (!_isInitialized) {
      throw Exception('SubscriptionService not initialized');
    }

    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      
      if (current == null) {
        debugPrint('No current offering found');
        return SubscriptionType.values; // Return all types as fallback
      }

      // Filter available packages based on product IDs
      final availableTypes = <SubscriptionType>[];
      for (final type in SubscriptionType.values) {
        try {
          current.availablePackages.firstWhere(
            (p) => p.storeProduct.identifier == type.productId,
          );
          availableTypes.add(type);
        } catch (e) {
          debugPrint('Package not found for ${type.productId}');
        }
      }

      return availableTypes.isNotEmpty ? availableTypes : SubscriptionType.values;
    } catch (e) {
      debugPrint('Failed to get available subscriptions: $e');
      return SubscriptionType.values; // Return all types as fallback
    }
  }

  // Purchase a subscription
  Future<bool> purchaseSubscription(SubscriptionType type) async {
    if (!_isInitialized) {
      throw Exception('SubscriptionService not initialized');
    }

    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      
      if (current == null) {
        throw Exception('No subscription offerings available');
      }

      final package = current.availablePackages.firstWhere(
        (p) => p.storeProduct.identifier == type.productId,
        orElse: () => throw Exception('Subscription package not found'),
      );

      final customerInfo = await Purchases.purchasePackage(package);
      
      // Update Firestore with subscription info
      await _updateFirestoreSubscription(customerInfo);
      
      return customerInfo.activeSubscriptions.isNotEmpty;
    } on PlatformException catch (e) {
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      switch (errorCode) {
        case PurchasesErrorCode.purchaseCancelledError:
          debugPrint('Purchase was cancelled by user');
          return false;
        case PurchasesErrorCode.purchaseNotAllowedError:
          throw Exception('Purchase not allowed. Please check parental controls.');
        case PurchasesErrorCode.paymentPendingError:
          throw Exception('Payment is pending. Please wait for confirmation.');
        default:
          throw Exception('Purchase failed: ${e.message}');
      }
    } catch (e) {
      debugPrint('Failed to purchase subscription: $e');
      rethrow;
    }
  }

  // Restore purchases
  Future<bool> restorePurchases() async {
    if (!_isInitialized) {
      throw Exception('SubscriptionService not initialized');
    }

    try {
      final customerInfo = await Purchases.restorePurchases();
      await _updateFirestoreSubscription(customerInfo);
      return customerInfo.activeSubscriptions.isNotEmpty;
    } catch (e) {
      debugPrint('Failed to restore purchases: $e');
      rethrow;
    }
  }

  // Get current subscription status
  Future<SubscriptionData> getCurrentSubscription() async {
    final user = _auth.currentUser;
    if (user == null) {
      return SubscriptionData.empty('');
    }

    try {
      // First check Firestore
      final doc = await _firestore
          .collection('subscriptions')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        final subscription = SubscriptionData.fromFirestore(doc);
        
        // If subscription is active but might be expired, check RevenueCat
        if (subscription.status.isActive && _isInitialized) {
          try {
            final customerInfo = await Purchases.getCustomerInfo();
            await _updateFirestoreSubscription(customerInfo);
            
            // Re-fetch updated data
            final updatedDoc = await _firestore
                .collection('subscriptions')
                .doc(user.uid)
                .get();
            
            return updatedDoc.exists 
                ? SubscriptionData.fromFirestore(updatedDoc)
                : subscription;
          } catch (e) {
            debugPrint('Failed to sync with RevenueCat: $e');
            return subscription;
          }
        }
        
        return subscription;
      }

      // If no Firestore data, check RevenueCat
      if (_isInitialized) {
        try {
          final customerInfo = await Purchases.getCustomerInfo();
          await _updateFirestoreSubscription(customerInfo);
          
          final newDoc = await _firestore
              .collection('subscriptions')
              .doc(user.uid)
              .get();
          
          return newDoc.exists 
              ? SubscriptionData.fromFirestore(newDoc)
              : SubscriptionData.empty(user.uid);
        } catch (e) {
          debugPrint('Failed to check RevenueCat subscription: $e');
        }
      }

      return SubscriptionData.empty(user.uid);
    } catch (e) {
      debugPrint('Failed to get current subscription: $e');
      return SubscriptionData.empty(user.uid);
    }
  }

  // Stream subscription updates
  Stream<SubscriptionData> subscriptionStream() {
    final user = _auth.currentUser;
    if (user == null) {
      return Stream.value(SubscriptionData.empty(''));
    }

    return _firestore
        .collection('subscriptions')
        .doc(user.uid)
        .snapshots()
        .map((doc) {
      if (doc.exists) {
        return SubscriptionData.fromFirestore(doc);
      }
      return SubscriptionData.empty(user.uid);
    });
  }

  // Handle customer info updates from RevenueCat
  Future<void> _handleCustomerInfoUpdate(CustomerInfo customerInfo) async {
    try {
      await _updateFirestoreSubscription(customerInfo);
    } catch (e) {
      debugPrint('Failed to handle customer info update: $e');
    }
  }

  // Update Firestore with subscription data from RevenueCat
  Future<void> _updateFirestoreSubscription(CustomerInfo customerInfo) async {
    final user = _auth.currentUser;
    if (user == null) return;

    try {
      SubscriptionData subscriptionData;

      if (customerInfo.activeSubscriptions.isNotEmpty) {
        // Find the active subscription
        final activeEntitlement = customerInfo.entitlements.active.values.firstOrNull;
        
        if (activeEntitlement != null) {
          // Determine subscription type from product identifier
          final productId = activeEntitlement.productIdentifier;
          final subscriptionType = SubscriptionType.values.firstWhere(
            (type) => type.productId == productId,
            orElse: () => SubscriptionType.monthly,
          );

          subscriptionData = SubscriptionData(
            userId: user.uid,
            type: subscriptionType,
            status: SubscriptionStatus.active,
            startDate: _parseDate(activeEntitlement.latestPurchaseDate),
            endDate: _parseDate(activeEntitlement.expirationDate),
            transactionId: activeEntitlement.latestPurchaseDate,
            originalTransactionId: activeEntitlement.originalPurchaseDate,
            autoRenew: activeEntitlement.willRenew,
            metadata: {
              'revenueCatUserId': customerInfo.originalAppUserId,
              'entitlementId': activeEntitlement.identifier,
              'store': activeEntitlement.store.name,
            },
          );
        } else {
          subscriptionData = SubscriptionData.empty(user.uid);
        }
      } else {
        // Check if there are any expired subscriptions
        final allEntitlements = customerInfo.entitlements.all;
        if (allEntitlements.isNotEmpty) {
          final latestEntitlement = allEntitlements.values.first;
          final productId = latestEntitlement.productIdentifier;
          final subscriptionType = SubscriptionType.values.firstWhere(
            (type) => type.productId == productId,
            orElse: () => SubscriptionType.monthly,
          );

          subscriptionData = SubscriptionData(
            userId: user.uid,
            type: subscriptionType,
            status: SubscriptionStatus.expired,
            startDate: _parseDate(latestEntitlement.latestPurchaseDate),
            endDate: _parseDate(latestEntitlement.expirationDate),
            transactionId: latestEntitlement.latestPurchaseDate,
            originalTransactionId: latestEntitlement.originalPurchaseDate,
            autoRenew: false,
          );
        } else {
          subscriptionData = SubscriptionData.empty(user.uid);
        }
      }

      // Update Firestore
      await _firestore
          .collection('subscriptions')
          .doc(user.uid)
          .set(subscriptionData.toFirestore(), SetOptions(merge: true));

      debugPrint('Updated subscription in Firestore for user: ${user.uid}');
    } catch (e) {
      debugPrint('Failed to update Firestore subscription: $e');
    }
  }

  // Check if user has active subscription
  Future<bool> hasActiveSubscription() async {
    final subscription = await getCurrentSubscription();
    return subscription.hasAccess;
  }

  // Helper method to parse date strings from RevenueCat
  DateTime? _parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      debugPrint('Failed to parse date: $dateString, error: $e');
      return null;
    }
  }


  // Get subscription management URL (for iOS/Android)
  Future<String?> getManagementURL() async {
    if (!_isInitialized) return null;

    try {
      if (Platform.isIOS) {
        return 'https://apps.apple.com/account/subscriptions';
      } else if (Platform.isAndroid) {
        return 'https://play.google.com/store/account/subscriptions';
      }
      return null;
    } catch (e) {
      debugPrint('Failed to get management URL: $e');
      return null;
    }
  }

  // For web platform - handle subscription via Stripe or other web payment
  Future<bool> purchaseSubscriptionWeb(SubscriptionType type) async {
    // This would integrate with your web payment system (Stripe, etc.)
    // For now, return false to indicate web payments need to be implemented
    throw UnimplementedError(
      'Web subscription purchases need to be implemented with your payment provider (Stripe, etc.)'
    );
  }
}
