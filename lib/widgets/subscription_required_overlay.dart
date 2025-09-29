import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../themes/app_themes.dart';

class SubscriptionRequiredOverlay extends StatelessWidget {
  final String animalType;
  final String categoryType;
  final VoidCallback onSubscribe;
  final VoidCallback onGoBack;

  const SubscriptionRequiredOverlay({
    super.key,
    required this.animalType,
    required this.categoryType,
    required this.onSubscribe,
    required this.onGoBack,
  });

  @override
  Widget build(BuildContext context) {
    final isWeb = kIsWeb;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 800;
    
    return Scaffold(
      backgroundColor: isWeb 
          ? Theme.of(context).colorScheme.background.withOpacity(0.95)
          : Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isWeb ? (isLargeScreen ? 600 : 500) : double.infinity,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(isWeb ? (isLargeScreen ? 40 : 32) : 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: isWeb ? 40 : 60),
                  
                  // Premium icon with enhanced web styling
                  Container(
                    width: isWeb ? 120 : 100,
                    height: isWeb ? 120 : 100,
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
                      borderRadius: BorderRadius.circular(isWeb ? 30 : 25),
                      boxShadow: isWeb ? [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ] : null,
                    ),
                    child: Icon(
                      Icons.workspace_premium,
                      color: Colors.white,
                      size: isWeb ? 60 : 50,
                    ),
                  ),
                  SizedBox(height: isWeb ? 40 : 32),

                  // Title with enhanced typography for web
                  Text(
                    'Premium Content',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: isWeb ? (isLargeScreen ? 36 : 32) : null,
                      letterSpacing: isWeb ? -0.5 : null,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isWeb ? 20 : 16),

                  // Enhanced description for web
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isWeb ? 20 : 0,
                    ),
                    child: Text(
                      'The $categoryType section for $animalType anatomy requires a premium subscription. Unlock detailed anatomical information and comprehensive content.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                        fontSize: isWeb ? (isLargeScreen ? 18 : 16) : null,
                        height: isWeb ? 1.6 : null,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: isWeb ? 40 : 32),

                  // Enhanced features preview for web
                  Card(
                    elevation: isWeb ? 8 : 0,
                    color: Theme.of(context).colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(isWeb ? 20 : 16),
                    ),
                    shadowColor: isWeb 
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                        : null,
                    child: Padding(
                      padding: EdgeInsets.all(isWeb ? (isLargeScreen ? 32 : 24) : 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: isWeb ? 32 : 24,
                                height: isWeb ? 32 : 24,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context).colorScheme.primary,
                                      Theme.of(context).colorScheme.secondary,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: isWeb ? 18 : 14,
                                ),
                              ),
                              SizedBox(width: isWeb ? 16 : 12),
                              Text(
                                'Premium Features',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onSurface,
                                  fontSize: isWeb ? (isLargeScreen ? 22 : 20) : null,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: isWeb ? 20 : 12),
                          ...[
                            'Complete anatomical information',
                            'High-quality detailed diagrams',
                            'Comprehensive system breakdowns',
                            'Interactive learning content',
                            'Offline access to all content'
                          ].map((feature) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: isWeb ? 12 : 8),
                              child: Row(
                                children: [
                                  Container(
                                    width: isWeb ? 24 : 20,
                                    height: isWeb ? 24 : 20,
                                    decoration: BoxDecoration(
                                      color: AppColors.success.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(isWeb ? 6 : 4),
                                      border: isWeb ? Border.all(
                                        color: AppColors.success.withOpacity(0.3),
                                        width: 1,
                                      ) : null,
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: AppColors.success,
                                      size: isWeb ? 16 : 14,
                                    ),
                                  ),
                                  SizedBox(width: isWeb ? 16 : 12),
                                  Expanded(
                                    child: Text(
                                      feature,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: Theme.of(context).colorScheme.onSurface,
                                        fontSize: isWeb ? (isLargeScreen ? 16 : 15) : null,
                                        height: isWeb ? 1.5 : null,
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
                  ),
                  SizedBox(height: isWeb ? 40 : 32),

                  // Enhanced action buttons for web
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: isWeb ? (isLargeScreen ? 64 : 60) : 56,
                        child: ElevatedButton(
                          onPressed: onSubscribe,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                size: isWeb ? 20 : 16,
                              ),
                              SizedBox(width: isWeb ? 12 : 8),
                              Text(
                                'Get Premium Access',
                                style: TextStyle(
                                  fontSize: isWeb ? (isLargeScreen ? 18 : 16) : 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: isWeb ? 0.5 : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: isWeb ? 16 : 12),

                      SizedBox(
                        width: double.infinity,
                        height: isWeb ? (isLargeScreen ? 56 : 52) : 48,
                        child: TextButton(
                          onPressed: onGoBack,
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(isWeb ? 16 : 12),
                              side: isWeb ? BorderSide(
                                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                                width: 1,
                              ) : BorderSide.none,
                            ),
                          ).copyWith(
                            overlayColor: isWeb ? MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Theme.of(context).colorScheme.onBackground.withOpacity(0.05);
                                }
                                return null;
                              },
                            ) : null,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: isWeb ? 18 : 16,
                                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                              ),
                              SizedBox(width: isWeb ? 8 : 6),
                              Text(
                                'Go Back',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                  fontSize: isWeb ? (isLargeScreen ? 16 : 15) : 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isWeb ? 60 : 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
