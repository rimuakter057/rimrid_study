enum UpcomingItemType { quiz, assignment }

class UpcomingItemModel {
  final String id;
  final UpcomingItemType type;
  final String title;
  final String courseTitle;
  final DateTime dueDate;
  final String? quizId;

  const UpcomingItemModel({
    required this.id,
    required this.type,
    required this.title,
    required this.courseTitle,
    required this.dueDate,
    this.quizId,
  });
}
