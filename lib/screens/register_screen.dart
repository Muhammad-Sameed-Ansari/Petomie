import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart' as local_auth;
import '../providers/theme_provider.dart';
import '../themes/app_themes.dart';
import '../utils/form_validators.dart';
import '../widgets/auth_components.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
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
    _confirmPasswordController.dispose();
    _fadeAnimationController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = Provider.of<local_auth.AuthProvider>(context, listen: false);
    final success = await authProvider.register(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully!'),
          backgroundColor: AppColors.success,
        ),
      );
      Navigator.of(context).pop();
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
                const SizedBox(height: 40),
                // Back Button
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: themeProvider.isDarkMode
                          ? AppColors.darkOnBackground
                          : AppColors.lightOnBackground,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Logo
                const AuthLogo(size: 100),
                const SizedBox(height: 32),
                // Welcome Text
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDarkMode
                        ? AppColors.darkOnBackground
                        : AppColors.lightOnBackground,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Join us and start your journey',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: themeProvider.isDarkMode
                        ? AppColors.darkOnBackground.withOpacity(0.7)
                        : AppColors.lightOnBackground.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 48),
                // Registration Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Field
                      AuthTextField(
                        controller: _emailController,
                        labelText: 'Email',
                        hintText: 'Enter your email address',
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
                        hintText: 'Create a strong password',
                        prefixIcon: Icons.lock_outline,
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.next,
                        validator: FormValidators.validatePassword,
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
                      const SizedBox(height: 20),
                      // Confirm Password Field
                      AuthTextField(
                        controller: _confirmPasswordController,
                        labelText: 'Confirm Password',
                        hintText: 'Re-enter your password',
                        prefixIcon: Icons.lock_outline,
                        obscureText: _obscureConfirmPassword,
                        textInputAction: TextInputAction.done,
                        validator: (value) => FormValidators.validateConfirmPassword(
                          value,
                          _passwordController.text,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                            color: themeProvider.isDarkMode
                                ? AppColors.darkOnBackground.withOpacity(0.7)
                                : AppColors.lightOnBackground.withOpacity(0.7),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword = !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Password Requirements
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: themeProvider.isDarkMode
                              ? AppColors.darkSurface.withOpacity(0.5)
                              : AppColors.lightSurface.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password Requirements:',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: themeProvider.isDarkMode
                                    ? AppColors.darkOnBackground
                                    : AppColors.lightOnBackground,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '• At least 6 characters\n• One uppercase letter\n• One lowercase letter\n• One number',
                              style: TextStyle(
                                fontSize: 12,
                                color: themeProvider.isDarkMode
                                    ? AppColors.darkOnBackground.withOpacity(0.7)
                                    : AppColors.lightOnBackground.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Register Button
                      AuthButton(
                        text: 'Create Account',
                        onPressed: _handleRegister,
                        isLoading: authProvider.isLoading,
                      ),
                      const SizedBox(height: 24),
                      // Error Message
                      if (authProvider.errorMessage != null)
                        ErrorContainer(errorMessage: authProvider.errorMessage!),
                      const SizedBox(height: 32),
                      // Login Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: themeProvider.isDarkMode
                                  ? AppColors.darkOnBackground.withOpacity(0.7)
                                  : AppColors.lightOnBackground.withOpacity(0.7),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                      const LoginScreen(),
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
                              'Sign In',
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