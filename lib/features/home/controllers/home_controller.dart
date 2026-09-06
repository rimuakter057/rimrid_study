import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../../data/mock/mock_categories.dart';
import '../../../data/mock/mock_courses.dart';
import '../../../data/mock/mock_upcoming_items.dart';
import '../../../data/mock/mock_user.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/course_model.dart';
import '../../../data/models/upcoming_item_model.dart';
import '../../../data/models/user_model.dart';

class HomeController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  UserModel get user => _authService.currentUser.value ?? MockUser.current;

  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  CourseModel? get continueLearningCourse =>
      MockCourses.inProgress.isNotEmpty ? MockCourses.inProgress.first : null;

  List<CourseModel> get recommendedCourses => MockCourses.recommended;
  List<CourseModel> get popularCourses => MockCourses.popular;
  List<CategoryModel> get categories => MockCategories.all;
  List<UpcomingItemModel> get upcomingItems => MockUpcomingItems.all;
}
