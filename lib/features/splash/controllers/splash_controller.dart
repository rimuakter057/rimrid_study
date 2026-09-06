import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/storage_service.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(const Duration(milliseconds: 1800));

    final hasSeenOnboarding = StorageService.instance.hasSeenOnboarding;
    final isLoggedIn = Get.find<AuthService>().isLoggedIn.value;

    if (!hasSeenOnboarding) {
      Get.offAllNamed(AppRoutes.onboarding);
    } else if (isLoggedIn) {
      Get.offAllNamed(AppRoutes.main);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
