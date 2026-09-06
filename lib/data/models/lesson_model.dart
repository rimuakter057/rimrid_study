enum LessonResourceType { pdf, slides, code, link }

class LessonResourceModel {
  final String title;
  final LessonResourceType type;

  const LessonResourceModel({required this.title, required this.type});
}

class LessonModel {
  final String id;
  final String courseId;
  final String moduleTitle;
  final String title;
  final String description;
  final int durationMinutes;
  final String videoThumbnailUrl;
  final bool isPreview;
  final List<LessonResourceModel> resources;
  final bool isCompleted;

  const LessonModel({
    required this.id,
    required this.courseId,
    required this.moduleTitle,
    required this.title,
    required this.description,
    required this.durationMinutes,
    required this.videoThumbnailUrl,
    this.isPreview = false,
    this.resources = const [],
    this.isCompleted = false,
  });

  LessonModel copyWith({bool? isCompleted}) {
    return LessonModel(
      id: id,
      courseId: courseId,
      moduleTitle: moduleTitle,
      title: title,
      description: description,
      durationMinutes: durationMinutes,
      videoThumbnailUrl: videoThumbnailUrl,
      isPreview: isPreview,
      resources: resources,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
