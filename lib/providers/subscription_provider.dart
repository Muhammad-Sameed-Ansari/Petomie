import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/subscription.dart';
import '../services/subscription_service.dart';

class SubscriptionProvider extends ChangeNotifier {
  final SubscriptionService _subscriptionService = SubscriptionService();
  
  SubscriptionData _currentSubscription = SubscriptionData.empty('');
  List<SubscriptionType> _availableSubscriptions = SubscriptionType.values;
  bool _isLoading = false;
  bool _isPurchasing = false;
  String? _errorMessage;
  StreamSubscription<SubscriptionData>? _subscriptionStreamSubscription;

  // Getters
  SubscriptionData get currentSubscription => _currentSubscription;
  List<SubscriptionType> get availableSubscriptions => _availableSubscriptions;
  bool get isLoading => _isLoading;
  bool get isPurchasing => _isPurchasing;
  String? get errorMessage => _errorMessage;
  
  bool get hasActiveSubscription => _currentSubscription.hasAccess;
  bool get isSubscriptionExpired => _currentSubscription.isExpired;
  int get daysRemaining => _currentSubscription.daysRemaining;
  String get subscriptionStatusDescription => _currentSubscription.statusDescription;

  SubscriptionProvider() {
    _initializeSubscriptionStream();
  }

  @override
  void dispose() {
    _subscriptionStreamSubscription?.cancel();
    super.dispose();
  }

  // Initialize subscription stream to listen for changes
  void _initializeSubscriptionStream() {
    _subscriptionStreamSubscription = _subscriptionService
        .subscriptionStream()
        .listen(
          (subscription) {
            if (_currentSubscription.userId != subscription.userId ||
                _currentSubscription.status != subscription.status ||
                _currentSubscription.type != subscription.type) {
              _currentSubscription = subscription;
              notifyListeners();
            }
          },
          onError: (error) {
            debugPrint('Subscription stream error: $error');
            _setError('Failed to sync subscription status');
          },
        );
  }

  // Load subscription data
  Future<void> loadSubscription() async {
    if (_isLoading) return;
    
    _setLoading(true);
    _clearError();

    try {
      // Load current subscription
      final subscription = await _subscriptionService.getCurrentSubscription();
      _currentSubscription = subscription;

      // Load available subscriptions
      final available = await _subscriptionService.getAvailableSubscriptions();
      _availableSubscriptions = available;

      debugPrint('Loaded subscription: ${subscription.status.displayName}');
    } catch (e) {
      debugPrint('Failed to load subscription: $e');
      _setError('Failed to load subscription information');
    } finally {
      _setLoading(false);
    }
  }

  // Purchase a subscription
  Future<bool> purchaseSubscription(SubscriptionType type) async {
    if (_isPurchasing) return false;
    
    _setPurchasing(true);
    _clearError();

    try {
      final success = await _subscriptionService.purchaseSubscription(type);
      
      if (success) {
        // Reload subscription data
        await loadSubscription();
        debugPrint('Successfully purchased subscription: ${type.displayName}');
        return true;
      } else {
        _setError('Purchase was cancelled');
        return false;
      }
    } catch (e) {
      debugPrint('Failed to purchase subscription: $e');
      _setError(_formatErrorMessage(e.toString()));
      return false;
    } finally {
      _setPurchasing(false);
    }
  }

  // Restore purchases
  Future<bool> restorePurchases() async {
    if (_isLoading) return false;
    
    _setLoading(true);
    _clearError();

    try {
      final success = await _subscriptionService.restorePurchases();
      
      if (success) {
        await loadSubscription();
        debugPrint('Successfully restored purchases');
        return true;
      } else {
        _setError('No previous purchases found');
        return false;
      }
    } catch (e) {
      debugPrint('Failed to restore purchases: $e');
      _setError('Failed to restore purchases');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Check subscription status (useful for periodic checks)
  Future<void> checkSubscriptionStatus() async {
    try {
      final subscription = await _subscriptionService.getCurrentSubscription();
      if (_currentSubscription.status != subscription.status ||
          _currentSubscription.endDate != subscription.endDate) {
        _currentSubscription = subscription;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Failed to check subscription status: $e');
    }
  }

  // Get management URL for subscription
  Future<String?> getManagementURL() async {
    try {
      return await _subscriptionService.getManagementURL();
    } catch (e) {
      debugPrint('Failed to get management URL: $e');
      return null;
    }
  }

  // Refresh subscription data
  Future<void> refresh() async {
    await loadSubscription();
  }

  // Clear current subscription (when user logs out)
  void clearSubscription() {
    _currentSubscription = SubscriptionData.empty('');
    _availableSubscriptions = SubscriptionType.values;
    _clearError();
    notifyListeners();
  }

  // Helper methods
  void _setLoading(bool loading) {
    if (_isLoading != loading) {
      _isLoading = loading;
      notifyListeners();
    }
  }

  void _setPurchasing(bool purchasing) {
    if (_isPurchasing != purchasing) {
      _isPurchasing = purchasing;
      notifyListeners();
    }
  }

  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  void _clearError() {
    if (_errorMessage != null) {
      _errorMessage = null;
      notifyListeners();
    }
  }

  String _formatErrorMessage(String error) {
    // Clean up common error messages for better user experience
    if (error.contains('Purchase not allowed')) {
      return 'Purchase not allowed. Please check your device settings.';
    } else if (error.contains('Payment is pending')) {
      return 'Payment is being processed. Please wait for confirmation.';
    } else if (error.contains('Network error')) {
      return 'Network error. Please check your connection and try again.';
    } else if (error.contains('cancelled')) {
      return 'Purchase was cancelled.';
    } else {
      return 'An error occurred. Please try again.';
    }
  }

  // Get formatted subscription info for UI display
  Map<String, String> getSubscriptionDisplayInfo() {
    if (!hasActiveSubscription) {
      return {
        'status': 'No Active Subscription',
        'description': 'Subscribe to access premium features',
        'action': 'Subscribe Now',
      };
    }

    final info = <String, String>{
      'status': _currentSubscription.type?.displayName ?? 'Active',
      'description': subscriptionStatusDescription,
    };

    if (_currentSubscription.autoRenew) {
      info['action'] = 'Manage Subscription';
    } else if (isSubscriptionExpired) {
      info['action'] = 'Renew Subscription';
    } else {
      info['action'] = 'Manage Subscription';
    }

    return info;
  }

  // Check if a specific feature is available
  bool hasFeatureAccess(String featureName) {
    // You can customize this based on different subscription tiers
    return hasActiveSubscription;
  }

  // Get trial information (if you implement trials)
  bool get isInTrial => false; // Implement trial logic if needed
  int get trialDaysRemaining => 0; // Implement trial logic if needed
}
