import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

/// Labeled progress bar in a card — used for overall learning progress,
/// topic mastery, and other percentage-based summaries.
class ProgressCard extends StatelessWidget {
  final String title;
  final double progress;
  final String? subtitle;
  final Color? color;

  const ProgressCard({
    super.key,
    required this.title,
    required this.progress,
    this.subtitle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final barColor = color ?? AppColors.primary;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title,
                    style: AppTextStyles.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ),
              Text(
                '${(progress * 100).toStringAsFixed(0)}%',
                style: AppTextStyles.cardTitle.copyWith(color: barColor),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: LinearProgressIndicator(
              value: progress.clamp(0, 1),
              minHeight: 8,
              backgroundColor: AppColors.secondaryLight,
              valueColor: AlwaysStoppedAnimation(barColor),
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(subtitle!, style: AppTextStyles.caption),
          ],
        ],
      ),
    );
  }
}
