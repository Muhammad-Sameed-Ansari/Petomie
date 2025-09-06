import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart' as local_auth;
import '../providers/theme_provider.dart';
import '../themes/app_themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<local_auth.AuthProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Petomie'),
        actions: [
          // Theme toggle button
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
          // Logout button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authProvider.signOut();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out successfully')),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: themeProvider.isDarkMode
                    ? AppColors.darkSurface
                    : AppColors.lightSurface,
                boxShadow: [
                  BoxShadow(
                    color: themeProvider.isDarkMode
                        ? AppColors.darkPrimary.withOpacity(0.2)
                        : AppColors.lightPrimary.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'assets/images/logo_tranparent.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 32),

            Text(
              'Welcome to Petomie!',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDarkMode
                        ? AppColors.darkOnBackground
                        : AppColors.lightOnBackground,
                  ),
            ),

            const SizedBox(height: 16),

            Text(
              'You are successfully logged in',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: themeProvider.isDarkMode
                        ? AppColors.darkOnBackground.withOpacity(0.7)
                        : AppColors.lightOnBackground.withOpacity(0.7),
                  ),
            ),

            const SizedBox(height: 8),

            Text(
              authProvider.currentUser?.email ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.lightPrimary,
                    fontWeight: FontWeight.w500,
                  ),
            ),

            const SizedBox(height: 48),

            // Theme info card
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Current Theme',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      themeProvider.isDarkMode ? 'Dark Mode' : 'Light Mode',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Tap the theme icon in the app bar to switch themes',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: themeProvider.isDarkMode
                                ? AppColors.darkOnBackground.withOpacity(0.7)
                                : AppColors.lightOnBackground.withOpacity(0.7),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
