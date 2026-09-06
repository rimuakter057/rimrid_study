import '../models/notification_model.dart';

class MockNotifications {
  MockNotifications._();

  static final List<NotificationModel> all = [
    NotificationModel(
      id: 'n1',
      type: NotificationType.quizReminder,
      title: 'Quiz reminder',
      message: 'Your "Flutter Widgets Quiz" is due today. Take it now to keep your streak going.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
    ),
    NotificationModel(
      id: 'n2',
      type: NotificationType.achievement,
      title: 'New achievement unlocked',
      message: 'You reached a 12-day study streak. Keep it up!',
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    NotificationModel(
      id: 'n3',
      type: NotificationType.courseUpdate,
      title: 'Course updated',
      message: '"Complete Flutter Development Bootcamp" added 3 new lessons on animations.',
      timestamp: DateTime.now().subtract(const Duration(hours: 6)),
      isRead: true,
    ),
    NotificationModel(
      id: 'n4',
      type: NotificationType.studyReminder,
      title: "Don't break your streak",
      message: "You haven't studied today. Spend 15 minutes to hit your daily goal.",
      timestamp: DateTime.now().subtract(const Duration(hours: 9)),
      isRead: true,
    ),
    NotificationModel(
      id: 'n5',
      type: NotificationType.newCourse,
      title: 'New course recommended for you',
      message: '"Deep Learning with TensorFlow" just launched based on your interests.',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
    NotificationModel(
      id: 'n6',
      type: NotificationType.achievement,
      title: 'Certificate earned',
      message: 'Congratulations! You completed "Dart Programming Fundamentals".',
      timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 4)),
      isRead: true,
    ),
    NotificationModel(
      id: 'n7',
      type: NotificationType.quizReminder,
      title: 'Quiz results ready',
      message: 'Your "Pandas DataFrames Quiz" results are ready to review.',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      isRead: true,
    ),
    NotificationModel(
      id: 'n8',
      type: NotificationType.courseUpdate,
      title: 'Assignment graded',
      message: 'Your instructor left feedback on your latest lesson notes.',
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
      isRead: true,
    ),
  ];
}
