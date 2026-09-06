import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPageData data;

  const OnboardingPageWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              color: AppColors.secondaryLight,
              borderRadius: BorderRadius.circular(AppRadius.xxl),
            ),
            child: Icon(data.icon, size: 96, color: AppColors.primary),
          ),
          const SizedBox(height: AppSpacing.xxl),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.h2,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyRegular,
          ),
        ],
      ),
    );
  }
}
