import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/mock/mock_courses.dart';
import '../../../data/mock/mock_curriculum.dart';
import '../../../data/mock/mock_notes.dart';
import '../../../data/models/course_model.dart';
import '../../../data/models/lesson_model.dart';
import '../../../data/models/note_model.dart';
import '../../navigation/controllers/nav_controller.dart';

class LessonController extends GetxController {
  late final CourseModel course;
  late final RxList<LessonModel> lessons;
  final RxInt currentIndex = 0.obs;
  final RxSet<String> bookmarkedIds = <String>{}.obs;
  final RxList<NoteModel> lessonNotes = <NoteModel>[].obs;
  final noteInputController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map;
    final courseId = args['courseId'] as String;
    final lessonId = args['lessonId'] as String?;

    course = MockCourses.byId(courseId);
    final modules = MockCurriculum.forCourse(course);
    lessons = modules.expand((m) => m.lessons).toList().obs;

    if (lessonId != null) {
      final idx = lessons.indexWhere((l) => l.id == lessonId);
      currentIndex.value = idx >= 0 ? idx : 0;
    }
    _loadNotesForCurrentLesson();
  }

  LessonModel get currentLesson => lessons[currentIndex.value];
  bool get hasPrevious => currentIndex.value > 0;
  bool get hasNext => currentIndex.value < lessons.length - 1;
  int get lessonNumber => currentIndex.value + 1;
  int get totalLessons => lessons.length;
  double get courseProgress => lessonNumber / totalLessons;

  List<LessonModel> get relatedLessons =>
      lessons.where((l) => l.id != currentLesson.id).take(6).toList();

  bool get isCurrentBookmarked => bookmarkedIds.contains(currentLesson.id);

  void toggleBookmark() {
    final id = currentLesson.id;
    if (bookmarkedIds.contains(id)) {
      bookmarkedIds.remove(id);
    } else {
      bookmarkedIds.add(id);
    }
  }

  void toggleComplete() {
    lessons[currentIndex.value] =
        currentLesson.copyWith(isCompleted: !currentLesson.isCompleted);
  }

  void goToPrevious() {
    if (hasPrevious) {
      currentIndex.value--;
      _loadNotesForCurrentLesson();
    }
  }

  void goToNext() {
    if (hasNext) {
      currentIndex.value++;
      _loadNotesForCurrentLesson();
    } else {
      Get.snackbar(
          'All done!', "You've completed the last lesson in this course.");
    }
  }

  void openLesson(String lessonId) {
    final idx = lessons.indexWhere((l) => l.id == lessonId);
    if (idx >= 0) {
      currentIndex.value = idx;
      _loadNotesForCurrentLesson();
    }
  }

  void _loadNotesForCurrentLesson() {
    lessonNotes.value =
        MockNotes.all.where((n) => n.lessonId == currentLesson.id).toList();
  }

  void addQuickNote() {
    final text = noteInputController.text.trim();
    if (text.isEmpty) return;
    lessonNotes.insert(
      0,
      NoteModel(
        id: 'note_${DateTime.now().millisecondsSinceEpoch}',
        courseId: course.id,
        courseTitle: course.title,
        lessonId: currentLesson.id,
        lessonTitle: currentLesson.title,
        title: text.length > 40 ? '${text.substring(0, 40)}...' : text,
        content: text,
        updatedAt: DateTime.now(),
      ),
    );
    noteInputController.clear();
  }

  void openAiAssistant() {
    Get.until((route) => route.settings.name == AppRoutes.main);
    Get.find<NavController>().changeIndex(3);
  }

  @override
  void onClose() {
    noteInputController.dispose();
    super.onClose();
  }
}
