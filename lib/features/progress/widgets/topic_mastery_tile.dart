import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/study_activity_model.dart';

/// Compact topic + mastery progress bar row, used for strong/weak topic
/// lists on the Progress/Analytics screen.
class TopicMasteryTile extends StatelessWidget {
  final TopicMasteryModel topic;
  final Color color;

  const TopicMasteryTile({super.key, required this.topic, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              topic.topic,
              style: AppTextStyles.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.pill),
              child: LinearProgressIndicator(
                value: topic.masteryPercent,
                minHeight: 8,
                backgroundColor: AppColors.secondaryLight,
                valueColor: AlwaysStoppedAnimation(color),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          SizedBox(
            width: 34,
            child: Text(
              '${(topic.masteryPercent * 100).toStringAsFixed(0)}%',
              textAlign: TextAlign.right,
              style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
