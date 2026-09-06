import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/custom_button.dart';
import '../controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Create Account')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.md),
              Text('Create your account', style: AppTextStyles.h1),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Join RimRid Study and start learning with structured '
                'courses, quizzes, and AI support.',
                style: AppTextStyles.bodyRegular,
              ),
              const SizedBox(height: AppSpacing.xxl),
              AppTextField(
                label: 'Full Name',
                hint: 'Your full name',
                controller: controller.registerNameController,
                prefixIcon: Icons.person_outline_rounded,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                label: 'Email',
                hint: 'you@example.com',
                controller: controller.registerEmailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.mail_outline_rounded,
              ),
              const SizedBox(height: AppSpacing.md),
              Obx(
                () => AppTextField(
                  label: 'Password',
                  hint: 'Create a password',
                  controller: controller.registerPasswordController,
                  obscureText: !controller.registerPasswordVisible.value,
                  prefixIcon: Icons.lock_outline_rounded,
                  errorText: controller.registerError.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.registerPasswordVisible.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 20,
                      color: AppColors.textMuted,
                    ),
                    onPressed: controller.toggleRegisterPasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Obx(
                () => CustomButton(
                  label: 'Create Account',
                  isLoading: controller.isRegistering.value,
                  onPressed: controller.register,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ', style: AppTextStyles.bodyRegular),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text('Log In', style: AppTextStyles.buttonOutlined),
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
