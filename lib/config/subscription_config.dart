/// Subscription Configuration
/// 
/// This file contains configuration settings for the subscription system.
/// You'll need to replace the placeholder values with your actual credentials
/// and configuration from various services.

import 'dart:io' show Platform;

class SubscriptionConfig {
  // ============================================================================
  // REVENUECAT CONFIGURATION
  // ============================================================================
  
  /// RevenueCat API Key
  /// 
  /// Get this from: https://app.revenuecat.com/
  /// 1. Go to your RevenueCat dashboard
  /// 2. Navigate to Project Settings
  /// 3. Copy the "Public API Key" for your platform
  /// 
  /// IMPORTANT: Use different keys for different platforms and environments
  static const String revenueCatApiKey = 'YOUR_REVENUECAT_API_KEY_HERE';
  
  /// RevenueCat API Key for iOS (if different from above)
  static const String revenueCatApiKeyIOS = 'YOUR_REVENUECAT_IOS_API_KEY_HERE';
  
  /// RevenueCat API Key for Android (if different from above)
  static const String revenueCatApiKeyAndroid = 'goog_DOGKbvHIbGlmgqVwByqltsOYkWv';
  
  /// Get the appropriate API key for the current platform
  static String get currentPlatformApiKey {
    if (Platform.isAndroid) {
      return revenueCatApiKeyAndroid;
    } else if (Platform.isIOS) {
      return revenueCatApiKeyIOS;
    } else {
      return revenueCatApiKey;
    }
  }

  // ============================================================================
  // APPLE APP STORE CONFIGURATION
  // ============================================================================
  
  /// Apple App Store Connect Configuration
  /// 
  /// Required for iOS in-app purchases
  /// Get these from: https://appstoreconnect.apple.com/
  
  /// Your app's Bundle ID (must match your iOS app)
  static const String iosBundleId = 'com.yourcompany.petomie';
  
  /// Apple App Store Product IDs
  /// These must match the product IDs you created in App Store Connect
  static const String iosMonthlyProductId = 'petomie_monthly_subscription';
  static const String iosYearlyProductId = 'petomie_yearly_subscription';
  
  /// Apple App Store Shared Secret (for receipt validation)
  /// Get this from App Store Connect > My Apps > [Your App] > App Information
  static const String iosSharedSecret = 'YOUR_IOS_SHARED_SECRET_HERE';

  // ============================================================================
  // GOOGLE PLAY STORE CONFIGURATION
  // ============================================================================
  
  /// Google Play Console Configuration
  /// 
  /// Required for Android in-app purchases
  /// Get these from: https://play.google.com/console
  
  /// Your app's Package Name (must match your Android app)
  static const String androidPackageName = 'com.healermap.petomie';
  
  /// Google Play Store Product IDs
  /// These must match the subscription IDs you created in Google Play Console
  static const String androidMonthlyProductId = 'petomie_monthly_subscription';
  static const String androidYearlyProductId = 'petomie_yearly_subscription';
  
  /// Google Play Console Service Account Key (for server-side validation)
  /// This is a JSON key file - store it securely on your server
  static const String googlePlayServiceAccountKey = '''
  {
    "type": "service_account",
    "project_id": "your-project-id",
    "private_key_id": "your-private-key-id",
    "private_key": "-----BEGIN PRIVATE KEY-----\\nYOUR_PRIVATE_KEY_HERE\\n-----END PRIVATE KEY-----\\n",
    "client_email": "your-service-account@your-project-id.iam.gserviceaccount.com",
    "client_id": "your-client-id",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/your-service-account%40your-project-id.iam.gserviceaccount.com"
  }
  ''';

  // ============================================================================
  // STRIPE CONFIGURATION (FOR WEB)
  // ============================================================================
  
  /// Stripe Configuration for Web Payments
  /// 
  /// Required for web-based subscription payments
  /// Get these from: https://dashboard.stripe.com/
  
  /// Stripe Publishable Key (safe to expose in client-side code)
  static const String stripePublishableKey = 'pk_test_YOUR_STRIPE_PUBLISHABLE_KEY_HERE';
  
  /// Stripe Price IDs for subscriptions
  /// Create these in your Stripe dashboard under Products
  static const String stripeMonthlyPriceId = 'price_YOUR_MONTHLY_PRICE_ID';
  static const String stripeYearlyPriceId = 'price_YOUR_YEARLY_PRICE_ID';
  
  /// Your backend endpoint for creating Stripe checkout sessions
  static const String stripeCheckoutEndpoint = 'https://your-backend.com/create-checkout-session';
  
  /// Your backend endpoint for creating Stripe customer portal sessions
  static const String stripePortalEndpoint = 'https://your-backend.com/create-portal-session';

  // ============================================================================
  // WEBHOOK CONFIGURATION
  // ============================================================================
  
