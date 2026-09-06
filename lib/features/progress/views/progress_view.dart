import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/progress_card.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/stat_card.dart';
import '../controllers/progress_controller.dart';
import '../widgets/topic_mastery_tile.dart';
import '../widgets/weekly_activity_chart.dart';

class ProgressView extends GetView<ProgressController> {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(title: const Text('Progress & Analytics')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
            AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.xxl),
        children: [
          ProgressCard(
            title: 'Overall Learning Progress',
            progress: controller.overallProgress,
            subtitle:
                '${controller.coursesInProgress} courses in progress · '
                '${controller.coursesCompleted} completed',
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  icon: Icons.local_fire_department_rounded,
                  value: '${controller.user.studyStreakDays} days',
                  label: 'Current streak',
                  accentColor: AppColors.warning,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: StatCard(
                  icon: Icons.timer_outlined,
                  value: '${controller.weeklyTotalHours.toStringAsFixed(1)}h',
                  label: 'This week',
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  icon: Icons.school_rounded,
                  value: '${controller.coursesCompleted}',
                  label: 'Courses completed',
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: StatCard(
                  icon: Icons.menu_book_rounded,
                  value: '${controller.lessonsCompleted}',
                  label: 'Lessons completed',
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  icon: Icons.quiz_rounded,
                  value: '${(controller.quizAverage * 100).toStringAsFixed(0)}%',
                  label: 'Quiz average',
                  accentColor: AppColors.info,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: StatCard(
                  icon: Icons.trending_up_rounded,
                  value: '${controller.coursesInProgress}',
                  label: 'In progress',
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          WeeklyActivityChart(data: controller.weeklyActivity),
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader(title: 'Strong Topics'),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                for (final topic in controller.strongTopics)
                  TopicMasteryTile(topic: topic, color: AppColors.success),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader(title: 'Topics to Improve'),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                for (final topic in controller.weakTopics)
                  TopicMasteryTile(topic: topic, color: AppColors.warning),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
