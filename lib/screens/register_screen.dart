import 'package:flutter/foundation.dart';
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
  bool _acceptTerms = false;
  bool _acceptDisclaimer = false;
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

    // Check if terms and conditions are accepted
    if (!_acceptTerms || !_acceptDisclaimer) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept both Terms & Conditions and Disclaimer to continue'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

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

  // Password strength calculation methods
  int _calculatePasswordStrength(String password) {
    int strength = 0;
    
    if (password.length >= 8) strength += 1;
    if (password.contains(RegExp(r'[A-Z]'))) strength += 1;
    if (password.contains(RegExp(r'[a-z]'))) strength += 1;
    if (password.contains(RegExp(r'[0-9]')) || password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength += 1;
    
    return strength;
  }

  // Individual password requirement checks
  bool _hasMinLength(String password) => password.length >= 6;
  bool _hasUppercase(String password) => password.contains(RegExp(r'[A-Z]'));
  bool _hasLowercase(String password) => password.contains(RegExp(r'[a-z]'));
  bool _hasNumber(String password) => password.contains(RegExp(r'[0-9]'));

  String _getPasswordStrengthText(int strength) {
    switch (strength) {
      case 0:
      case 1:
        return 'Weak';
      case 2:
        return 'Fair';
      case 3:
        return 'Good';
      case 4:
        return 'Strong';
      default:
        return 'Weak';
    }
  }

  Color _getPasswordStrengthColor(int strength) {
    switch (strength) {
      case 0:
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.yellow.shade700;
      case 4:
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  Widget _buildPasswordStrengthIndicator(String password, ThemeProvider themeProvider) {
    if (password.isEmpty) return const SizedBox.shrink();
    
    final strength = _calculatePasswordStrength(password);
    final strengthText = _getPasswordStrengthText(strength);
    final strengthColor = _getPasswordStrengthColor(strength);
    
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Password strength: ',
                style: TextStyle(
                  fontSize: 12,
                  color: themeProvider.isDarkMode
                      ? AppColors.darkOnBackground.withOpacity(0.7)
                      : AppColors.lightOnBackground.withOpacity(0.7),
                ),
              ),
              Text(
                strengthText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: strengthColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: List.generate(4, (index) {
              return Expanded(
                child: Container(
                  height: 3,
                  margin: EdgeInsets.only(right: index < 3 ? 2 : 0),
                  decoration: BoxDecoration(
                    color: index < strength ? strengthColor : Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(1.5),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordMatchIndicator(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) return const SizedBox.shrink();
    
    final passwordsMatch = password == confirmPassword;
    
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Icon(
            passwordsMatch ? Icons.check_circle : Icons.cancel,
            size: 16,
            color: passwordsMatch ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 6),
          Text(
            passwordsMatch ? 'Passwords match' : 'Passwords don\'t match',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: passwordsMatch ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordRequirement(String text, bool isMet, ThemeProvider themeProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(
            isMet ? Icons.check_circle : Icons.cancel,
            size: 16,
            color: isMet ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: isMet 
                    ? Colors.green 
                    : (themeProvider.isDarkMode
                        ? AppColors.darkOnBackground.withOpacity(0.7)
                        : AppColors.lightOnBackground.withOpacity(0.7)),
                fontWeight: isMet ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showTermsAndConditions() async {
    const String termsText = '''📜 Terms & Conditions — Petomie App

Last Updated: October 2025

Welcome to Petomie, a digital educational platform owned and operated by Healer Map ("we," "our," "us"), located in Canina, QLD, Australia.
These Terms & Conditions ("Terms") govern your access to and use of the Petomie App (the "App") and any related services (collectively, the "Service").
By downloading, accessing, or using Petomie, you agree to these Terms. If you do not agree, please do not use the App.

---

1. Purpose of the App
Petomie is designed for educational and informational purposes only.
The app provides general information about animal anatomy, energy systems, and holistic wellness concepts.
It does not provide veterinary, medical, or therapeutic advice, diagnosis, or treatment of any kind.
Always consult a qualified veterinarian or healthcare professional before making decisions regarding an animal's health.

---

2. Account Registration
To use Petomie, you may create a user profile by providing your name and email address.
You agree to provide accurate, current, and complete information.
You are responsible for maintaining the confidentiality of your login credentials and for all activity under your account.
We do not allow users to upload content, files, or images to the App.

---

3. License to Use
You are granted a limited, non-exclusive, non-transferable, revocable license to use the App for personal, non-commercial, educational use only.
You agree not to:
- Copy, reproduce, or distribute the App's content without permission.
- Modify, decompile, or reverse engineer the App.
- Use the App in any way that violates applicable law or infringes on intellectual property rights.

All intellectual property contained within Petomie (including text, illustrations, data, and design elements) is owned by Healer Map and protected under international copyright law.

---

4. Data Collection & Privacy
Petomie collects minimal personal information — specifically name and email address — solely for account creation, communication, and functionality of the App.
We do not collect sensitive data, financial details, or location tracking information.
For more details, please refer to our Privacy Policy.

---

5. Educational Disclaimer
While we aim to ensure accuracy and clarity, errors, omissions, or inaccuracies may occur.
Petomie and Healer Map make no warranties regarding the accuracy, completeness, reliability, or suitability of any content.
All information is provided "as is," without any express or implied warranty.
The use of the App and its information is at your own risk.

You acknowledge and agree that:
- The App does not replace professional veterinary or medical care.
- The information is general and not specific to any individual animal or condition.
- Healer Map and Petomie shall not be held liable for any loss, injury, or damage resulting from your reliance on the App's content.

---

6. Limitation of Liability
To the maximum extent permitted by law, Healer Map and its owners, affiliates, or contributors shall not be liable for any damages, losses, or injuries (including direct, indirect, incidental, or consequential damages) arising from:
- Use or inability to use the App,
- Reliance on any information provided within it, or
- Errors, omissions, or interruptions in service.

If liability cannot be excluded under applicable law, our total liability shall not exceed AUD \$100 or the equivalent in your local currency.

---

7. Modifications
We reserve the right to update or modify these Terms at any time.
Changes will take effect immediately upon posting within the App.
Your continued use of the App after changes are posted constitutes your acceptance of the revised Terms.

---

8. Termination
We may terminate or suspend your access to the App at any time, with or without notice, if you violate these Terms or for operational reasons.
Upon termination, your right to use the App will cease immediately.

---

9. Governing Law
These Terms are governed by and construed in accordance with the laws of Queensland, Australia, and applicable Australian Consumer Law.
Any disputes arising under these Terms shall be subject to the exclusive jurisdiction of the courts of Queensland, Australia.

---

10. Contact Information
If you have questions about these Terms, please contact:
Healer Map
Canina, QLD, Australia
Email: Info@petomieapp.com''';

    await _showDocumentDialog(
      title: 'Terms & Conditions',
      content: termsText,
    );
  }

  Future<void> _showDisclaimer() async {
    const String disclaimerText = '''📜 Petomie App Disclaimer

Last Updated: October 2025

The information provided within the Petomie App is intended solely for educational and informational purposes. It is not a substitute for professional veterinary diagnosis, treatment, or advice. Always seek the guidance of a qualified veterinarian or other licensed animal health professional with any questions you may have regarding your animal's health, medical condition, or well-being.

While every effort has been made to ensure that the information contained in this app is accurate, errors, omissions, or inaccuracies may occur. Petomie, its creators, contributors, and affiliates make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability, or availability of the information, services, or graphics contained within the app. Any reliance you place on such information is therefore strictly at your own risk.

Under no circumstances shall Petomie or its creators be held liable for any loss, injury, claim, liability, or damage of any kind (including, without limitation, direct, indirect, incidental, consequential, or punitive damages) arising from your use of or reliance on the app or the information contained within it.

By using the Petomie App, you acknowledge and agree that:
- You are solely responsible for any decisions you make based on the information provided.
- The app does not provide medical, veterinary, or therapeutic advice, diagnosis, or treatment.
- The app's content may vary across regions and is not intended to comply with specific country regulations regarding veterinary medicine.
- Technical or typographical errors may occur, and information may become outdated or inaccurate over time.
- You will not hold Petomie or its team legally liable for any damages or outcomes related to the use, misuse, or interpretation of the app's information.

Petomie and its creators reserve the right to modify, update, or remove content at any time without notice. Continued use of the app following any such changes constitutes your acceptance of those modifications.

If you are concerned about your animal's health or suspect a medical condition, please contact a licensed veterinarian immediately.''';

    await _showDocumentDialog(
      title: 'Disclaimer',
      content: disclaimerText,
    );
  }

  Future<void> _showDocumentDialog({
    required String title,
    required String content,
  }) async {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 600,
              maxHeight: 700,
            ),
            decoration: BoxDecoration(
              color: themeProvider.isDarkMode
                  ? AppColors.darkSurface
                  : AppColors.lightSurface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.lightPrimary.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.article_outlined,
                        color: AppColors.lightPrimary,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: themeProvider.isDarkMode
                                ? AppColors.darkOnBackground
                                : AppColors.lightOnBackground,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close,
                          color: themeProvider.isDarkMode
                              ? AppColors.darkOnBackground
                              : AppColors.lightOnBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      content,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: themeProvider.isDarkMode
                            ? AppColors.darkOnBackground.withOpacity(0.9)
                            : AppColors.lightOnBackground.withOpacity(0.9),
                      ),
                    ),
                  ),
                ),
                // Footer
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: themeProvider.isDarkMode
                        ? AppColors.darkSurface.withOpacity(0.5)
                        : AppColors.lightSurface.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightPrimary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Close',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAgreementCheckbox({
    required String title,
    required String linkText,
    required bool value,
    required ValueChanged<bool?> onChanged,
    required VoidCallback onLinkTap,
    required ThemeProvider themeProvider,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode
            ? AppColors.darkSurface.withOpacity(0.3)
            : AppColors.lightSurface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: value
              ? AppColors.lightPrimary.withOpacity(0.5)
              : (themeProvider.isDarkMode
                  ? AppColors.darkOnBackground.withOpacity(0.2)
                  : AppColors.lightOnBackground.withOpacity(0.2)),
          width: value ? 2 : 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.lightPrimary,
              checkColor: Colors.white,
              side: BorderSide(
                color: themeProvider.isDarkMode
                    ? AppColors.darkOnBackground.withOpacity(0.5)
                    : AppColors.lightOnBackground.withOpacity(0.5),
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                RichText(
                  text: TextSpan(
                    text: '$title ',
                    style: TextStyle(
                      fontSize: 14,
                      color: themeProvider.isDarkMode
                          ? AppColors.darkOnBackground
                          : AppColors.lightOnBackground,
                    ),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: onLinkTap,
                          child: Text(
                            linkText,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.lightPrimary,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<local_auth.AuthProvider>(context);

    return Scaffold(
      body: AuthBackground(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400, // Constrain width for web
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).copyWith(
                  top: MediaQuery.of(context).padding.top + 16,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // Back Button (hidden on web)
                    if (!kIsWeb)
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
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.next,
                        validator: FormValidators.validatePassword,
                        onChanged: (value) => setState(() {}), // Update indicators in real-time
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Create a strong password',
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: themeProvider.isDarkMode
                                ? AppColors.darkOnBackground.withOpacity(0.7)
                                : AppColors.lightOnBackground.withOpacity(0.7),
                          ),
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
                        style: TextStyle(
                          color: themeProvider.isDarkMode
                              ? AppColors.darkOnBackground
                              : AppColors.lightOnBackground,
                        ),
                      ),
                      // Password strength indicator
                      _buildPasswordStrengthIndicator(_passwordController.text, themeProvider),
                      const SizedBox(height: 20),
                      // Confirm Password Field
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: _obscureConfirmPassword,
                        textInputAction: TextInputAction.done,
                        validator: (value) => FormValidators.validateConfirmPassword(
                          value,
                          _passwordController.text,
                        ),
                        onChanged: (value) => setState(() {}), // Update indicators in real-time
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Re-enter your password',
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: themeProvider.isDarkMode
                                ? AppColors.darkOnBackground.withOpacity(0.7)
                                : AppColors.lightOnBackground.withOpacity(0.7),
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
                        style: TextStyle(
                          color: themeProvider.isDarkMode
                              ? AppColors.darkOnBackground
                              : AppColors.lightOnBackground,
                        ),
                      ),
                      // Password match indicator
                      _buildPasswordMatchIndicator(_passwordController.text, _confirmPasswordController.text),
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
                            const SizedBox(height: 8),
                            _buildPasswordRequirement(
                              'At least 6 characters',
                              _hasMinLength(_passwordController.text),
                              themeProvider,
                            ),
                            _buildPasswordRequirement(
                              'One uppercase letter',
                              _hasUppercase(_passwordController.text),
                              themeProvider,
                            ),
                            _buildPasswordRequirement(
                              'One lowercase letter',
                              _hasLowercase(_passwordController.text),
                              themeProvider,
                            ),
                            _buildPasswordRequirement(
                              'One number',
                              _hasNumber(_passwordController.text),
                              themeProvider,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Terms and Conditions Section
                      _buildAgreementCheckbox(
                        title: 'I agree to the',
                        linkText: 'Terms & Conditions',
                        value: _acceptTerms,
                        onChanged: (value) => setState(() => _acceptTerms = value ?? false),
                        onLinkTap: _showTermsAndConditions,
                        themeProvider: themeProvider,
                      ),
                      const SizedBox(height: 12),
                      // Disclaimer Section
                      _buildAgreementCheckbox(
                        title: 'I have read and understand the',
                        linkText: 'Disclaimer',
                        value: _acceptDisclaimer,
                        onChanged: (value) => setState(() => _acceptDisclaimer = value ?? false),
                        onLinkTap: _showDisclaimer,
                        themeProvider: themeProvider,
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
        ),
      ),
    );
  }
}