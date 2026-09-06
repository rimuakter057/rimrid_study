import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/category_card.dart';
import '../../../shared/widgets/course_card.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/search_field.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../data/models/course_model.dart';
import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(title: const Text('Explore')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.md, AppSpacing.sm, AppSpacing.md, 0),
            child: SearchFieldWidget(
              hint: 'Search courses, instructors...',
              onChanged: (value) => controller.searchQuery.value = value,
              trailing: GestureDetector(
                onTap: () => _openSortSheet(context),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryLighter,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Icon(Icons.tune_rounded, color: AppColors.primary),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            height: 96,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              itemCount: controller.categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return Obx(
                  () => CategoryCard(
                    category: category,
                    selected: controller.selectedCategoryId.value == category.id,
                    onTap: () => controller.selectCategory(category.id),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Expanded(
            child: Obx(() {
              if (controller.isFiltering) {
                final results = controller.filteredCourses;
                if (results.isEmpty) {
                  return const EmptyState(
                    icon: Icons.search_off_rounded,
                    title: 'No courses found',
                    message:
                        'Try a different search term or clear the category filter.',
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(
                      AppSpacing.md, 0, AppSpacing.md, AppSpacing.xxl),
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final course = results[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: CourseCard(
                        course: course,
                        width: double.infinity,
                        onTap: () => controller.openCourse(course),
                      ),
                    );
                  },
                );
              }

              return ListView(
                padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md, 0, AppSpacing.md, AppSpacing.xxl),
                children: [
                  SectionHeader(title: 'Popular Courses'),
                  const SizedBox(height: AppSpacing.sm),
                  _CourseCarousel(
                    courses: controller.popularCourses,
                    onTap: controller.openCourse,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  SectionHeader(title: 'New Courses'),
                  const SizedBox(height: AppSpacing.sm),
                  _CourseCarousel(
                    courses: controller.newCourses,
                    onTap: controller.openCourse,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  SectionHeader(title: 'Recommended for You'),
                  const SizedBox(height: AppSpacing.sm),
                  _CourseCarousel(
                    courses: controller.recommendedCourses,
                    onTap: controller.openCourse,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  void _openSortSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sort By', style: AppTextStyles.h3),
            const SizedBox(height: AppSpacing.sm),
            Obx(
              () => Column(
                children: CourseSortOption.values
                    .map(
                      (option) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(option.label, style: AppTextStyles.bodyMedium),
                        trailing: Icon(
                          controller.sortOption.value == option
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: controller.sortOption.value == option
                              ? AppColors.primary
                              : AppColors.border,
                        ),
                        onTap: () {
                          controller.setSort(option);
                          Get.back();
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseCarousel extends StatelessWidget {
  final List<CourseModel> courses;
  final ValueChanged<CourseModel> onTap;

  const _CourseCarousel({required this.courses, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
      return const SizedBox(
        height: 60,
        child: Center(child: Text('No courses in this section yet.')),
      );
    }
    return SizedBox(
      height: 336,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) => CourseCard(
          course: courses[index],
          onTap: () => onTap(courses[index]),
        ),
      ),
    );
  }
}
