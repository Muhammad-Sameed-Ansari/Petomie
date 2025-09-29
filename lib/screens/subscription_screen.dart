import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
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
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1200;
    final isMediumScreen = screenWidth > 800;
    
    return Scaffold(
      backgroundColor: isWeb 
          ? Theme.of(context).colorScheme.background.withOpacity(0.98)
          : Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isWeb 
                  ? (isLargeScreen ? 800 : (isMediumScreen ? 700 : 600))
                  : double.infinity,
            ),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: _buildBody(),
              ),
            ),
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
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1200;
    final isMediumScreen = screenWidth > 800;
    
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      expandedHeight: isWeb ? (isLargeScreen ? 120 : 100) : null,
      leading: widget.showCloseButton
          ? Container(
              margin: EdgeInsets.all(isWeb ? 12 : 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(isWeb ? 16 : 12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(isWeb ? 0.08 : 0.1),
                    blurRadius: isWeb ? 12 : 8,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: isWeb ? Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
                  width: 1,
                ) : null,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: isWeb ? 22 : 20,
                ),
                onPressed: () => Navigator.of(context).pop(),
                style: isWeb ? IconButton.styleFrom(
                  overlayColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ) : null,
              ),
            )
          : null,
      flexibleSpace: isWeb ? FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: isLargeScreen ? 28 : (isMediumScreen ? 24 : 22),
            letterSpacing: -0.5,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.05),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ) : null,
      title: !isWeb ? Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ) : null,
      centerTitle: true,
      floating: true,
      pinned: isWeb,
    );
  }

  Widget _buildHeaderSection() {
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1200;
    final isMediumScreen = screenWidth > 800;
    
    return Column(
      children: [
        Container(
          width: isWeb ? (isLargeScreen ? 120 : 100) : 80,
          height: isWeb ? (isLargeScreen ? 120 : 100) : 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.8),
                Theme.of(context).colorScheme.secondary.withOpacity(0.6),
              ],
            ),
            borderRadius: BorderRadius.circular(isWeb ? (isLargeScreen ? 30 : 25) : 20),
            boxShadow: isWeb ? [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                blurRadius: 40,
                offset: const Offset(0, 16),
              ),
            ] : null,
          ),
          child: Icon(
            Icons.pets,
            color: Colors.white,
            size: isWeb ? (isLargeScreen ? 60 : 50) : 40,
          ),
        ),
        SizedBox(height: isWeb ? (isLargeScreen ? 24 : 20) : 16),
        Text(
          'Unlock Premium Features',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: isWeb ? (isLargeScreen ? 36 : (isMediumScreen ? 32 : 28)) : null,
            letterSpacing: isWeb ? -0.5 : null,
            height: isWeb ? 1.2 : null,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: isWeb ? (isLargeScreen ? 16 : 12) : 8),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isWeb ? (isLargeScreen ? 40 : 20) : 0,
          ),
          child: Text(
            'Get unlimited access to all animal anatomy content and premium features',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
              fontSize: isWeb ? (isLargeScreen ? 18 : (isMediumScreen ? 16 : 15)) : null,
              height: isWeb ? 1.6 : null,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildSubscriptionPlans(SubscriptionProvider provider) {
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1200;
    
    return Column(
      children: SubscriptionType.values.map((type) {
        final isSelected = _selectedType == type;
        final isPopular = type == SubscriptionType.yearly;
        
        return Container(
          margin: EdgeInsets.only(bottom: isWeb ? 16 : 12),
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedType = type;
                  });
                },
                borderRadius: BorderRadius.circular(isWeb ? 20 : 16),
                hoverColor: isWeb ? Theme.of(context).colorScheme.primary.withOpacity(0.05) : null,
                child: AnimatedContainer(
                  duration: isWeb ? const Duration(milliseconds: 200) : Duration.zero,
                  padding: EdgeInsets.all(isWeb ? (isLargeScreen ? 28 : 24) : 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(isWeb ? 20 : 16),
                    border: Border.all(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : (isWeb ? Theme.of(context).colorScheme.outline.withOpacity(0.2) : Colors.transparent),
                      width: isSelected ? (isWeb ? 3 : 2) : (isWeb ? 1 : 0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(isWeb ? 0.08 : 0.05),
                        blurRadius: isWeb ? (isSelected ? 20 : 15) : 10,
                        offset: Offset(0, isWeb ? (isSelected ? 8 : 4) : 4),
                      ),
                      if (isWeb && isSelected) BoxShadow(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: isWeb ? 28 : 24,
                        height: isWeb ? 28 : 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                            width: isWeb ? 3 : 2,
                          ),
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          boxShadow: isWeb && isSelected ? [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ] : null,
                        ),
                        child: isSelected
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: isWeb ? 18 : 16,
                              )
                            : null,
                      ),
                      SizedBox(width: isWeb ? 20 : 16),
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
                                    fontSize: isWeb ? (isLargeScreen ? 20 : 18) : null,
                                  ),
                                ),
                                if (isPopular) ...[
                                  SizedBox(width: isWeb ? 12 : 8),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isWeb ? 10 : 8,
                                      vertical: isWeb ? 4 : 2,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.warning,
                                          AppColors.warning.withOpacity(0.8),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(isWeb ? 12 : 8),
                                      boxShadow: isWeb ? [
                                        BoxShadow(
                                          color: AppColors.warning.withOpacity(0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ] : null,
                                    ),
                                    child: Text(
                                      'POPULAR',
                                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: isWeb ? 11 : null,
                                        letterSpacing: isWeb ? 0.5 : null,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            SizedBox(height: isWeb ? 8 : 4),
                            Text(
                              type.description,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                fontSize: isWeb ? (isLargeScreen ? 15 : 14) : null,
                                height: isWeb ? 1.4 : null,
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
                              fontSize: isWeb ? (isLargeScreen ? 28 : 24) : null,
                            ),
                          ),
                          Text(
                            '/${type.period}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                              fontSize: isWeb ? (isLargeScreen ? 14 : 13) : null,
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
                  right: isWeb ? 24 : 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isWeb ? 16 : 12,
                      vertical: isWeb ? 6 : 4,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.primary.withOpacity(0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(isWeb ? 12 : 8),
                        bottomRight: Radius.circular(isWeb ? 12 : 8),
                      ),
                      boxShadow: isWeb ? [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ] : null,
                    ),
                    child: Text(
                      'BEST VALUE',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isWeb ? 12 : null,
                        letterSpacing: isWeb ? 0.8 : null,
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
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1200;
    
    return SizedBox(
      width: double.infinity,
      height: isWeb ? (isLargeScreen ? 68 : 64) : 56,
      child: ElevatedButton(
        onPressed: provider.isPurchasing
            ? null
            : () => _handleSubscribe(provider),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: isWeb ? 8 : 4,
          shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isWeb ? 20 : 16),
          ),
        ).copyWith(
          overlayColor: isWeb ? MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.white.withOpacity(0.1);
              }
              if (states.contains(MaterialState.pressed)) {
                return Colors.white.withOpacity(0.2);
              }
              return null;
            },
          ) : null,
        ),
        child: provider.isPurchasing
            ? SizedBox(
                width: isWeb ? 28 : 24,
                height: isWeb ? 28 : 24,
                child: CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: isWeb ? 3 : 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.credit_card,
                    size: isWeb ? 22 : 18,
                  ),
                  SizedBox(width: isWeb ? 12 : 8),
                  Flexible(
                    child: Text(
                      'Subscribe for ${_selectedType.formattedPrice}/${_selectedType.period}',
                      style: TextStyle(
                        fontSize: isWeb ? (isLargeScreen ? 18 : 16) : 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: isWeb ? 0.5 : null,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildRestoreButton(SubscriptionProvider provider) {
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1200;
    
    return SizedBox(
      width: double.infinity,
      height: isWeb ? (isLargeScreen ? 60 : 56) : 48,
      child: TextButton(
        onPressed: provider.isLoading
            ? null
            : () => _handleRestore(provider),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isWeb ? 16 : 12),
            side: isWeb ? BorderSide(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              width: 1,
            ) : BorderSide.none,
          ),
        ).copyWith(
          overlayColor: isWeb ? MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Theme.of(context).colorScheme.primary.withOpacity(0.05);
              }
              return null;
            },
          ) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.refresh,
              color: Theme.of(context).colorScheme.primary,
              size: isWeb ? 20 : 18,
            ),
            SizedBox(width: isWeb ? 8 : 6),
            Text(
              'Restore Purchases',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: isWeb ? (isLargeScreen ? 16 : 15) : 14,
              ),
            ),
          ],
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
