import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/course_model.dart';
import '../../../shared/widgets/category_card.dart';
import '../../../shared/widgets/continue_learning_card.dart';
import '../../../shared/widgets/course_card.dart';
import '../../../shared/widgets/network_avatar.dart';
import '../../../shared/widgets/search_field.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/stat_card.dart';
import '../../navigation/controllers/nav_controller.dart';
import '../controllers/home_controller.dart';
import '../widgets/upcoming_item_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = controller.user;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md, AppSpacing.md, AppSpacing.md, 0),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${controller.greeting}, ${user.firstName} 👋',
                            style: AppTextStyles.h3,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Ready to continue learning?',
                            style: AppTextStyles.bodyRegular,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.toNamed(AppRoutes.studyPlanner),
                      icon: const Icon(Icons.calendar_month_rounded,
                          color: AppColors.primary),
                      tooltip: 'Study Planner',
                    ),
                    IconButton(
                      onPressed: () => Get.toNamed(AppRoutes.notifications),
                      icon: const Icon(Icons.notifications_outlined,
                          color: AppColors.primary),
                      tooltip: 'Notifications',
                    ),
                    Stack(
                      children: [
                        NetworkAvatar(imageUrl: user.avatarUrl, size: 46),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.md),
              sliver: SliverToBoxAdapter(
                child: SearchFieldWidget(onTap: () {}, readOnly: true),
              ),
            ),
            if (controller.continueLearningCourse != null)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
                sliver: SliverToBoxAdapter(
                  child: ContinueLearningCard(
                    course: controller.continueLearningCourse!,
                    onContinue: () => Get.toNamed(
                      AppRoutes.courseDetails,
                      arguments: controller.continueLearningCourse!.id,
                    ),
                  ),
                ),
              ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        icon: Icons.local_fire_department_rounded,
                        value: '${user.studyStreakDays} days',
                        label: 'Study streak',
                        accentColor: AppColors.warning,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: StatCard(
                        icon: Icons.track_changes_rounded,
                        value:
                            '${user.todayCompletedMinutes}/${user.todayGoalMinutes} min',
                        label: "Today's goal",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md, 0, AppSpacing.md, AppSpacing.sm),
              sliver: SliverToBoxAdapter(
                child: SectionHeader(
                  title: 'Categories',
                  actionLabel: 'See all',
                  onActionTap: () => Get.find<NavController>().changeIndex(1),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 96,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  itemCount: controller.categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
                  itemBuilder: (context, index) =>
                      CategoryCard(category: controller.categories[index]),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md, AppSpacing.lg, AppSpacing.md, AppSpacing.sm),
              sliver: SliverToBoxAdapter(
                child: SectionHeader(
                  title: 'Recommended for You',
                  actionLabel: 'See all',
                  onActionTap: () => Get.find<NavController>().changeIndex(1),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 336,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  itemCount: controller.recommendedCourses.length,
                  separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
                  itemBuilder: (context, index) => CourseCard(
                    course: controller.recommendedCourses[index],
                    onTap: () => _openCourse(controller.recommendedCourses[index]),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md, AppSpacing.lg, AppSpacing.md, AppSpacing.sm),
              sliver: SliverToBoxAdapter(
                child: SectionHeader(
                  title: 'Popular Courses',
                  actionLabel: 'See all',
                  onActionTap: () => Get.find<NavController>().changeIndex(1),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 336,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  itemCount: controller.popularCourses.length,
                  separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
                  itemBuilder: (context, index) => CourseCard(
                    course: controller.popularCourses[index],
                    onTap: () => _openCourse(controller.popularCourses[index]),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md, AppSpacing.lg, AppSpacing.md, AppSpacing.sm),
              sliver: SliverToBoxAdapter(
                child: SectionHeader(title: 'Upcoming'),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md, 0, AppSpacing.md, AppSpacing.xxl),
              sliver: SliverList.separated(
                itemCount: controller.upcomingItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
                itemBuilder: (context, index) {
                  final item = controller.upcomingItems[index];
                  return UpcomingItemCard(
                    item: item,
                    onTap: () {
                      if (item.quizId != null) {
                        Get.toNamed(AppRoutes.quiz, arguments: item.quizId);
                      } else {
                        Get.snackbar(item.title, 'Assignment details coming soon.');
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openCourse(CourseModel course) {
    Get.toNamed(AppRoutes.courseDetails, arguments: course.id);
  }
}
