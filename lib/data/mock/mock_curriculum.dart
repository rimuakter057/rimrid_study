import '../../core/utils/mock_images.dart';
import '../models/course_model.dart';
import '../models/lesson_model.dart';
import '../models/module_model.dart';

/// Generates a realistic curriculum (modules + lessons) for any mock course
/// so no Course Details page is ever empty. Lesson-completion is derived
/// from the course's mock [CourseModel.progress].
class MockCurriculum {
  MockCurriculum._();

  static final Map<String, List<ModuleModel>> _cache = {};

  static List<ModuleModel> forCourse(CourseModel course) {
    return _cache.putIfAbsent(course.id, () => _generate(course));
  }

  static List<ModuleModel> _generate(CourseModel course) {
    final moduleTemplates = _templatesFor(course.categoryId);
    final totalLessons = course.lessonsCount;
    final baseLessonsPerModule =
        (totalLessons / moduleTemplates.length).round().clamp(3, 14);
    final completedTarget =
        course.isEnrolled ? (totalLessons * (course.progress ?? 0)).round() : 0;

    final modules = <ModuleModel>[];
    var lessonIndex = 0;

    for (var m = 0; m < moduleTemplates.length; m++) {
      final isLastModule = m == moduleTemplates.length - 1;
      final remaining = totalLessons - lessonIndex;
      final lessonsInModule =
          isLastModule ? remaining : baseLessonsPerModule.clamp(1, remaining);
      if (lessonsInModule <= 0) continue;

      final lessons = <LessonModel>[];
      for (var l = 0; l < lessonsInModule; l++) {
        final globalIndex = lessonIndex;
        lessonIndex++;
        lessons.add(LessonModel(
          id: '${course.id}_l$globalIndex',
          courseId: course.id,
          moduleTitle: moduleTemplates[m],
          title: _lessonTitle(moduleTemplates[m], l),
          description:
              'A hands-on lesson covering ${moduleTemplates[m].toLowerCase()} '
              'with practical examples and a short recap at the end.',
          durationMinutes: 8 + (globalIndex % 5) * 4,
          videoThumbnailUrl:
              MockImages.course('${course.id}-lesson-$globalIndex'),
          isPreview: globalIndex == 0,
          isCompleted: globalIndex < completedTarget,
          resources: globalIndex % 3 == 0
              ? const [
                  LessonResourceModel(
                      title: 'Lesson slides.pdf', type: LessonResourceType.pdf),
                  LessonResourceModel(
                      title: 'Starter code', type: LessonResourceType.code),
                ]
              : const [],
        ));
      }
      modules.add(ModuleModel(
        id: '${course.id}_m$m',
        title: moduleTemplates[m],
        lessons: lessons,
      ));
    }
    return modules;
  }

  static List<String> _templatesFor(String categoryId) {
    switch (categoryId) {
      case 'mobile_dev':
        return const [
          'Getting Started',
          'Core Fundamentals',
          'Building UI',
          'State Management',
          'Working with APIs',
          'Publishing Your App',
        ];
      case 'web_dev':
        return const [
          'Getting Started',
          'Core Concepts',
          'Building Components',
          'Working with Data',
          'Deployment',
        ];
      case 'ui_ux':
        return const [
          'Design Foundations',
          'Research & Wireframing',
          'Prototyping',
          'Design Systems',
          'Handoff & Testing',
        ];
      case 'data_science':
        return const [
          'Foundations',
          'Data Wrangling',
          'Visualization',
          'Statistical Analysis',
          'Final Project',
        ];
      case 'ai_ml':
        return const [
          'Introduction',
          'Core Algorithms',
          'Model Building',
          'Evaluation & Tuning',
          'Deployment',
        ];
      case 'business':
        return const ['Foundations', 'Strategy', 'Operations', 'Case Studies'];
      case 'marketing':
        return const [
          'Foundations',
          'Channels & Content',
          'Experimentation',
          'Retention',
        ];
      case 'programming':
      default:
        return const [
          'Getting Started',
          'Core Concepts',
          'Practical Exercises',
          'Advanced Topics',
          'Final Project',
        ];
    }
  }

  static String _lessonTitle(String moduleTitle, int index) {
    const suffixes = [
      'Overview and setup',
      'Key concepts explained',
      'Hands-on walkthrough',
      'Best practices',
      'Common pitfalls to avoid',
      'Building a real example',
      'Deep dive',
      'Putting it all together',
      'Practice exercise',
      'Review and recap',
    ];
    return '$moduleTitle: ${suffixes[index % suffixes.length]}';
  }
}
