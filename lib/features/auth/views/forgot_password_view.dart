import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/custom_button.dart';
import '../controllers/auth_controller.dart';

class ForgotPasswordView extends GetView<AuthController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Forgot Password')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Obx(
            () => controller.resetEmailSent.value
                ? _SentState(email: controller.forgotEmailController.text.trim())
                : _FormState(controller: controller),
          ),
        ),
      ),
    );
  }
}

class _FormState extends StatelessWidget {
  final AuthController controller;
  const _FormState({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.md),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.secondaryLight,
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: const Icon(Icons.lock_reset_rounded,
                color: AppColors.primary, size: 30),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text('Reset your password', style: AppTextStyles.h1),
          const SizedBox(height: AppSpacing.xs),
          Text(
            "Enter the email associated with your account and we'll send "
            'a link to reset your password.',
            style: AppTextStyles.bodyRegular,
          ),
          const SizedBox(height: AppSpacing.xxl),
          AppTextField(
            label: 'Email',
            hint: 'you@example.com',
            controller: controller.forgotEmailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.mail_outline_rounded,
          ),
          const SizedBox(height: AppSpacing.xl),
          Obx(
            () => CustomButton(
              label: 'Send Reset Link',
              isLoading: controller.isSendingReset.value,
              onPressed: controller.sendResetLink,
            ),
          ),
        ],
      ),
    );
  }
}

class _SentState extends StatelessWidget {
  final String email;
  const _SentState({required this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: const BoxDecoration(
              color: AppColors.secondaryLight,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.mark_email_read_rounded,
                size: 40, color: AppColors.primary),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Check your email', style: AppTextStyles.h2, textAlign: TextAlign.center),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'We sent a password reset link to\n$email',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyRegular,
          ),
          const SizedBox(height: AppSpacing.xl),
          CustomButton(
            label: 'Back to Log In',
            width: 220,
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
