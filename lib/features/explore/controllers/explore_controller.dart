import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/mock/mock_categories.dart';
import '../../../data/mock/mock_courses.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/course_model.dart';

enum CourseSortOption { popular, newest, topRated, free }

extension CourseSortOptionX on CourseSortOption {
  String get label {
    switch (this) {
      case CourseSortOption.popular:
        return 'Most Popular';
      case CourseSortOption.newest:
        return 'Newest';
      case CourseSortOption.topRated:
        return 'Top Rated';
      case CourseSortOption.free:
        return 'Free First';
    }
  }
}

class ExploreController extends GetxController {
  final RxString searchQuery = ''.obs;
  final Rxn<String> selectedCategoryId = Rxn<String>();
  final Rx<CourseSortOption> sortOption = CourseSortOption.popular.obs;

  List<CategoryModel> get categories => MockCategories.all;
  List<CourseModel> get popularCourses => MockCourses.popular;
  List<CourseModel> get newCourses => MockCourses.newCourses;
  List<CourseModel> get recommendedCourses => MockCourses.recommended;

  bool get isFiltering =>
      searchQuery.value.trim().isNotEmpty || selectedCategoryId.value != null;

  List<CourseModel> get filteredCourses {
    final query = searchQuery.value.trim().toLowerCase();
    final list = MockCourses.all.where((c) {
      final matchesQuery = query.isEmpty ||
          c.title.toLowerCase().contains(query) ||
          c.instructor.name.toLowerCase().contains(query);
      final matchesCategory =
          selectedCategoryId.value == null || c.categoryId == selectedCategoryId.value;
      return matchesQuery && matchesCategory;
    }).toList();

    switch (sortOption.value) {
      case CourseSortOption.popular:
        list.sort((a, b) => b.studentsCount.compareTo(a.studentsCount));
        break;
      case CourseSortOption.newest:
        list.sort((a, b) => (b.isNew ? 1 : 0).compareTo(a.isNew ? 1 : 0));
        break;
      case CourseSortOption.topRated:
        list.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case CourseSortOption.free:
        list.sort((a, b) => (a.isFree ? 0 : 1).compareTo(b.isFree ? 0 : 1));
        break;
    }
    return list;
  }

  void selectCategory(String? id) {
    selectedCategoryId.value = selectedCategoryId.value == id ? null : id;
  }

  void setSort(CourseSortOption option) => sortOption.value = option;

  void openCourse(CourseModel course) {
    Get.toNamed(AppRoutes.courseDetails, arguments: course.id);
  }
}
