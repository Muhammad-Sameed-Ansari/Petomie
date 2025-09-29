import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart' as local_auth;
import '../providers/subscription_provider.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import 'subscription_wrapper.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<local_auth.AuthProvider, SubscriptionProvider>(
      builder: (context, authProvider, subscriptionProvider, child) {
        // Show loading indicator while auth is in progress
        if (authProvider.isLoading) {
          debugPrint('AuthWrapper: Showing loading screen');
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Show login screen if user is not authenticated
        if (!authProvider.isSignedIn) {
          // Clear subscription data when user is not signed in
          WidgetsBinding.instance.addPostFrameCallback((_) {
            subscriptionProvider.clearSubscription();
          });
          return const LoginScreen();
        }

        // User is authenticated, show home screen directly
        debugPrint('AuthWrapper: User authenticated - showing home screen for ${authProvider.currentUser?.email}');
        return const HomeScreen();
      },
    );
  }
}
