import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../ai_assistant/views/ai_assistant_view.dart';
import '../../explore/views/explore_view.dart';
import '../../home/views/home_view.dart';
import '../../my_learning/views/my_learning_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/nav_controller.dart';

class MainNavView extends GetView<NavController> {
  const MainNavView({super.key});

  static const _tabs = [
    HomeView(),
    ExploreView(),
    MyLearningView(),
    AiAssistantView(),
    ProfileView(),
  ];

  static const _items = [
    BottomNavItemData(
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      label: 'Home',
    ),
    BottomNavItemData(
      icon: Icons.explore_outlined,
      activeIcon: Icons.explore_rounded,
      label: 'Explore',
    ),
    BottomNavItemData(
      icon: Icons.school_outlined,
      activeIcon: Icons.school_rounded,
      label: 'My Learning',
    ),
    BottomNavItemData(
      icon: Icons.auto_awesome_outlined,
      activeIcon: Icons.auto_awesome_rounded,
      label: 'AI',
    ),
    BottomNavItemData(
      icon: Icons.person_outline_rounded,
      activeIcon: Icons.person_rounded,
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: _tabs,
        ),
        bottomNavigationBar: AppBottomNavBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          items: _items,
        ),
      ),
    );
  }
}
