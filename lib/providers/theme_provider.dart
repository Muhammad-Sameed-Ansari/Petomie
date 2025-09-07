import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeOption {
  system,
  light,
  dark,
}

class ThemeProvider extends ChangeNotifier {
  static const String _themeModeKey = 'themeMode';
  ThemeModeOption _themeMode = ThemeModeOption.system;
  bool _systemIsDarkMode = false;

  ThemeModeOption get themeMode => _themeMode;
  bool get isDarkMode {
    switch (_themeMode) {
      case ThemeModeOption.system:
        return _systemIsDarkMode;
      case ThemeModeOption.light:
        return false;
      case ThemeModeOption.dark:
        return true;
    }
  }

  ThemeProvider() {
    _loadThemeFromPrefs();
    _loadSystemTheme();
  }

  void _loadSystemTheme() {
    final Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    _systemIsDarkMode = brightness == Brightness.dark;
    notifyListeners();
  }

  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMode = prefs.getString(_themeModeKey);
    if (savedMode != null) {
      _themeMode = ThemeModeOption.values.firstWhere(
        (mode) => mode.toString() == savedMode,
        orElse: () => ThemeModeOption.system,
      );
    }
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeModeOption mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, mode.toString());
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    switch (_themeMode) {
      case ThemeModeOption.system:
        // If system, toggle to light
        await setThemeMode(ThemeModeOption.light);
        break;
      case ThemeModeOption.light:
        // If light, toggle to dark
        await setThemeMode(ThemeModeOption.dark);
        break;
      case ThemeModeOption.dark:
        // If dark, toggle to system
        await setThemeMode(ThemeModeOption.system);
        break;
    }
  }

  // Legacy method for backward compatibility
  Future<void> setTheme(bool isDark) async {
    await setThemeMode(isDark ? ThemeModeOption.dark : ThemeModeOption.light);
  }

  void updateSystemTheme(bool isDark) {
    _systemIsDarkMode = isDark;
    if (_themeMode == ThemeModeOption.system) {
      notifyListeners();
    }
  }
}
