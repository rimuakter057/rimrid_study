import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

enum QuizOptionState { normal, selected, correct, incorrect }

/// A single multiple-choice answer row used on the Quiz question screen.
class QuizOption extends StatelessWidget {
  final String label;
  final QuizOptionState state;
  final VoidCallback? onTap;

  const QuizOption({
    super.key,
    required this.label,
    this.state = QuizOptionState.normal,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = AppColors.border;
    Color background = AppColors.surface;
    Color textColor = AppColors.textPrimary;
    IconData? trailingIcon;
    Color? trailingColor;

    switch (state) {
      case QuizOptionState.normal:
        break;
      case QuizOptionState.selected:
        borderColor = AppColors.primary;
        background = AppColors.secondaryLighter;
        textColor = AppColors.primaryDark;
        break;
      case QuizOptionState.correct:
        borderColor = AppColors.success;
        background = AppColors.success.withValues(alpha: 0.08);
        trailingIcon = Icons.check_circle_rounded;
        trailingColor = AppColors.success;
        break;
      case QuizOptionState.incorrect:
        borderColor = AppColors.error;
        background = AppColors.error.withValues(alpha: 0.08);
        trailingIcon = Icons.cancel_rounded;
        trailingColor = AppColors.error;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md, vertical: AppSpacing.sm + 2),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: borderColor,
            width: state == QuizOptionState.normal ? 1 : 1.6,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.bodyMedium.copyWith(color: textColor),
              ),
            ),
            if (trailingIcon != null)
              Icon(trailingIcon, color: trailingColor, size: 20),
          ],
        ),
      ),
    );
  }
}