  /// Webhook endpoints for subscription events
  /// These should point to your backend server
  
  /// RevenueCat webhook endpoint
  static const String revenueCatWebhookEndpoint = 'https://your-backend.com/webhooks/revenuecat';
  
  /// Stripe webhook endpoint
  static const String stripeWebhookEndpoint = 'https://your-backend.com/webhooks/stripe';
  
  /// Apple App Store Server Notifications endpoint
  static const String appleWebhookEndpoint = 'https://your-backend.com/webhooks/apple';
  
  /// Google Play Developer Notifications endpoint
  static const String googlePlayWebhookEndpoint = 'https://your-backend.com/webhooks/google-play';

  // ============================================================================
  // SUBSCRIPTION PLANS CONFIGURATION
  // ============================================================================
  
  /// Subscription plan prices (should match your store configuration)
  static const Map<String, double> subscriptionPrices = {
    'monthly': 5,
    'yearly': 50,
  };
  
  /// Free trial configuration
  static const bool enableFreeTrial = true;
  static const int freeTrialDays = 7;
  
  /// Grace period for expired subscriptions (in days)
  static const int gracePeriodDays = 3;

  // ============================================================================
  // ENVIRONMENT CONFIGURATION
  // ============================================================================
  
  /// Environment settings
  static const bool isProduction = false; // Set to true for production builds
  static const bool enableDebugLogging = true; // Set to false for production
  
  /// Test user emails (for testing purposes)
  static const List<String> testUserEmails = [
    'test@yourcompany.com',
    'developer@yourcompany.com',
  ];

  // ============================================================================
  // HELPER METHODS
  // ============================================================================
  
  /// Check if the current environment is production
  static bool get isProductionEnvironment => isProduction;
  
  /// Check if debug logging is enabled
  static bool get isDebugLoggingEnabled => enableDebugLogging && !isProduction;
  
  /// Get the appropriate product ID based on platform and subscription type
  static String getProductId(String subscriptionType, {String? platform}) {
    // This is a simplified version - you might want more complex logic
    switch (subscriptionType.toLowerCase()) {
      case 'monthly':
        return platform == 'ios' ? iosMonthlyProductId : androidMonthlyProductId;
      case 'yearly':
        return platform == 'ios' ? iosYearlyProductId : androidYearlyProductId;
      default:
        throw ArgumentError('Unknown subscription type: $subscriptionType');
    }
  }
  
  /// Validate configuration
  static bool validateConfiguration() {
    final keyToCheck = currentPlatformApiKey;
    if (keyToCheck.startsWith('YOUR_') || keyToCheck.isEmpty) {
      return false;
    }
    // Add more validation as needed
    return true;
  }
}

// ============================================================================
// SETUP INSTRUCTIONS
// ============================================================================

/*
SETUP INSTRUCTIONS:

1. REVENUECAT SETUP:
   - Sign up at https://app.revenuecat.com/
   - Create a new project
   - Add your iOS and Android apps
   - Configure products and entitlements
   - Copy your API keys and replace the placeholders above

2. APPLE APP STORE SETUP:
   - Create subscription products in App Store Connect
   - Configure pricing and availability
   - Set up App Store Server Notifications
   - Copy your Bundle ID and Product IDs

3. GOOGLE PLAY STORE SETUP:
   - Create subscription products in Google Play Console
   - Configure pricing and availability
   - Set up Real-time Developer Notifications
   - Create and download a service account key

4. STRIPE SETUP (for web):
   - Create a Stripe account
   - Create subscription products and prices
   - Set up webhooks for subscription events
   - Copy your publishable key and price IDs

5. BACKEND SETUP:
   - Set up webhook endpoints to handle subscription events
   - Implement server-side receipt validation
   - Store subscription data securely
   - Handle subscription lifecycle events

6. FIREBASE SETUP:
   - Enable Cloud Firestore
   - Deploy the security rules from firestore.rules
   - Set up proper indexes if needed

7. TESTING:
   - Use sandbox/test environments for all services
   - Test subscription flows on all platforms
   - Verify webhook handling
   - Test edge cases (failed payments, cancellations, etc.)

8. PRODUCTION DEPLOYMENT:
   - Update all configuration to production values
   - Set isProduction = true
   - Disable debug logging
   - Test thoroughly in production environment

SECURITY NOTES:
- Never commit real API keys or secrets to version control
- Use environment variables or secure configuration management
- Implement proper server-side validation
- Use HTTPS for all webhook endpoints
- Regularly rotate API keys and secrets

For more detailed setup instructions, refer to the documentation of each service:
- RevenueCat: https://docs.revenuecat.com/
- Apple: https://developer.apple.com/in-app-purchase/
- Google Play: https://developer.android.com/google/play/billing
- Stripe: https://stripe.com/docs/billing/subscriptions
*/
