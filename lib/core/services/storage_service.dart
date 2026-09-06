import 'package:get_storage/get_storage.dart';

/// Thin wrapper around GetStorage so the rest of the app never talks to
/// the storage package directly. Easy to swap for secure storage or a
/// backend-synced cache later without touching call sites.
class StorageService {
  StorageService._();
  static final StorageService instance = StorageService._();

  final GetStorage _box = GetStorage();

  static const _keyOnboardingSeen = 'onboarding_seen';
  static const _keyIsLoggedIn = 'is_logged_in';

  bool get hasSeenOnboarding => _box.read(_keyOnboardingSeen) ?? false;
  Future<void> setOnboardingSeen() => _box.write(_keyOnboardingSeen, true);

  bool get isLoggedIn => _box.read(_keyIsLoggedIn) ?? false;
  Future<void> setLoggedIn(bool value) => _box.write(_keyIsLoggedIn, value);
}
