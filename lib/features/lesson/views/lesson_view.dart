import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/lesson_model.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/lesson_item.dart';
import '../../../shared/widgets/section_header.dart';
import '../controllers/lesson_controller.dart';

class LessonView extends GetView<LessonController> {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Obx(() => Text(
            'Lesson ${controller.lessonNumber} of ${controller.totalLessons}')),
        actions: [
          IconButton(
            onPressed: controller.openAiAssistant,
            icon: const Icon(Icons.auto_awesome_rounded, color: AppColors.primary),
            tooltip: 'Ask AI',
          ),
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.notes),
            icon: const Icon(Icons.note_alt_outlined),
          ),
          Obx(
            () => IconButton(
              onPressed: controller.toggleBookmark,
              icon: Icon(
                controller.isCurrentBookmarked
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_border_rounded,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        final lesson = controller.currentLesson;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _VideoPlaceholder(lesson: lesson),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                      child: LinearProgressIndicator(
                        value: controller.courseProgress,
                        minHeight: 5,
                        backgroundColor: AppColors.secondaryLight,
                        valueColor:
                            const AlwaysStoppedAnimation(AppColors.primary),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(lesson.moduleTitle, style: AppTextStyles.overline),
                    const SizedBox(height: 4),
                    Text(lesson.title, style: AppTextStyles.h3),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        const Icon(Icons.schedule_rounded,
                            size: 14, color: AppColors.textMuted),
                        const SizedBox(width: 4),
                        Text('${lesson.durationMinutes} min',
                            style: AppTextStyles.caption),
                        if (lesson.isCompleted) ...[
                          const SizedBox(width: AppSpacing.sm),
                          const Icon(Icons.check_circle_rounded,
                              size: 14, color: AppColors.success),
                          const SizedBox(width: 4),
                          Text('Completed',
                              style: AppTextStyles.caption
                                  .copyWith(color: AppColors.success)),
                        ],
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(lesson.description, style: AppTextStyles.bodyRegular),
                    if (lesson.resources.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.lg),
                      Text('Resources', style: AppTextStyles.sectionTitle),
                      const SizedBox(height: AppSpacing.sm),
                      ...lesson.resources.map(
                        (r) => Container(
                          margin: const EdgeInsets.only(bottom: AppSpacing.xs),
                          padding: const EdgeInsets.all(AppSpacing.sm),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(AppRadius.md),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Row(
                            children: [
                              Icon(_resourceIcon(r.type),
                                  size: 18, color: AppColors.primary),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Text(r.title,
                                    style: AppTextStyles.bodyMedium),
                              ),
                              const Icon(Icons.download_rounded,
                                  size: 18, color: AppColors.textMuted),
                            ],
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Notes', style: AppTextStyles.sectionTitle),
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.notes),
                          child: Text('View All',
                              style: AppTextStyles.buttonOutlined
                                  .copyWith(fontSize: 13)),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.noteInputController,
                            minLines: 1,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              hintText: 'Write a quick note for this lesson...',
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        IconButton.filled(
                          onPressed: controller.addQuickNote,
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.primary,
                          ),
                          icon: const Icon(Icons.add_rounded, color: Colors.white),
                        ),
                      ],
                    ),
                    if (controller.lessonNotes.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.sm),
                      ...controller.lessonNotes.map(
                        (n) => Container(
                          margin: const EdgeInsets.only(bottom: AppSpacing.xs),
                          padding: const EdgeInsets.all(AppSpacing.sm),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryLighter,
                            borderRadius: BorderRadius.circular(AppRadius.md),
                          ),
                          child: Text(n.content, style: AppTextStyles.bodyMedium),
                        ),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.lg),
                    SectionHeader(title: 'Related Lessons'),
                    const SizedBox(height: AppSpacing.sm),
                    ...controller.relatedLessons.asMap().entries.map(
                          (e) => LessonItem(
                            lesson: e.value,
                            index: e.key,
                            onTap: () => controller.openLesson(e.value.id),
                          ),
                        ),
                    const SizedBox(height: AppSpacing.xxxl),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: const BoxDecoration(
            color: AppColors.background,
            border: Border(top: BorderSide(color: AppColors.divider)),
          ),
          child: Obx(
            () => Row(
              children: [
                IconButton(
                  onPressed: controller.hasPrevious ? controller.goToPrevious : null,
                  icon: const Icon(Icons.skip_previous_rounded),
                ),
                Expanded(
                  child: CustomButton(
                    label: controller.currentLesson.isCompleted
                        ? 'Completed'
                        : 'Mark as Complete',
                    icon: controller.currentLesson.isCompleted
                        ? Icons.check_circle_rounded
                        : null,
                    variant: controller.currentLesson.isCompleted
                        ? CustomButtonVariant.outlined
                        : CustomButtonVariant.primary,
                    onPressed: controller.toggleComplete,
                  ),
                ),
                IconButton(
                  onPressed: controller.goToNext,
                  icon: const Icon(Icons.skip_next_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _resourceIcon(LessonResourceType type) {
    switch (type) {
      case LessonResourceType.pdf:
        return Icons.picture_as_pdf_rounded;
      case LessonResourceType.slides:
        return Icons.slideshow_rounded;
      case LessonResourceType.code:
        return Icons.code_rounded;
      case LessonResourceType.link:
        return Icons.link_rounded;
    }
  }
}

class _VideoPlaceholder extends StatelessWidget {
  final LessonModel lesson;

  const _VideoPlaceholder({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: lesson.videoThumbnailUrl,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(color: Colors.black12),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.25)),
          ),
          Center(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow_rounded,
                  size: 34, color: AppColors.primary),
            ),
          ),
          Positioned(
            right: AppSpacing.sm,
            bottom: AppSpacing.sm,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.65),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Text(
                '${lesson.durationMinutes}:00',
                style: AppTextStyles.caption.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
