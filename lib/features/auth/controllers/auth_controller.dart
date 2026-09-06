import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/services/auth_service.dart';

/// Drives the Login, Register, and Forgot Password screens. All auth is
/// mock/local for now via [AuthService] — swap that service's internals
/// for real API/Supabase calls later without touching these views.
class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  // Login
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final RxBool loginPasswordVisible = false.obs;
  final RxBool isLoggingIn = false.obs;
  final RxnString loginError = RxnString();

  // Register
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final RxBool registerPasswordVisible = false.obs;
  final RxBool isRegistering = false.obs;
  final RxnString registerError = RxnString();

  // Forgot password
  final forgotEmailController = TextEditingController();
  final RxBool isSendingReset = false.obs;
  final RxBool resetEmailSent = false.obs;

  void toggleLoginPasswordVisibility() =>
      loginPasswordVisible.value = !loginPasswordVisible.value;

  void toggleRegisterPasswordVisibility() =>
      registerPasswordVisible.value = !registerPasswordVisible.value;

  Future<void> login() async {
    final email = loginEmailController.text.trim();
    final password = loginPasswordController.text;

    if (email.isEmpty || !GetUtils.isEmail(email)) {
      loginError.value = 'Enter a valid email address';
      return;
    }
    if (password.length < 6) {
      loginError.value = 'Password must be at least 6 characters';
      return;
    }

    loginError.value = null;
    isLoggingIn.value = true;
    await _authService.login(email: email, password: password);
    isLoggingIn.value = false;
    Get.offAllNamed(AppRoutes.main);
  }

  Future<void> register() async {
    final name = registerNameController.text.trim();
    final email = registerEmailController.text.trim();
    final password = registerPasswordController.text;

    if (name.isEmpty) {
      registerError.value = 'Enter your full name';
      return;
    }
    if (!GetUtils.isEmail(email)) {
      registerError.value = 'Enter a valid email address';
      return;
    }
    if (password.length < 6) {
      registerError.value = 'Password must be at least 6 characters';
      return;
    }

    registerError.value = null;
    isRegistering.value = true;
    await _authService.register(name: name, email: email, password: password);
    isRegistering.value = false;
    Get.offAllNamed(AppRoutes.main);
  }

  Future<void> sendResetLink() async {
    final email = forgotEmailController.text.trim();
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Invalid email', 'Please enter a valid email address');
      return;
    }
    isSendingReset.value = true;
    await _authService.sendPasswordResetEmail(email);
    isSendingReset.value = false;
    resetEmailSent.value = true;
  }

  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registerNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    forgotEmailController.dispose();
    super.onClose();
  }
}
