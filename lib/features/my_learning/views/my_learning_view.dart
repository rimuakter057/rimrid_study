import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/course_model.dart';
import '../../../shared/widgets/continue_learning_card.dart';
import '../../../shared/widgets/course_card.dart';
import '../../../shared/widgets/empty_state.dart';
import '../controllers/my_learning_controller.dart';

class MyLearningView extends GetView<MyLearningController> {
  const MyLearningView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          title: const Text('My Learning'),
          actions: [
            IconButton(
              onPressed: () => Get.toNamed(AppRoutes.notes),
              icon: const Icon(Icons.note_alt_outlined),
            ),
          ],
          bottom: TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textMuted,
            indicatorColor: AppColors.primary,
            labelStyle: AppTextStyles.label.copyWith(
                color: AppColors.primary, fontWeight: FontWeight.w700),
            unselectedLabelStyle: AppTextStyles.label,
            tabs: const [
              Tab(text: 'In Progress'),
              Tab(text: 'Completed'),
              Tab(text: 'Saved'),
            ],
          ),
        ),
        body: Column(
          children: [
            if (controller.continueLearningCourse != null)
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: ContinueLearningCard(
                  course: controller.continueLearningCourse!,
                  onContinue: () =>
                      controller.openCourse(controller.continueLearningCourse!),
                ),
              ),
            Expanded(
              child: TabBarView(
                children: [
                  _CourseList(
                    courses: controller.inProgress,
                    onTap: controller.openCourse,
                    emptyMessage: 'Courses you start will appear here with '
                        'your progress.',
                  ),
                  _CourseList(
                    courses: controller.completed,
                    onTap: controller.openCourse,
                    emptyMessage: 'Courses you finish will appear here.',
                  ),
                  _CourseList(
                    courses: controller.saved,
                    onTap: controller.openCourse,
                    emptyMessage: 'Bookmark courses from Explore to save '
                        'them here for later.',
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

class _CourseList extends StatelessWidget {
  final List<CourseModel> courses;
  final ValueChanged<CourseModel> onTap;
  final String emptyMessage;

  const _CourseList({
    required this.courses,
    required this.onTap,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
      return EmptyState(
        icon: Icons.school_outlined,
        title: 'Nothing here yet',
        message: emptyMessage,
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.xxl),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: CourseCard(
            course: course,
            width: double.infinity,
            onTap: () => onTap(course),
          ),
        );
      },
    );
  }
}
