# Subscription System Implementation Guide

## Overview

This document provides a comprehensive guide for setting up the subscription system in your Petomie app. The implementation supports iOS, Android, and web platforms with a robust, user-friendly subscription management system.

## 🏗️ Architecture

The subscription system consists of several key components:

1. **Models**: `SubscriptionData`, `SubscriptionType`, `SubscriptionStatus`
2. **Services**: `SubscriptionService` for handling purchases and validation
3. **Providers**: `SubscriptionProvider` for state management
4. **UI Components**: `SubscriptionScreen`, `SubscriptionWrapper`, `PremiumFeatureWrapper`
5. **Configuration**: Centralized config for all credentials and settings

## 📱 Platform Support

### iOS (App Store)
- Uses RevenueCat + StoreKit for in-app purchases
- Supports App Store receipt validation
- Handles iOS-specific subscription management

### Android (Google Play)
- Uses RevenueCat + Google Play Billing
- Supports Play Console subscription validation
- Handles Android-specific subscription features

### Web (Stripe)
- Uses Stripe for web-based payments
- Supports subscription management via Stripe Customer Portal
- Handles web-specific payment flows

## 🚀 Setup Instructions

### 1. RevenueCat Setup

RevenueCat is the central hub for cross-platform subscription management.

1. **Create RevenueCat Account**
   - Go to [RevenueCat Dashboard](https://app.revenuecat.com/)
   - Create a new project
   - Note your project's public API keys

2. **Configure Apps**
   - Add your iOS app (Bundle ID: `com.yourcompany.petomie`)
   - Add your Android app (Package Name: `com.yourcompany.petomie`)
   - Configure product identifiers:
     - Monthly: `petomie_monthly_subscription`
     - Yearly: `petomie_yearly_subscription`

3. **Set up Entitlements**
   - Create an entitlement called "premium"
   - Attach your subscription products to this entitlement

### 2. iOS App Store Setup

1. **App Store Connect Configuration**
   - Go to [App Store Connect](https://appstoreconnect.apple.com/)
   - Navigate to your app → Features → In-App Purchases
   - Create subscription groups and products:
     - Monthly Subscription: `petomie_monthly_subscription`
     - Yearly Subscription: `petomie_yearly_subscription`

2. **Configure Pricing and Availability**
   - Set pricing for different regions
   - Configure subscription duration and features
   - Set up promotional offers if needed

3. **Server Notifications**
   - Set up App Store Server Notifications
   - Configure webhook URL: `https://your-backend.com/webhooks/apple`

### 3. Android Google Play Setup

1. **Google Play Console Configuration**
   - Go to [Google Play Console](https://play.google.com/console)
   - Navigate to your app → Monetize → Products → Subscriptions
   - Create subscription products:
     - Monthly Subscription: `petomie_monthly_subscription`
     - Yearly Subscription: `petomie_yearly_subscription`

2. **Configure Pricing and Availability**
   - Set pricing for different countries
   - Configure subscription periods and features
   - Set up promotional offers if needed

3. **Real-time Developer Notifications**
   - Set up Real-time Developer Notifications
   - Configure webhook URL: `https://your-backend.com/webhooks/google-play`

4. **Service Account Setup**
   - Create a service account in Google Cloud Console
   - Download the JSON key file
   - Grant necessary permissions in Play Console

### 4. Web Stripe Setup (Optional)

1. **Stripe Dashboard Configuration**
   - Go to [Stripe Dashboard](https://dashboard.stripe.com/)
   - Create subscription products and prices
   - Note your publishable and secret keys

2. **Configure Products**
   - Monthly Subscription: Note the price ID
   - Yearly Subscription: Note the price ID

3. **Webhook Setup**
   - Set up webhooks for subscription events
   - Configure endpoint: `https://your-backend.com/webhooks/stripe`

### 5. Firebase Firestore Setup

1. **Enable Firestore**
   - Go to Firebase Console
   - Enable Cloud Firestore for your project

2. **Deploy Security Rules**
   ```bash
   firebase deploy --only firestore:rules
   ```

3. **Configure Indexes** (if needed)
   - Firestore will suggest indexes as you use the app
   - Deploy any required indexes

### 6. Configuration Update

Update the configuration file at `lib/config/subscription_config.dart`:

```dart
class SubscriptionConfig {
  // RevenueCat API Keys
  static const String revenueCatApiKey = 'your_revenuecat_api_key';
  
  // iOS Configuration
  static const String iosBundleId = 'com.yourcompany.petomie';
  static const String iosMonthlyProductId = 'petomie_monthly_subscription';
  static const String iosYearlyProductId = 'petomie_yearly_subscription';
  
  // Android Configuration
  static const String androidPackageName = 'com.yourcompany.petomie';
  static const String androidMonthlyProductId = 'petomie_monthly_subscription';
  static const String androidYearlyProductId = 'petomie_yearly_subscription';
  
  // Stripe Configuration (for web)
  static const String stripePublishableKey = 'pk_test_your_stripe_key';
  static const String stripeMonthlyPriceId = 'price_your_monthly_id';
  static const String stripeYearlyPriceId = 'price_your_yearly_id';
  
  // Set to true for production
  static const bool isProduction = false;
}
```

## 🔧 Backend Setup (Optional but Recommended)

For production apps, you should implement server-side validation and webhook handling:

### 1. Webhook Endpoints

Create endpoints to handle webhooks from:
- RevenueCat: `/webhooks/revenuecat`
- Apple App Store: `/webhooks/apple`
- Google Play: `/webhooks/google-play`
- Stripe: `/webhooks/stripe`

### 2. Receipt Validation

Implement server-side receipt validation for additional security:
- iOS: Validate App Store receipts
- Android: Validate Google Play receipts
- Web: Handle Stripe webhook events

### 3. Database Synchronization

Keep your Firestore database in sync with subscription events:
- Update subscription status on purchases
- Handle subscription renewals
- Process cancellations and refunds

## 🧪 Testing

### 1. Sandbox Testing

**iOS:**
- Use sandbox Apple ID for testing
- Test with App Store Connect sandbox environment

**Android:**
- Use test accounts in Google Play Console
- Test with Play Console internal testing

**RevenueCat:**
- Use RevenueCat's sandbox environment
- Test subscription flows and webhooks

### 2. Test Scenarios

Test these critical scenarios:
- ✅ New subscription purchase
- ✅ Subscription renewal
- ✅ Subscription cancellation
- ✅ Failed payment handling
- ✅ Restore purchases
- ✅ Cross-platform subscription sync
- ✅ Offline/online state handling

## 🎨 UI/UX Features

The implementation includes:

### Subscription Screen
- Beautiful, themed UI following your app's design
- Clear pricing display with popular plan highlighting
- Feature comparison and benefits
- Smooth animations and transitions
- Loading states and error handling

### Subscription Wrapper
- Automatic subscription checking
- Premium feature gating
- Graceful fallbacks for non-subscribers
- Contextual upgrade prompts

### Home Screen Integration
- Subscription status indicator
- Quick access to subscription management
- Visual feedback for premium users

## 🔒 Security Considerations

### Client-Side Security
- API keys are safely embedded in the app
- RevenueCat handles secure communication
- No sensitive credentials in client code

### Server-Side Security (Recommended)
- Implement webhook signature verification
- Use HTTPS for all webhook endpoints
- Validate receipts server-side
- Store sensitive credentials securely

### Firestore Security
- Comprehensive security rules implemented
- User data isolation
- Audit trail preservation
- Data validation and sanitization

## 🚀 Deployment Checklist

### Pre-Production
- [ ] Update all API keys to production values
- [ ] Set `isProduction = true` in config
- [ ] Test all subscription flows thoroughly
- [ ] Verify webhook endpoints are working
- [ ] Deploy Firestore security rules

### App Store Submission
- [ ] Configure in-app purchase products
- [ ] Submit for review with subscription features
- [ ] Test with App Store review team account

### Play Store Submission
- [ ] Configure subscription products
- [ ] Test with Play Console testing tracks
- [ ] Submit for review

### Web Deployment
- [ ] Configure Stripe products and webhooks
- [ ] Test payment flows end-to-end
- [ ] Deploy web app with subscription features

## 📞 Support and Troubleshooting

### Common Issues

1. **Subscription Not Detected**
   - Check RevenueCat configuration
   - Verify product IDs match across platforms
   - Ensure user is properly logged in to RevenueCat

2. **Purchase Failures**
   - Verify sandbox/production environment settings
   - Check platform-specific configurations
   - Review RevenueCat debug logs

3. **Webhook Issues**
   - Verify endpoint URLs are correct and accessible
   - Check webhook signatures and authentication
   - Review server logs for errors

### Debug Tools

- RevenueCat Dashboard: Monitor subscription events
- Firebase Console: Check Firestore data and logs
- Platform-specific tools: App Store Connect, Play Console, Stripe Dashboard

## 📚 Additional Resources

- [RevenueCat Documentation](https://docs.revenuecat.com/)
- [Apple In-App Purchase Guide](https://developer.apple.com/in-app-purchase/)
- [Google Play Billing Guide](https://developer.android.com/google/play/billing)
- [Stripe Subscriptions Guide](https://stripe.com/docs/billing/subscriptions)
- [Firebase Security Rules Guide](https://firebase.google.com/docs/firestore/security/get-started)

## 🤝 Contributing

When making changes to the subscription system:
1. Update tests for any new functionality
2. Update this documentation
3. Test across all supported platforms
4. Verify security implications

---

**Note**: This implementation provides a solid foundation for a production-ready subscription system. Always test thoroughly and consider your specific business requirements when customizing the implementation.
