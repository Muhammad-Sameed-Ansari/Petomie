import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subscription_provider.dart';
import '../screens/subscription_screen.dart';
import '../themes/app_themes.dart';
import '../models/subscription.dart';

class SubscriptionWrapper extends StatefulWidget {
  final Widget child;
  final bool requiresSubscription;
  final String? featureName;

  const SubscriptionWrapper({
    super.key,
    required this.child,
    this.requiresSubscription = true,
    this.featureName,
  });

  @override
  State<SubscriptionWrapper> createState() => _SubscriptionWrapperState();
}

class _SubscriptionWrapperState extends State<SubscriptionWrapper> {
  @override
  void initState() {
    super.initState();
    // Load subscription data when wrapper is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SubscriptionProvider>().loadSubscription();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SubscriptionProvider>(
      builder: (context, subscriptionProvider, child) {
        // If subscription is not required, always show the child
        if (!widget.requiresSubscription) {
          return widget.child;
        }

        // Show loading state while checking subscription
        if (subscriptionProvider.isLoading) {
          return _buildLoadingScreen();
        }

        // Check if user has access to the feature
        final hasAccess = widget.featureName != null
            ? subscriptionProvider.hasFeatureAccess(widget.featureName!)
            : subscriptionProvider.hasActiveSubscription;

        if (hasAccess) {
          return widget.child;
        }

        // Show subscription required screen
        return _buildSubscriptionRequiredScreen(subscriptionProvider);
      },
    );
  }

  Widget _buildLoadingScreen() {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Checking subscription status...',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionRequiredScreen(SubscriptionProvider provider) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Premium icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.workspace_premium,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              const SizedBox(height: 32),

              // Title
              Text(
                'Premium Feature',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                widget.featureName != null
                    ? 'This feature requires a premium subscription. Upgrade now to unlock ${widget.featureName} and all other premium features.'
                    : 'This content requires a premium subscription. Upgrade now to unlock unlimited access to all animal anatomy content.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Features preview
              _buildFeaturesList(),
              const SizedBox(height: 32),

              // Subscription status info
              if (provider.currentSubscription.status != SubscriptionStatus.none)
                _buildSubscriptionStatusInfo(provider),

              // Action buttons
              _buildActionButtons(provider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesList() {
    final features = [
      'Unlimited access to all content',
      'High-quality anatomical diagrams',
      'Detailed descriptions and information',
      'Offline access to content',
    ];

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Premium Features',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            ...features.map((feature) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: AppColors.success,
                        size: 14,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        feature,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionStatusInfo(SubscriptionProvider provider) {
    final subscription = provider.currentSubscription;
    Color statusColor;
    IconData statusIcon;
    String statusText;

    if (subscription.status == SubscriptionStatus.expired) {
      statusColor = AppColors.warning;
      statusIcon = Icons.access_time;
      statusText = 'Your subscription has expired';
    } else if (subscription.status == SubscriptionStatus.canceled) {
      statusColor = AppColors.error;
      statusIcon = Icons.cancel;
      statusText = 'Your subscription has been canceled';
    } else if (subscription.status == SubscriptionStatus.paused) {
      statusColor = AppColors.warning;
      statusIcon = Icons.pause;
      statusText = 'Your subscription is paused';
    } else {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: statusColor.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            statusIcon,
            color: statusColor,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  statusText,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
                if (subscription.endDate != null)
                  Text(
                    'Expired on ${_formatDate(subscription.endDate!)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: statusColor.withOpacity(0.8),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(SubscriptionProvider provider) {
    return Column(
      children: [
        // Primary action button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () => _navigateToSubscription(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              elevation: 4,
              shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              provider.currentSubscription.status == SubscriptionStatus.expired ||
                      provider.currentSubscription.status == SubscriptionStatus.canceled
                  ? 'Renew Subscription'
                  : 'Get Premium',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Restore purchases button
        TextButton(
          onPressed: () => _handleRestorePurchases(provider),
          child: Text(
            'Restore Purchases',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Back button (if applicable)
        TextButton(
          onPressed: () => Navigator.of(context).maybePop(),
          child: Text(
            'Go Back',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToSubscription() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SubscriptionScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  Future<void> _handleRestorePurchases(SubscriptionProvider provider) async {
    final success = await provider.restorePurchases();
    
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Purchases restored successfully!'),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    } else if (provider.errorMessage != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(provider.errorMessage!),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

// Helper widget for wrapping specific features
class PremiumFeatureWrapper extends StatelessWidget {
  final Widget child;
  final String featureName;
  final Widget? fallbackWidget;

  const PremiumFeatureWrapper({
    super.key,
    required this.child,
    required this.featureName,
    this.fallbackWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SubscriptionProvider>(
      builder: (context, provider, _) {
        if (provider.hasFeatureAccess(featureName)) {
          return child;
        }

        return fallbackWidget ?? 
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SubscriptionScreen(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: child,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.workspace_premium,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Premium',
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
      },
    );
  }
}
