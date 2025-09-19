import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              
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
                'Premium Content',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                'The $categoryType section for $animalType anatomy requires a premium subscription. Unlock detailed anatomical information and comprehensive content.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Features preview
              Card(
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
                      ...[
                        'Complete anatomical information',
                        'High-quality detailed diagrams',
                        'Comprehensive system breakdowns',
                        'Interactive learning content',
                        'Offline access to all content'
                      ].map((feature) {
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
              ),
              const SizedBox(height: 32),

              // Action buttons
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: onSubscribe,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Get Premium Access',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              TextButton(
                onPressed: onGoBack,
                child: Text(
                  'Go Back',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
