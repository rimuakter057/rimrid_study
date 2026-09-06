import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/review_model.dart';
import '../../../shared/widgets/network_avatar.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
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
            children: [
              NetworkAvatar(imageUrl: review.avatarUrl, size: 36),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      style: AppTextStyles.label
                          .copyWith(color: AppColors.textPrimary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (i) => Icon(
                          i < review.rating.round()
                              ? Icons.star_rounded
                              : Icons.star_border_rounded,
                          size: 13,
                          color: AppColors.star,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(DateFormat('MMM d').format(review.date),
                  style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Expanded(
            child: Text(
              review.comment,
              style: AppTextStyles.bodyRegular,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
