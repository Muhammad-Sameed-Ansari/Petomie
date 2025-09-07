import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart' as local_auth;
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<local_auth.AuthProvider>(
      builder: (context, authProvider, child) {
        // Show loading indicator while auth is in progress
        if (authProvider.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Show login screen if user is not authenticated
        if (!authProvider.isSignedIn) {
          return const LoginScreen();
        }

        // Show home screen if user is authenticated
        return const HomeScreen();
      },
    );
  }
}
