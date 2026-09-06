import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/instructor_model.dart';
import 'network_avatar.dart';

/// Instructor summary row used on Course Details.
class InstructorCard extends StatelessWidget {
  final InstructorModel instructor;
  final VoidCallback? onTap;

  const InstructorCard({super.key, required this.instructor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            NetworkAvatar(imageUrl: instructor.avatarUrl, size: 52),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(instructor.name, style: AppTextStyles.cardTitle),
                  const SizedBox(height: 2),
                  Text(
                    instructor.title,
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
                      Text(instructor.rating.toStringAsFixed(1),
                          style: AppTextStyles.label),
                      const SizedBox(width: AppSpacing.sm),
                      Icon(Icons.people_alt_rounded,
                          size: 14, color: AppColors.textMuted),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          '${_compact(instructor.studentsCount)} students',
                          style: AppTextStyles.caption,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (onTap != null)
              const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }

  String _compact(int value) {
    if (value >= 1000) return '${(value / 1000).toStringAsFixed(1)}k';
    return '$value';
  }
}
