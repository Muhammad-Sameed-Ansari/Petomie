import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color lightPrimary = Color(0xFF5FA9C6); // Light Blue
  static const Color lightSecondary = Color(0xFFC8A873); // Soft Gold
  static const Color lightBackground = Color(0xFFF5F1E6); // Cream
  static const Color lightSurface = Color(0xFFFFFFFF); // White
  static const Color lightOnPrimary = Color(0xFFFFFFFF); // White
  static const Color lightOnSecondary = Color(0xFF3E2F1F); // Dark Brown
  static const Color lightOnBackground = Color(0xFF3E2F1F); // Dark Brown

  // Dark Theme Colors
  static const Color darkPrimary = Color(0xFF5FA9C6); // Light Blue (keeps consistency)
  static const Color darkSecondary = Color(0xFFC8A873); // Soft Gold
  static const Color darkBackground = Color(0xFF1C1A16); // Dark Brown
  static const Color darkSurface = Color(0xFF2A2622); // Dark Surface
  static const Color darkOnPrimary = Color(0xFFFFFFFF); // White
  static const Color darkOnSecondary = Color(0xFFF5F1E6); // Beige
  static const Color darkOnBackground = Color(0xFFF5F1E6); // Beige

  // Common Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
}

class AppThemes {
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Primary Colors
      primaryColor: AppColors.lightPrimary,
      colorScheme: ColorScheme.light(
        primary: AppColors.lightPrimary,
        secondary: AppColors.lightSecondary,
        surface: AppColors.lightSurface,
        background: AppColors.lightBackground,
        error: AppColors.error,
        onPrimary: AppColors.lightOnPrimary,
        onSecondary: AppColors.lightOnSecondary,
        onSurface: AppColors.lightOnBackground,
        onBackground: AppColors.lightOnBackground,
        onError: Colors.white,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: AppColors.lightOnPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.lightOnPrimary,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.lightSurface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightPrimary,
          foregroundColor: AppColors.lightOnPrimary,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.lightPrimary,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.lightPrimary,
          side: BorderSide(color: AppColors.lightPrimary),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightSecondary.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightSecondary.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightPrimary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle: TextStyle(color: AppColors.lightOnBackground.withOpacity(0.7)),
        hintStyle: TextStyle(color: AppColors.lightOnBackground.withOpacity(0.5)),
      ),

      // Text Themes
      textTheme: TextTheme(
        displayLarge: TextStyle(color: AppColors.lightOnBackground, fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(color: AppColors.lightOnBackground, fontSize: 28, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(color: AppColors.lightOnBackground, fontSize: 24, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(color: AppColors.lightOnBackground, fontSize: 22, fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(color: AppColors.lightOnBackground, fontSize: 20, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(color: AppColors.lightOnBackground, fontSize: 18, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(color: AppColors.lightOnBackground, fontSize: 16, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(color: AppColors.lightOnBackground, fontSize: 14, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(color: AppColors.lightOnBackground, fontSize: 12, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: AppColors.lightOnBackground, fontSize: 16),
        bodyMedium: TextStyle(color: AppColors.lightOnBackground, fontSize: 14),
        bodySmall: TextStyle(color: AppColors.lightOnBackground, fontSize: 12),
        labelLarge: TextStyle(color: AppColors.lightOnBackground, fontSize: 14, fontWeight: FontWeight.w500),
        labelMedium: TextStyle(color: AppColors.lightOnBackground, fontSize: 12, fontWeight: FontWeight.w500),
        labelSmall: TextStyle(color: AppColors.lightOnBackground, fontSize: 10, fontWeight: FontWeight.w500),
      ),

      // Scaffold Background
      scaffoldBackgroundColor: AppColors.lightBackground,

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.lightSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // SnackBar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.lightSurface,
        contentTextStyle: TextStyle(color: AppColors.lightOnBackground),
        actionTextColor: AppColors.lightPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Primary Colors
      primaryColor: AppColors.darkPrimary,
      colorScheme: ColorScheme.dark(
        primary: AppColors.darkPrimary,
        secondary: AppColors.darkSecondary,
        surface: AppColors.darkSurface,
        background: AppColors.darkBackground,
        error: AppColors.error,
        onPrimary: AppColors.darkOnPrimary,
        onSecondary: AppColors.darkOnSecondary,
        onSurface: AppColors.darkOnBackground,
        onBackground: AppColors.darkOnBackground,
        onError: Colors.white,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: AppColors.darkOnPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.darkOnPrimary,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkPrimary,
          foregroundColor: AppColors.darkOnPrimary,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.darkPrimary,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.darkPrimary,
          side: BorderSide(color: AppColors.darkPrimary),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.darkSecondary.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.darkSecondary.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.darkPrimary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle: TextStyle(color: AppColors.darkOnBackground.withOpacity(0.7)),
        hintStyle: TextStyle(color: AppColors.darkOnBackground.withOpacity(0.5)),
      ),

      // Text Themes
      textTheme: TextTheme(
        displayLarge: TextStyle(color: AppColors.darkOnBackground, fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(color: AppColors.darkOnBackground, fontSize: 28, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(color: AppColors.darkOnBackground, fontSize: 24, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(color: AppColors.darkOnBackground, fontSize: 22, fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(color: AppColors.darkOnBackground, fontSize: 20, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(color: AppColors.darkOnBackground, fontSize: 18, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(color: AppColors.darkOnBackground, fontSize: 16, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(color: AppColors.darkOnBackground, fontSize: 14, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(color: AppColors.darkOnBackground, fontSize: 12, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: AppColors.darkOnBackground, fontSize: 16),
        bodyMedium: TextStyle(color: AppColors.darkOnBackground, fontSize: 14),
        bodySmall: TextStyle(color: AppColors.darkOnBackground, fontSize: 12),
        labelLarge: TextStyle(color: AppColors.darkOnBackground, fontSize: 14, fontWeight: FontWeight.w500),
        labelMedium: TextStyle(color: AppColors.darkOnBackground, fontSize: 12, fontWeight: FontWeight.w500),
        labelSmall: TextStyle(color: AppColors.darkOnBackground, fontSize: 10, fontWeight: FontWeight.w500),
      ),

      // Scaffold Background
      scaffoldBackgroundColor: AppColors.darkBackground,

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // SnackBar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.darkSurface,
        contentTextStyle: TextStyle(color: AppColors.darkOnBackground),
        actionTextColor: AppColors.darkPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
