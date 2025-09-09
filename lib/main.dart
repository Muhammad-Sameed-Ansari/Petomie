import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'providers/theme_provider.dart';
import 'providers/auth_provider.dart' as local_auth;
import 'providers/subscription_provider.dart';
import 'services/subscription_service.dart';
import 'widgets/auth_wrapper.dart';
import 'themes/app_themes.dart';
import 'config/subscription_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Subscription Service
  try {
    // Only initialize if configuration is valid
    if (SubscriptionConfig.validateConfiguration()) {
      await SubscriptionService().initialize(
        apiKey: SubscriptionConfig.currentPlatformApiKey,
      );
    } else {
      debugPrint('Subscription service not initialized: Invalid configuration');
      debugPrint('Please update your subscription configuration in lib/config/subscription_config.dart');
    }
  } catch (e) {
    debugPrint('Failed to initialize subscription service: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late local_auth.AuthProvider _authProvider;
  late SubscriptionProvider _subscriptionProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    
    // Initialize providers
    _authProvider = local_auth.AuthProvider();
    _subscriptionProvider = SubscriptionProvider();
    
    // Listen to auth state changes to sync subscription service
    _authProvider.authStateChanges.listen((user) {
      if (user != null) {
        // User logged in - set user ID for subscription service
        SubscriptionService().setUserId(user.uid);
      } else {
        // User logged out - clear subscription service user
        SubscriptionService().clearUser();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    SubscriptionService().dispose();
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    // Update theme provider when system theme changes
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final Brightness brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    themeProvider.updateSystemTheme(brightness == Brightness.dark);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider.value(value: _authProvider),
        ChangeNotifierProvider.value(value: _subscriptionProvider),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Petomie',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.getLightTheme(),
            darkTheme: AppThemes.getDarkTheme(),
            themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const AuthWrapper(),
          );
        },
      ),
    );
  }
}
