import '../models/upcoming_item_model.dart';

class MockUpcomingItems {
  MockUpcomingItems._();

  static final List<UpcomingItemModel> all = [
    UpcomingItemModel(
      id: 'up_1',
      type: UpcomingItemType.quiz,
      title: 'Flutter Widgets Quiz',
      courseTitle: 'Complete Flutter Development Bootcamp',
      dueDate: DateTime.now().add(const Duration(hours: 6)),
      quizId: 'quiz_flutter_widgets',
    ),
    UpcomingItemModel(
      id: 'up_2',
      type: UpcomingItemType.assignment,
      title: 'Build a REST API client',
      courseTitle: 'Modern JavaScript & Web Development',
      dueDate: DateTime.now().add(const Duration(days: 2)),
    ),
    UpcomingItemModel(
      id: 'up_3',
      type: UpcomingItemType.quiz,
      title: 'Pandas DataFrames Quiz',
      courseTitle: 'Python for Data Science & Analytics',
      dueDate: DateTime.now().add(const Duration(days: 4)),
      quizId: 'quiz_pandas_dataframes',
    ),
  ];
}
