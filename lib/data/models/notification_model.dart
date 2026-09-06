import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

enum NotificationType {
  courseUpdate,
  quizReminder,
  studyReminder,
  achievement,
  newCourse,
}

extension NotificationTypeX on NotificationType {
  IconData get icon {
    switch (this) {
      case NotificationType.courseUpdate:
        return Icons.menu_book_rounded;
      case NotificationType.quizReminder:
        return Icons.quiz_rounded;
      case NotificationType.studyReminder:
        return Icons.alarm_rounded;
      case NotificationType.achievement:
        return Icons.emoji_events_rounded;
      case NotificationType.newCourse:
        return Icons.new_releases_rounded;
    }
  }

  Color get color {
    switch (this) {
      case NotificationType.courseUpdate:
        return AppColors.info;
      case NotificationType.quizReminder:
        return AppColors.warning;
      case NotificationType.studyReminder:
        return AppColors.primary;
      case NotificationType.achievement:
        return AppColors.star;
      case NotificationType.newCourse:
        return AppColors.primaryLight;
    }
  }
}

class NotificationModel {
  final String id;
  final NotificationType type;
  final String title;
  final String message;
  final DateTime timestamp;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.timestamp,
    this.isRead = false,
  });

  NotificationModel copyWith({bool? isRead}) {
    return NotificationModel(
      id: id,
      type: type,
      title: title,
      message: message,
      timestamp: timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
}
