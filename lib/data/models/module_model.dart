import 'lesson_model.dart';

class ModuleModel {
  final String id;
  final String title;
  final List<LessonModel> lessons;

  const ModuleModel({
    required this.id,
    required this.title,
    required this.lessons,
  });

  int get lessonCount => lessons.length;

  int get totalDurationMinutes =>
      lessons.fold(0, (sum, l) => sum + l.durationMinutes);

  int get completedCount => lessons.where((l) => l.isCompleted).length;

  bool get isCompleted => lessons.isNotEmpty && completedCount == lessons.length;
}
