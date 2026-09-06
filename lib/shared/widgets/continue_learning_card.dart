import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/course_model.dart';

class ContinueLearningCard extends StatelessWidget {
  final CourseModel course;
  final VoidCallback? onContinue;

  const ContinueLearningCard({
    super.key,
    required this.course,
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.md),
                child: CachedNetworkImage(
                  imageUrl: course.thumbnailUrl,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(
                    width: 64,
                    height: 64,
                    color: Colors.white.withValues(alpha: 0.15),
                  ),
                  errorWidget: (_, __, ___) => Container(
                    width: 64,
                    height: 64,
                    color: Colors.white.withValues(alpha: 0.15),
                    child: const Icon(Icons.image_not_supported_outlined,
                        color: Colors.white, size: 24),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Continue Learning',
                      style: AppTextStyles.overline
                          .copyWith(color: Colors.white.withValues(alpha: 0.75)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      course.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.cardTitle.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      course.currentLessonTitle ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.caption
                          .copyWith(color: Colors.white.withValues(alpha: 0.75)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: LinearProgressIndicator(
              value: course.progress,
              minHeight: 8,
              backgroundColor: Colors.white.withValues(alpha: 0.2),
              valueColor: const AlwaysStoppedAnimation(Colors.white),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Text(
                '${((course.progress ?? 0) * 100).toStringAsFixed(0)}% complete',
                style: AppTextStyles.caption
                    .copyWith(color: Colors.white.withValues(alpha: 0.85)),
              ),
              const Spacer(),
              SizedBox(
                width: 140,
                child: OutlinedButton(
                  onPressed: onContinue,
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(38),
                    side: const BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
