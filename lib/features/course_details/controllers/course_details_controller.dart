import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/mock/mock_courses.dart';
import '../../../data/mock/mock_curriculum.dart';
import '../../../data/mock/mock_reviews.dart';
import '../../../data/models/course_model.dart';
import '../../../data/models/module_model.dart';
import '../../../data/models/review_model.dart';

class CourseDetailsController extends GetxController {
  late final CourseModel course;
  late final List<ModuleModel> modules;
  late final List<ReviewModel> reviews;

  final RxBool isDescriptionExpanded = false.obs;
  final RxSet<String> expandedModuleIds = <String>{}.obs;
  final RxBool isSaved = false.obs;
  final RxBool isEnrolledLocally = false.obs;

  @override
  void onInit() {
    super.onInit();
    final courseId = Get.arguments as String;
    course = MockCourses.byId(courseId);
    modules = MockCurriculum.forCourse(course);
    reviews = MockReviews.forCourse(course.id);
    isSaved.value = course.isSaved;
    if (modules.isNotEmpty) expandedModuleIds.add(modules.first.id);
  }

  bool get isEnrolled {
    final enrolledLocally = isEnrolledLocally.value;
    return course.isEnrolled || enrolledLocally;
  }

  double get averageRating => course.rating;

  void toggleDescription() =>
      isDescriptionExpanded.value = !isDescriptionExpanded.value;

  void toggleModule(String moduleId) {
    if (expandedModuleIds.contains(moduleId)) {
      expandedModuleIds.remove(moduleId);
    } else {
      expandedModuleIds.add(moduleId);
    }
  }

  void toggleSave() {
    isSaved.value = !isSaved.value;
    Get.snackbar(
      isSaved.value ? 'Saved' : 'Removed',
      isSaved.value
          ? 'Added to your saved courses.'
          : 'Removed from your saved courses.',
    );
  }

  void enroll() {
    isEnrolledLocally.value = true;
    Get.snackbar('Enrolled!', "You're now enrolled in ${course.title}.");
  }

  void openLesson(String lessonId) {
    if (!isEnrolled && !_isPreview(lessonId)) {
      Get.snackbar('Locked', 'Enroll in this course to unlock this lesson.');
      return;
    }
    Get.toNamed(
      AppRoutes.lesson,
      arguments: {'courseId': course.id, 'lessonId': lessonId},
    );
  }

  void continueLearning() {
    for (final m in modules) {
      for (final l in m.lessons) {
        if (!l.isCompleted) {
          openLesson(l.id);
          return;
        }
      }
    }
    if (modules.isNotEmpty && modules.first.lessons.isNotEmpty) {
      openLesson(modules.first.lessons.first.id);
    }
  }

  bool _isPreview(String lessonId) {
    for (final m in modules) {
      for (final l in m.lessons) {
        if (l.id == lessonId) return l.isPreview;
      }
    }
    return false;
  }
}
