import 'package:cloud_firestore/cloud_firestore.dart';

enum SubscriptionType {
  monthly('monthly', 'Monthly', 5, 'month'),
  yearly('yearly', 'Yearly', 50, 'year');

  const SubscriptionType(this.id, this.displayName, this.price, this.period);

  final String id;
  final String displayName;
  final double price;
  final String period;

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
  
  String get description {
    switch (this) {
      case SubscriptionType.monthly:
        return 'Access all premium features for one month';
      case SubscriptionType.yearly:
        return 'Access all premium features for one year\nSave 17% compared to monthly';
    }
  }

  List<String> get features => [
    'Unlimited access to all animal categories',
    'High-quality anatomical diagrams',
    'Detailed descriptions and information',
    'Offline access to content',
    'Regular content updates',
    'Priority customer support',
  ];

  // RevenueCat product identifiers - you'll need to configure these in RevenueCat dashboard
  String get productId {
    switch (this) {
      case SubscriptionType.monthly:
        return 'petomie_monthly_subscription:petomie-monthly-subscription';
      case SubscriptionType.yearly:
        return 'petomie_yearly_subscription:petomie-yearly-subscription';
    }
  }
}

enum SubscriptionStatus {
  active('active', 'Active'),
  expired('expired', 'Expired'),
  canceled('canceled', 'Canceled'),
  paused('paused', 'Paused'),
  none('none', 'No Subscription');

  const SubscriptionStatus(this.id, this.displayName);

  final String id;
  final String displayName;

  bool get isActive => this == SubscriptionStatus.active;
  bool get hasAccess => this == SubscriptionStatus.active || this == SubscriptionStatus.paused;
}

class SubscriptionData {
  final String userId;
  final SubscriptionType? type;
  final SubscriptionStatus status;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? lastUpdated;
  final String? transactionId;
  final String? originalTransactionId;
  final bool autoRenew;
  final Map<String, dynamic>? metadata;

  const SubscriptionData({
    required this.userId,
    this.type,
    required this.status,
    this.startDate,
    this.endDate,
    this.lastUpdated,
    this.transactionId,
    this.originalTransactionId,
    this.autoRenew = false,
    this.metadata,
  });

  bool get isActive => status.isActive && !isExpired;
  bool get hasAccess => status.hasAccess && !isExpired;
  
  bool get isExpired {
    if (endDate == null) return false;
    return DateTime.now().isAfter(endDate!);
  }

  int get daysRemaining {
    if (endDate == null) return 0;
    final now = DateTime.now();
    if (now.isAfter(endDate!)) return 0;
    return endDate!.difference(now).inDays;
  }

  String get statusDescription {
    if (isExpired) return 'Expired';
    if (status == SubscriptionStatus.active && daysRemaining > 0) {
      return 'Active • ${daysRemaining} days remaining';
    }
    return status.displayName;
  }

  factory SubscriptionData.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    
    return SubscriptionData(
      userId: doc.id,
      type: data['type'] != null 
          ? SubscriptionType.values.firstWhere(
              (t) => t.id == data['type']!,
              orElse: () => SubscriptionType.monthly,
            )
          : null,
      status: SubscriptionStatus.values.firstWhere(
        (s) => s.id == data['status'],
        orElse: () => SubscriptionStatus.none,
      ),
      startDate: data['startDate'] != null 
          ? (data['startDate'] as Timestamp).toDate()
          : null,
      endDate: data['endDate'] != null 
          ? (data['endDate'] as Timestamp).toDate()
          : null,
      lastUpdated: data['lastUpdated'] != null 
          ? (data['lastUpdated'] as Timestamp).toDate()
          : null,
      transactionId: data['transactionId'],
      originalTransactionId: data['originalTransactionId'],
      autoRenew: data['autoRenew'] ?? false,
      metadata: data['metadata'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'type': type?.id,
      'status': status.id,
      'startDate': startDate != null ? Timestamp.fromDate(startDate!) : null,
      'endDate': endDate != null ? Timestamp.fromDate(endDate!) : null,
      'lastUpdated': Timestamp.fromDate(DateTime.now()),
      'transactionId': transactionId,
      'originalTransactionId': originalTransactionId,
      'autoRenew': autoRenew,
      'metadata': metadata,
    };
  }

  SubscriptionData copyWith({
    String? userId,
    SubscriptionType? type,
    SubscriptionStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? lastUpdated,
    String? transactionId,
    String? originalTransactionId,
    bool? autoRenew,
    Map<String, dynamic>? metadata,
  }) {
    return SubscriptionData(
      userId: userId ?? this.userId,
      type: type ?? this.type,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      transactionId: transactionId ?? this.transactionId,
      originalTransactionId: originalTransactionId ?? this.originalTransactionId,
      autoRenew: autoRenew ?? this.autoRenew,
      metadata: metadata ?? this.metadata,
    );
  }

  static SubscriptionData empty(String userId) {
    return SubscriptionData(
      userId: userId,
      status: SubscriptionStatus.none,
    );
  }
}
