import 'package:get/get.dart';
import '../services/auth_service.dart';

/// Bound once at app startup — services that need to live for the whole
/// app session (not tied to a single route) go here.
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthService>(AuthService(), permanent: true);
  }
}
