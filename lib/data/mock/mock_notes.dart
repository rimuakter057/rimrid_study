import '../models/note_model.dart';
import 'mock_courses.dart';

class MockNotes {
  MockNotes._();

  static final List<NoteModel> all = [
    NoteModel(
      id: 'n1',
      courseId: 'c_flutter_dev',
      courseTitle: MockCourses.byId('c_flutter_dev').title,
      lessonId: 'c_flutter_dev_l12',
      lessonTitle: 'State Management: Key concepts explained',
      title: 'GetX reactive state cheatsheet',
      content:
          'Use .obs for simple reactive variables and Obx(() => ...) to '
          'rebuild only the widgets that read them. GetBuilder is better for '
          'heavier controllers where I want manual update() calls instead of '
          'full reactivity.',
      isImportant: true,
      updatedAt: DateTime(2026, 9, 2, 21, 10),
    ),
    NoteModel(
      id: 'n2',
      courseId: 'c_flutter_dev',
      courseTitle: MockCourses.byId('c_flutter_dev').title,
      lessonId: 'c_flutter_dev_l8',
      lessonTitle: 'Building UI: Hands-on walkthrough',
      title: 'Widget tree vs Element tree',
      content:
          'Widgets are immutable configuration; Elements are the actual '
          'mutable objects in the tree that hold state and get updated in '
          'place when possible. This is why keys matter for list reordering.',
      updatedAt: DateTime(2026, 8, 29, 19, 40),
    ),
    NoteModel(
      id: 'n3',
      courseId: 'c_js_web',
      courseTitle: MockCourses.byId('c_js_web').title,
      lessonId: 'c_js_web_l5',
      lessonTitle: 'Core Concepts: Deep dive',
      title: 'Async/await error handling pattern',
      content:
          'Wrap await calls in try/catch instead of chaining .catch() when '
          'using async/await syntax — keeps error handling readable and '
          'co-located with the call that can fail.',
      isImportant: true,
      updatedAt: DateTime(2026, 8, 25, 10, 5),
    ),
    NoteModel(
      id: 'n4',
      courseId: 'c_python_ds',
      courseTitle: MockCourses.byId('c_python_ds').title,
      lessonId: 'c_python_ds_l2',
      lessonTitle: 'Foundations: Hands-on walkthrough',
      title: 'Pandas DataFrame quick reference',
      content:
          'df.loc[] is label-based, df.iloc[] is position-based. Use '
          'df.groupby("col").agg() for aggregations instead of manual loops '
          '— much faster on large datasets.',
      updatedAt: DateTime(2026, 8, 20, 16, 15),
    ),
    NoteModel(
      id: 'n5',
      courseId: 'c_uiux_mobile',
      courseTitle: MockCourses.byId('c_uiux_mobile').title,
      title: 'Design system tokens to reuse',
      content:
          'Spacing scale: 4/8/12/16/20/24/32/40. Radius scale: 8/12/16/20/28. '
          'Keep this consistent across every screen for visual rhythm.',
      updatedAt: DateTime(2026, 8, 12, 9, 30),
    ),
    NoteModel(
      id: 'n6',
      courseId: 'c_flutter_dev',
      courseTitle: MockCourses.byId('c_flutter_dev').title,
      title: 'App store submission checklist',
      content:
          'Screenshots for all required device sizes, privacy policy URL, '
          'app icon without transparency, and a build number bump before '
          'every submission.',
      isImportant: true,
      updatedAt: DateTime(2026, 8, 5, 14, 50),
    ),
  ];
}
