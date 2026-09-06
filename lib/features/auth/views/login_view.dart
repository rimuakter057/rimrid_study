import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/custom_button.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSpacing.xxl),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: const Icon(Icons.auto_stories_rounded,
                    color: Colors.white, size: 30),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text('Welcome back', style: AppTextStyles.h1),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Log in to continue your learning journey with RimRid Study.',
                style: AppTextStyles.bodyRegular,
              ),
              const SizedBox(height: AppSpacing.xxl),
              AppTextField(
                label: 'Email',
                hint: 'you@example.com',
                controller: controller.loginEmailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.mail_outline_rounded,
              ),
              const SizedBox(height: AppSpacing.md),
              Obx(
                () => AppTextField(
                  label: 'Password',
                  hint: 'Enter your password',
                  controller: controller.loginPasswordController,
                  obscureText: !controller.loginPasswordVisible.value,
                  prefixIcon: Icons.lock_outline_rounded,
                  errorText: controller.loginError.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.loginPasswordVisible.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 20,
                      color: AppColors.textMuted,
                    ),
                    onPressed: controller.toggleLoginPasswordVisibility,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
                  child: const Text('Forgot password?'),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Obx(
                () => CustomButton(
                  label: 'Log In',
                  isLoading: controller.isLoggingIn.value,
                  onPressed: controller.login,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: AppTextStyles.bodyRegular),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.register),
                    child: Text('Sign Up', style: AppTextStyles.buttonOutlined),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
