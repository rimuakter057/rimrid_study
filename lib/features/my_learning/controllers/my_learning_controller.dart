import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/mock/mock_courses.dart';
import '../../../data/models/course_model.dart';

class MyLearningController extends GetxController {
  List<CourseModel> get inProgress => MockCourses.inProgress;
  List<CourseModel> get completed => MockCourses.completed;
  List<CourseModel> get saved => MockCourses.saved;

  CourseModel? get continueLearningCourse =>
      inProgress.isNotEmpty ? inProgress.first : null;

  void openCourse(CourseModel course) {
    Get.toNamed(AppRoutes.courseDetails, arguments: course.id);
  }
}
