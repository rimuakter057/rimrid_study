import 'instructor_model.dart';

enum CourseLevel { beginner, intermediate, advanced }

extension CourseLevelX on CourseLevel {
  String get label {
    switch (this) {
      case CourseLevel.beginner:
        return 'Beginner';
      case CourseLevel.intermediate:
        return 'Intermediate';
      case CourseLevel.advanced:
        return 'Advanced';
    }
  }
}

class CourseModel {
  final String id;
  final String title;
  final String thumbnailUrl;
  final InstructorModel instructor;
  final String categoryId;
  final double rating;
  final int reviewsCount;
  final int studentsCount;
  final int lessonsCount;
  final double durationHours;
  final CourseLevel level;
  final double price;
  final bool isFree;
  final bool isPopular;
  final bool isNew;
  final String description;
  final List<String> whatYoullLearn;

  /// 0.0-1.0 when the current mock user is enrolled, null otherwise.
  final double? progress;
  final bool isSaved;
  final String? currentLessonTitle;

  const CourseModel({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.instructor,
    required this.categoryId,
    required this.rating,
    required this.reviewsCount,
    required this.studentsCount,
    required this.lessonsCount,
    required this.durationHours,
    required this.level,
    required this.price,
    this.isFree = false,
    this.isPopular = false,
    this.isNew = false,
    this.description = '',
    this.whatYoullLearn = const [],
    this.progress,
    this.isSaved = false,
    this.currentLessonTitle,
  });

  bool get isEnrolled => progress != null;
  bool get isCompleted => progress != null && progress! >= 1.0;

  String get priceLabel => isFree ? 'Free' : '\$${price.toStringAsFixed(2)}';
}
