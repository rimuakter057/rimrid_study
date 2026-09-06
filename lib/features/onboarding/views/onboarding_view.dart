import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/custom_button.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_page_widget.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Obx(
                  () => Visibility(
                    visible: !controller.isLastPage,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: TextButton(
                      onPressed: controller.getStarted,
                      child: const Text('Skip'),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.pages.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) =>
                    OnboardingPageWidget(data: controller.pages[index]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: controller.currentPage.value == index ? 22 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: controller.currentPage.value == index
                            ? AppColors.primary
                            : AppColors.border,
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.xl,
                0,
                AppSpacing.xl,
                AppSpacing.xl,
              ),
              child: Obx(
                () => CustomButton(
                  label: controller.isLastPage ? 'Get Started' : 'Continue',
                  onPressed: controller.next,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
