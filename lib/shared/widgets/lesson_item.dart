import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/lesson_model.dart';

/// A single lesson row used inside a course's curriculum and in "related
/// lessons" lists on the Lesson screen.
class LessonItem extends StatelessWidget {
  final LessonModel lesson;
  final int index;
  final bool isLocked;
  final bool isActive;
  final VoidCallback? onTap;

  const LessonItem({
    super.key,
    required this.lesson,
    required this.index,
    this.isLocked = false,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLocked ? null : onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: isActive ? AppColors.secondaryLighter : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Row(
          children: [
            _LeadingIcon(lesson: lesson, isLocked: isLocked),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isLocked
                          ? AppColors.textMuted
                          : AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.schedule_rounded,
                          size: 12, color: AppColors.textMuted),
                      const SizedBox(width: 4),
                      Text('${lesson.durationMinutes} min',
                          style: AppTextStyles.caption),
                      if (lesson.isPreview) ...[
                        const SizedBox(width: AppSpacing.xs),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                            color: AppColors.info.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(AppRadius.sm),
                          ),
                          child: Text(
                            'Preview',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.info,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LeadingIcon extends StatelessWidget {
  final LessonModel lesson;
  final bool isLocked;

  const _LeadingIcon({required this.lesson, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;
    Color background;

    if (lesson.isCompleted) {
      icon = Icons.check_rounded;
      color = Colors.white;
      background = AppColors.primary;
    } else if (isLocked) {
      icon = Icons.lock_outline_rounded;
      color = AppColors.textMuted;
      background = AppColors.secondaryLight;
    } else {
      icon = Icons.play_arrow_rounded;
      color = AppColors.primary;
      background = AppColors.secondaryLight;
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(color: background, shape: BoxShape.circle),
      child: Icon(icon, size: 18, color: color),
    );
  }
}
