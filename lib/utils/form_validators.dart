class FormValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value, {bool isLogin = false}) {
    if (value == null || value.isEmpty) {
      return 'Please enter ${isLogin ? 'your' : 'a'} password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    
    // Additional validation for registration
    if (!isLogin) {
      if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
        return 'Password must contain at least one uppercase letter';
      }
      if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
        return 'Password must contain at least one lowercase letter';
      }
      if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
        return 'Password must contain at least one number';
      }
    }
    
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
