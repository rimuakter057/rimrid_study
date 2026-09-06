import '../models/study_task_model.dart';

class MockStudyTasks {
  MockStudyTasks._();

  static DateTime _day(int offsetFromToday) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day + offsetFromToday);
  }

  static final List<StudyTaskModel> all = [
    // Yesterday — completed
    StudyTaskModel(
      id: 't1',
      title: 'React Components Review',
      courseTitle: 'Modern JavaScript & Web Development',
      durationMinutes: 35,
      date: _day(-1),
      type: StudyTaskType.review,
      isCompleted: true,
    ),
    StudyTaskModel(
      id: 't2',
      title: 'Async/Await Practice',
      courseTitle: 'Modern JavaScript & Web Development',
      durationMinutes: 25,
      date: _day(-1),
      type: StudyTaskType.practice,
      isCompleted: true,
    ),

    // Today
    StudyTaskModel(
      id: 't3',
      title: 'Dart OOP',
      courseTitle: 'Dart Programming Fundamentals',
      durationMinutes: 30,
      date: _day(0),
      type: StudyTaskType.lesson,
      isCompleted: true,
    ),
    StudyTaskModel(
      id: 't4',
      title: 'Flutter Widgets',
      courseTitle: 'Complete Flutter Development Bootcamp',
      durationMinutes: 45,
      date: _day(0),
      type: StudyTaskType.lesson,
    ),
    StudyTaskModel(
      id: 't5',
      title: 'Complete Quiz',
      courseTitle: 'Complete Flutter Development Bootcamp',
      durationMinutes: 15,
      date: _day(0),
      type: StudyTaskType.quiz,
    ),

    // Tomorrow
    StudyTaskModel(
      id: 't6',
      title: 'State Management Deep Dive',
      courseTitle: 'Complete Flutter Development Bootcamp',
      durationMinutes: 40,
      date: _day(1),
      type: StudyTaskType.lesson,
    ),
    StudyTaskModel(
      id: 't7',
      title: 'Pandas DataFrames Practice',
      courseTitle: 'Python for Data Science & Analytics',
      durationMinutes: 30,
      date: _day(1),
      type: StudyTaskType.practice,
    ),

    // Day after tomorrow
    StudyTaskModel(
      id: 't8',
      title: 'Pandas DataFrames Quiz',
      courseTitle: 'Python for Data Science & Analytics',
      durationMinutes: 15,
      date: _day(2),
      type: StudyTaskType.quiz,
    ),

    // +3 days
    StudyTaskModel(
      id: 't9',
      title: 'Working with REST APIs',
      courseTitle: 'Complete Flutter Development Bootcamp',
      durationMinutes: 40,
      date: _day(3),
      type: StudyTaskType.lesson,
    ),

    // +4 days
    StudyTaskModel(
      id: 't10',
      title: 'Design Systems Review',
      courseTitle: 'UI/UX Design for Mobile Apps',
      durationMinutes: 30,
      date: _day(4),
      type: StudyTaskType.review,
    ),
  ];
}
