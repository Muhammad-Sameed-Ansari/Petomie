import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/subscription.dart';
import '../providers/subscription_provider.dart';
import '../themes/app_themes.dart';

class SubscriptionScreen extends StatefulWidget {
  final bool showCloseButton;
  
  const SubscriptionScreen({
    super.key,
    this.showCloseButton = true,
  });

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  
  SubscriptionType _selectedType = SubscriptionType.yearly;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));
    
    _animationController.forward();
    
    // Load subscription data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SubscriptionProvider>().loadSubscription();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<SubscriptionProvider>(
      builder: (context, subscriptionProvider, child) {
        if (subscriptionProvider.isLoading) {
          return _buildLoadingState();
        }

        if (subscriptionProvider.hasActiveSubscription) {
          return _buildActiveSubscriptionView(subscriptionProvider);
        }

        return _buildSubscriptionPlansView(subscriptionProvider);
      },
    );
  }

  Widget _buildLoadingState() {
    return Center(
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
            'Loading subscription information...',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveSubscriptionView(SubscriptionProvider provider) {
    final subscription = provider.currentSubscription;
    
    return CustomScrollView(
      slivers: [
        _buildAppBar(title: 'Your Subscription'),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildSubscriptionStatusCard(subscription),
              const SizedBox(height: 24),
              _buildFeaturesCard(),
              const SizedBox(height: 24),
              _buildManageSubscriptionCard(provider),
              const SizedBox(height: 100),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildSubscriptionPlansView(SubscriptionProvider provider) {
    return CustomScrollView(
      slivers: [
        _buildAppBar(title: 'Premium Subscription'),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildHeaderSection(),
              const SizedBox(height: 32),
              _buildSubscriptionPlans(provider),
              const SizedBox(height: 24),
              _buildFeaturesCard(),
              const SizedBox(height: 24),
              _buildSubscribeButton(provider),
              const SizedBox(height: 16),
              _buildRestoreButton(provider),
              const SizedBox(height: 16),
              _buildTermsAndPrivacy(),
              const SizedBox(height: 100),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar({required String title}) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: widget.showCloseButton
          ? Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          : null,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      centerTitle: true,
      floating: true,
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.7),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.pets,
            color: Colors.white,
            size: 40,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Unlock Premium Features',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Get unlimited access to all animal anatomy content and premium features',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSubscriptionPlans(SubscriptionProvider provider) {
    return Column(
      children: SubscriptionType.values.map((type) {
        final isSelected = _selectedType == type;
        final isPopular = type == SubscriptionType.yearly;
        
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedType = type;
                  });
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                            width: 2,
                          ),
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                        ),
                        child: isSelected
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )
                            : null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  type.displayName,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                                if (isPopular) ...[
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.warning,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'POPULAR',
                                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              type.description,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            type.formattedPrice,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Text(
                            '/${type.period}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (isPopular)
                Positioned(
                  top: -1,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      'BEST VALUE',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFeaturesCard() {
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
            const SizedBox(height: 16),
            ...SubscriptionType.monthly.features.map((feature) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: AppColors.success,
                        size: 16,
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

  Widget _buildSubscribeButton(SubscriptionProvider provider) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: provider.isPurchasing
            ? null
            : () => _handleSubscribe(provider),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: provider.isPurchasing
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2,
                ),
              )
            : Text(
                'Subscribe for ${_selectedType.formattedPrice}/${_selectedType.period}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  Widget _buildRestoreButton(SubscriptionProvider provider) {
    return TextButton(
      onPressed: provider.isLoading
          ? null
          : () => _handleRestore(provider),
      child: Text(
        'Restore Purchases',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTermsAndPrivacy() {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text(
          'By subscribing, you agree to our ',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
          ),
        ),
        GestureDetector(
          onTap: () => _launchUrl('https://yourapp.com/terms'),
          child: Text(
            'Terms of Service',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text(
          ' and ',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
          ),
        ),
        GestureDetector(
          onTap: () => _launchUrl('https://yourapp.com/privacy'),
          child: Text(
            'Privacy Policy',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubscriptionStatusCard(SubscriptionData subscription) {
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
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.verified,
                    color: AppColors.success,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subscription.type?.displayName ?? 'Premium',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        subscription.statusDescription,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (subscription.endDate != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      color: Theme.of(context).colorScheme.primary,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Expires on ${_formatDate(subscription.endDate!)}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildManageSubscriptionCard(SubscriptionProvider provider) {
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
              'Manage Subscription',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'You can manage your subscription, change plans, or cancel anytime through your app store account.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => _handleManageSubscription(provider),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Manage Subscription'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSubscribe(SubscriptionProvider provider) async {
    final success = await provider.purchaseSubscription(_selectedType);
    
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Subscription activated successfully!'),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      
      // Navigate back to home screen after successful subscription
      // Small delay to let the user see the success message
      await Future.delayed(const Duration(milliseconds: 1500));
      if (mounted && Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
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

  Future<void> _handleRestore(SubscriptionProvider provider) async {
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

  Future<void> _handleManageSubscription(SubscriptionProvider provider) async {
    final url = await provider.getManagementURL();
    if (url != null) {
      _launchUrl(url);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Unable to open subscription management'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    }
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
