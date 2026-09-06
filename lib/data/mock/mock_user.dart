import '../../core/utils/mock_images.dart';
import '../models/user_model.dart';

class MockUser {
  MockUser._();

  static final UserModel current = UserModel(
    id: 'u_001',
    name: 'Rimu Ahmed',
    email: 'rimu@example.com',
    avatarUrl: MockImages.avatar(5),
    studyStreakDays: 12,
    todayGoalMinutes: 90,
    todayCompletedMinutes: 45,
  );
}
