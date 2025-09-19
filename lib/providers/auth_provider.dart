import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _currentUser;

  AuthProvider() {
    _currentUser = _authService.currentUser;
    // Listen to auth state changes and notify listeners
    _authService.authStateChanges.listen((User? user) {
      if (_currentUser != user) {
        _currentUser = user;
        notifyListeners();
      }
    });
  }

  AuthService get authService => _authService;

  User? get currentUser => _currentUser;
  Stream<User?> get authStateChanges => _authService.authStateChanges;
  bool get isSignedIn => _currentUser != null;

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Sign in
  Future<bool> signIn(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final userCredential = await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Update current user immediately to avoid race condition
      if (userCredential?.user != null) {
        _currentUser = userCredential!.user;
        debugPrint('AuthProvider: User signed in immediately - ${_currentUser?.email}');
      }
      
      _isLoading = false;
      notifyListeners();
      debugPrint('AuthProvider: Sign-in completed, isSignedIn: $isSignedIn');
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  // Register
  Future<bool> register(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final userCredential = await _authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Update current user immediately to avoid race condition
      if (userCredential?.user != null) {
        _currentUser = userCredential!.user;
      }
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _authService.signOut();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  // Password reset
  Future<bool> resetPassword(String email) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authService.sendPasswordResetEmail(email);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  // Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
