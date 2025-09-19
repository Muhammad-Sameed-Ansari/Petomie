import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart' as local_auth;
import '../providers/theme_provider.dart';
import '../themes/app_themes.dart';
import '../utils/form_validators.dart';
import '../widgets/auth_components.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeAnimationController, curve: Curves.easeIn),
    );
    _fadeAnimationController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fadeAnimationController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = Provider.of<local_auth.AuthProvider>(context, listen: false);
    final success = await authProvider.signIn(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (success && mounted) {
      // Debug: Print auth state to help identify issues
      debugPrint('Login successful - isSignedIn: ${authProvider.isSignedIn}');
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Login successful!'),
          backgroundColor: AppColors.success,
          duration: const Duration(milliseconds: 1200), // Shorter duration
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      
      // Small delay to ensure auth state propagates, then check if navigation occurred
      await Future.delayed(const Duration(milliseconds: 100));
      
      // The AuthWrapper should automatically handle navigation, 
      // but we'll add a backup just in case
      if (mounted) {
        debugPrint('Checking auth state after delay - isSignedIn: ${authProvider.isSignedIn}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<local_auth.AuthProvider>(context);

    return Scaffold(
      body: AuthBackground(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0).copyWith(
              top: MediaQuery.of(context).padding.top + 16,
            ),
            child: Column(
              children: [
                const SizedBox(height: 60),
                // Logo
                const AuthLogo(size: 120),
                const SizedBox(height: 32),
                // Welcome Text
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDarkMode
                        ? AppColors.darkOnBackground
                        : AppColors.lightOnBackground,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in to continue',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: themeProvider.isDarkMode
                        ? AppColors.darkOnBackground.withOpacity(0.7)
                        : AppColors.lightOnBackground.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 48),
                // Login Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Field
                      AuthTextField(
                        controller: _emailController,
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: FormValidators.validateEmail,
                      ),
                      const SizedBox(height: 20),
                      // Password Field
                      AuthTextField(
                        controller: _passwordController,
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: Icons.lock_outline,
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.done,
                        validator: (value) => FormValidators.validatePassword(value, isLogin: true),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: themeProvider.isDarkMode
                                ? AppColors.darkOnBackground.withOpacity(0.7)
                                : AppColors.lightOnBackground.withOpacity(0.7),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Forgot password feature coming soon!'),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: AppColors.lightPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Login Button
                      AuthButton(
                        text: 'Sign In',
                        onPressed: _handleLogin,
                        isLoading: authProvider.isLoading,
                      ),
                      const SizedBox(height: 24),
                      // Error Message
                      if (authProvider.errorMessage != null)
                        ErrorContainer(errorMessage: authProvider.errorMessage!),
                      const SizedBox(height: 32),
                      // Register Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: themeProvider.isDarkMode
                                  ? AppColors.darkOnBackground.withOpacity(0.7)
                                  : AppColors.lightOnBackground.withOpacity(0.7),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                      const RegisterScreen(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: AppColors.lightPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}