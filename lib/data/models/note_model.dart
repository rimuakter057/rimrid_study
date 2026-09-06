class NoteModel {
  final String id;
  final String courseId;
  final String courseTitle;
  final String? lessonId;
  final String? lessonTitle;
  final String title;
  final String content;
  final bool isImportant;
  final DateTime updatedAt;

  const NoteModel({
    required this.id,
    required this.courseId,
    required this.courseTitle,
    this.lessonId,
    this.lessonTitle,
    required this.title,
    required this.content,
    this.isImportant = false,
    required this.updatedAt,
  });

  NoteModel copyWith({
    String? title,
    String? content,
    bool? isImportant,
    DateTime? updatedAt,
  }) {
    return NoteModel(
      id: id,
      courseId: courseId,
      courseTitle: courseTitle,
      lessonId: lessonId,
      lessonTitle: lessonTitle,
      title: title ?? this.title,
      content: content ?? this.content,
      isImportant: isImportant ?? this.isImportant,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
