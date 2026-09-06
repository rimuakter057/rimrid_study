import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/course_model.dart';
import '../../../data/models/module_model.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/instructor_card.dart';
import '../../../shared/widgets/lesson_item.dart';
import '../../../shared/widgets/section_header.dart';
import '../controllers/course_details_controller.dart';
import '../widgets/review_card.dart';

class CourseDetailsView extends GetView<CourseDetailsController> {
  const CourseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final course = controller.course;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 10,
                  child: CachedNetworkImage(
                    imageUrl: course.thumbnailUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, __) =>
                        Container(color: AppColors.secondaryLight),
                  ),
                ),
                Positioned(
                  top: MediaQuery.paddingOf(context).top + AppSpacing.sm,
                  left: AppSpacing.sm,
                  child: _CircleIconButton(
                    icon: Icons.arrow_back_rounded,
                    onTap: Get.back,
                  ),
                ),
                Positioned(
                  top: MediaQuery.paddingOf(context).top + AppSpacing.sm,
                  right: AppSpacing.sm,
                  child: Obx(
                    () => _CircleIconButton(
                      icon: controller.isSaved.value
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_rounded,
                      onTap: controller.toggleSave,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.title, style: AppTextStyles.h2),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          size: 18, color: AppColors.star),
                      const SizedBox(width: 4),
                      Text(course.rating.toStringAsFixed(1),
                          style: AppTextStyles.bodyLarge),
                      const SizedBox(width: 4),
                      Text('(${course.reviewsCount} reviews)',
                          style: AppTextStyles.caption),
                      const SizedBox(width: AppSpacing.sm),
                      Icon(Icons.people_alt_rounded,
                          size: 16, color: AppColors.textMuted),
                      const SizedBox(width: 4),
                      Text('${_compact(course.studentsCount)} students',
                          style: AppTextStyles.caption),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.xs,
                    runSpacing: AppSpacing.xs,
                    children: [
                      _InfoChip(icon: Icons.bar_chart_rounded, label: course.level.label),
                      _InfoChip(icon: Icons.schedule_rounded, label: '${course.durationHours.toStringAsFixed(0)}h total'),
                      _InfoChip(icon: Icons.play_lesson_rounded, label: '${course.lessonsCount} lessons'),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text('About This Course', style: AppTextStyles.sectionTitle),
                  const SizedBox(height: AppSpacing.xs),
                  Obx(
                    () => GestureDetector(
                      onTap: controller.toggleDescription,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.description,
                            style: AppTextStyles.bodyRegular,
                            maxLines: controller.isDescriptionExpanded.value ? null : 3,
                            overflow: controller.isDescriptionExpanded.value
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            controller.isDescriptionExpanded.value ? 'Show less' : 'Read more',
                            style: AppTextStyles.buttonOutlined.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text("What You'll Learn", style: AppTextStyles.sectionTitle),
                  const SizedBox(height: AppSpacing.sm),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryLighter,
                      borderRadius: BorderRadius.circular(AppRadius.lg),
                    ),
                    child: Column(
                      children: course.whatYoullLearn
                          .map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.check_circle_rounded,
                                        size: 18, color: AppColors.primary),
                                    const SizedBox(width: AppSpacing.xs),
                                    Expanded(
                                      child: Text(item, style: AppTextStyles.bodyMedium),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text('Instructor', style: AppTextStyles.sectionTitle),
                  const SizedBox(height: AppSpacing.sm),
                  InstructorCard(
                    instructor: course.instructor,
                    onTap: () => Get.snackbar(
                        'Instructor Profile', 'Coming in a future build phase.'),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  SectionHeader(
                    title: 'Curriculum',
                    actionLabel: '${controller.modules.length} modules',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ...controller.modules.map((m) => _ModuleTile(module: m)),
                  const SizedBox(height: AppSpacing.lg),
                  SectionHeader(
                    title: 'Reviews',
                    actionLabel: '${course.reviewsCount} reviews',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.reviews.length,
                      separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
                      itemBuilder: (context, index) =>
                          ReviewCard(review: controller.reviews[index]),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxxl),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md, vertical: AppSpacing.sm),
          decoration: const BoxDecoration(
            color: AppColors.background,
            border: Border(top: BorderSide(color: AppColors.divider)),
          ),
          child: Obx(
            () {
              final enrolled = controller.isEnrolled;
              return Row(
                children: [
                  if (!enrolled) ...[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course.priceLabel, style: AppTextStyles.h3),
                        Text(course.isFree ? 'Free course' : 'One-time payment',
                            style: AppTextStyles.caption),
                      ],
                    ),
                    const SizedBox(width: AppSpacing.md),
                  ],
                  Expanded(
                    child: CustomButton(
                      label: enrolled ? 'Continue Learning' : 'Enroll Now',
                      onPressed: enrolled ? controller.continueLearning : controller.enroll,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String _compact(int value) {
    if (value >= 1000) return '${(value / 1000).toStringAsFixed(1)}k';
    return '$value';
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.secondaryLight,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.primary),
          const SizedBox(width: 4),
          Text(label, style: AppTextStyles.label.copyWith(color: AppColors.primaryDark)),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.4),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xs),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}

class _ModuleTile extends StatelessWidget {
  final ModuleModel module;

  const _ModuleTile({required this.module});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CourseDetailsController>();
    return Obx(() {
      final expanded = controller.expandedModuleIds.contains(module.id);
      return Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () => controller.toggleModule(module.id),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(module.title, style: AppTextStyles.cardTitle),
                          const SizedBox(height: 2),
                          Text(
                            '${module.lessonCount} lessons · ${module.totalDurationMinutes} min',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      expanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: AppColors.textMuted,
                    ),
                  ],
                ),
              ),
            ),
            if (expanded)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    AppSpacing.sm, 0, AppSpacing.sm, AppSpacing.sm),
                child: Column(
                  children: module.lessons.asMap().entries.map((entry) {
                    final lesson = entry.value;
                    return LessonItem(
                      lesson: lesson,
                      index: entry.key,
                      isLocked: !controller.isEnrolled && !lesson.isPreview,
                      onTap: () => controller.openLesson(lesson.id),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      );
    });
  }
}
