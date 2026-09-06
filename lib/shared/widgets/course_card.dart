import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/course_model.dart';

/// Course thumbnail card used across Home, Explore, and My Learning.
/// Pass [width] for horizontal carousels; leave null to fill available width.
class CourseCard extends StatelessWidget {
  final CourseModel course;
  final double? width;
  final VoidCallback? onTap;

  const CourseCard({
    super.key,
    required this.course,
    this.width = 230,
    this.onTap,
  });

  Color get _levelColor {
    switch (course.level) {
      case CourseLevel.beginner:
        return AppColors.levelBeginner;
      case CourseLevel.intermediate:
        return AppColors.levelIntermediate;
      case CourseLevel.advanced:
        return AppColors.levelAdvanced;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: AppColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 10,
                  child: CachedNetworkImage(
                    imageUrl: course.thumbnailUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, __) =>
                        Container(color: AppColors.secondaryLight),
                    errorWidget: (_, __, ___) => Container(
                      color: AppColors.secondaryLight,
                      child: const Icon(Icons.image_not_supported_outlined,
                          color: AppColors.textMuted),
                    ),
                  ),
                ),
                Positioned(
                  top: AppSpacing.xs,
                  left: AppSpacing.xs,
                  child: _Badge(
                    label: course.isFree ? 'Free' : course.priceLabel,
                    background: course.isFree
                        ? AppColors.primary
                        : Colors.black.withValues(alpha: 0.65),
                  ),
                ),
                if (course.isNew)
                  Positioned(
                    top: AppSpacing.xs,
                    right: AppSpacing.xs,
                    child: const _Badge(label: 'New', background: AppColors.info),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: AppTextStyles.cardTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    course.instructor.name,
                    style: AppTextStyles.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          size: 14, color: AppColors.star),
                      const SizedBox(width: 2),
                      Text(course.rating.toStringAsFixed(1),
                          style: AppTextStyles.label),
                      const SizedBox(width: AppSpacing.xs),
                      Expanded(
                        child: Text(
                          '${course.lessonsCount} lessons',
                          style: AppTextStyles.caption,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: _levelColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                        ),
                        child: Text(
                          course.level.label,
                          style: AppTextStyles.caption.copyWith(
                            color: _levelColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.schedule_rounded,
                          size: 12, color: AppColors.textMuted),
                      const SizedBox(width: 2),
                      Text('${course.durationHours.toStringAsFixed(0)}h',
                          style: AppTextStyles.caption),
                    ],
                  ),
                  if (course.isEnrolled) ...[
                    const SizedBox(height: AppSpacing.sm),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                      child: LinearProgressIndicator(
                        value: course.progress,
                        minHeight: 6,
                        backgroundColor: AppColors.secondaryLight,
                        valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${((course.progress ?? 0) * 100).toStringAsFixed(0)}% complete',
                      style: AppTextStyles.caption,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color background;

  const _Badge({required this.label, required this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
