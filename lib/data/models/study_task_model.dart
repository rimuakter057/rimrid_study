import 'package:flutter/material.dart';

enum StudyTaskType { lesson, quiz, review, practice }

extension StudyTaskTypeX on StudyTaskType {
  String get label {
    switch (this) {
      case StudyTaskType.lesson:
        return 'Lesson';
      case StudyTaskType.quiz:
        return 'Quiz';
      case StudyTaskType.review:
        return 'Review';
      case StudyTaskType.practice:
        return 'Practice';
    }
  }

  IconData get icon {
    switch (this) {
      case StudyTaskType.lesson:
        return Icons.play_circle_outline_rounded;
      case StudyTaskType.quiz:
        return Icons.quiz_outlined;
      case StudyTaskType.review:
        return Icons.replay_circle_filled_outlined;
      case StudyTaskType.practice:
        return Icons.fitness_center_rounded;
    }
  }
}

class StudyTaskModel {
  final String id;
  final String title;
  final String? courseTitle;
  final int durationMinutes;
  final DateTime date;
  final StudyTaskType type;
  final bool isCompleted;

  const StudyTaskModel({
    required this.id,
    required this.title,
    this.courseTitle,
    required this.durationMinutes,
    required this.date,
    required this.type,
    this.isCompleted = false,
  });

  StudyTaskModel copyWith({bool? isCompleted}) {
    return StudyTaskModel(
      id: id,
      title: title,
      courseTitle: courseTitle,
      durationMinutes: durationMinutes,
      date: date,
      type: type,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
