import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/services/auth_service.dart';
import '../../../data/mock/mock_user.dart';
import '../../../data/models/user_model.dart';

class ProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  UserModel get user => _authService.currentUser.value ?? MockUser.current;

  Future<void> logout() async {
    await _authService.logout();
    Get.offAllNamed(AppRoutes.login);
  }
}
