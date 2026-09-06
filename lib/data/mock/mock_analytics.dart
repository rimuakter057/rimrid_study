import '../models/study_activity_model.dart';

class MockAnalytics {
  MockAnalytics._();

  static const List<DailyActivityModel> weeklyActivity = [
    DailyActivityModel(dayLabel: 'Mon', hours: 1.5),
    DailyActivityModel(dayLabel: 'Tue', hours: 2.0),
    DailyActivityModel(dayLabel: 'Wed', hours: 0.75),
    DailyActivityModel(dayLabel: 'Thu', hours: 2.5),
    DailyActivityModel(dayLabel: 'Fri', hours: 1.25),
    DailyActivityModel(dayLabel: 'Sat', hours: 3.0),
    DailyActivityModel(dayLabel: 'Sun', hours: 1.0),
  ];

  static const List<TopicMasteryModel> strongTopics = [
    TopicMasteryModel(topic: 'Dart Fundamentals', masteryPercent: 0.94),
    TopicMasteryModel(topic: 'Flutter Widgets', masteryPercent: 0.88),
    TopicMasteryModel(topic: 'State Management', masteryPercent: 0.82),
  ];

  static const List<TopicMasteryModel> weakTopics = [
    TopicMasteryModel(topic: 'Async & Futures', masteryPercent: 0.48),
    TopicMasteryModel(topic: 'Pandas DataFrames', masteryPercent: 0.55),
    TopicMasteryModel(topic: 'Neural Networks', masteryPercent: 0.39),
  ];

  static double get weeklyTotalHours =>
      weeklyActivity.fold(0.0, (sum, d) => sum + d.hours);

  static const int coursesCompleted = 1;
  static const int lessonsCompleted = 62;
  static const double quizAverage = 0.84;
  static const double overallProgress = 0.47;
}
