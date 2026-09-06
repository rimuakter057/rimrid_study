import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/services/storage_service.dart';

class OnboardingPageData {
  final IconData icon;
  final String title;
  final String description;

  const OnboardingPageData({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<OnboardingPageData> pages = const [
    OnboardingPageData(
      icon: Icons.menu_book_rounded,
      title: 'Learn from structured courses',
      description:
          'Follow expertly designed courses broken into clear modules and '
          'lessons, so you always know exactly what to learn next.',
    ),
    OnboardingPageData(
      icon: Icons.fact_check_rounded,
      title: 'Improve with quizzes & practice',
      description:
          'Test your understanding with quizzes after every module and '
          'track your progress as your skills grow.',
    ),
    OnboardingPageData(
      icon: Icons.auto_awesome_rounded,
      title: 'Use AI to understand difficult topics',
      description:
          'Stuck on a concept? Ask your AI study assistant to explain it '
          'simply, summarize lessons, or generate practice questions.',
    ),
  ];

  bool get isLastPage => currentPage.value == pages.length - 1;

  void onPageChanged(int index) => currentPage.value = index;

  void next() {
    if (isLastPage) {
      getStarted();
      return;
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> getStarted() async {
    await StorageService.instance.setOnboardingSeen();
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
