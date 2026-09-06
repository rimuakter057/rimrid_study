import 'package:get/get.dart';
import '../../data/mock/mock_user.dart';
import '../../data/models/user_model.dart';
import 'storage_service.dart';

/// Mock authentication service. No network calls — simulates latency and
/// stores a simple logged-in flag locally. Replace the method bodies with
/// real API/Supabase calls later; call sites won't need to change.
class AuthService extends GetxService {
  final Rxn<UserModel> currentUser = Rxn<UserModel>();
  final RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = StorageService.instance.isLoggedIn;
    if (isLoggedIn.value) {
      currentUser.value = MockUser.current;
    }
  }

  Future<void> login({required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 900));
    currentUser.value = MockUser.current.copyWith(email: email);
    isLoggedIn.value = true;
    await StorageService.instance.setLoggedIn(true);
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 900));
    currentUser.value = MockUser.current.copyWith(name: name, email: email);
    isLoggedIn.value = true;
    await StorageService.instance.setLoggedIn(true);
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await Future.delayed(const Duration(milliseconds: 900));
  }

  Future<void> logout() async {
    currentUser.value = null;
    isLoggedIn.value = false;
    await StorageService.instance.setLoggedIn(false);
  }
}
