class QuizQuestionModel {
  final String id;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const QuizQuestionModel({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
    this.explanation = '',
  });
}

class QuizModel {
  final String id;
  final String title;
  final String courseTitle;
  final int timeLimitMinutes;
  final List<QuizQuestionModel> questions;

  const QuizModel({
    required this.id,
    required this.title,
    required this.courseTitle,
    required this.timeLimitMinutes,
    required this.questions,
  });
}
