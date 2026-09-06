import 'dart:async';
import 'package:get/get.dart';
import '../../../data/mock/mock_quizzes.dart';
import '../../../data/models/quiz_model.dart';

enum QuizPhase { intro, question, result }

class QuizController extends GetxController {
  late final QuizModel quiz;
  final Rx<QuizPhase> phase = QuizPhase.intro.obs;
  final RxInt currentIndex = 0.obs;
  final RxMap<int, int> selectedAnswers = <int, int>{}.obs;
  final RxInt secondsRemaining = 0.obs;
  final RxBool showReview = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    final quizId = Get.arguments as String;
    quiz = MockQuizzes.byId(quizId);
    secondsRemaining.value = quiz.timeLimitMinutes * 60;
  }

  QuizQuestionModel get currentQuestion => quiz.questions[currentIndex.value];
  int get totalQuestions => quiz.questions.length;
  int? get selectedForCurrent => selectedAnswers[currentIndex.value];
  bool get isLastQuestion => currentIndex.value == totalQuestions - 1;

  void startQuiz() {
    phase.value = QuizPhase.question;
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value <= 0) {
        timer.cancel();
        _finishQuiz();
        return;
      }
      secondsRemaining.value--;
    });
  }

  void selectAnswer(int optionIndex) {
    selectedAnswers[currentIndex.value] = optionIndex;
  }

  void nextQuestion() {
    if (!isLastQuestion) {
      currentIndex.value++;
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    _timer?.cancel();
    phase.value = QuizPhase.result;
  }

  int get correctCount {
    var count = 0;
    for (var i = 0; i < quiz.questions.length; i++) {
      if (selectedAnswers[i] == quiz.questions[i].correctIndex) count++;
    }
    return count;
  }

  double get accuracy =>
      totalQuestions == 0 ? 0 : correctCount / totalQuestions;

  void toggleReview() => showReview.value = !showReview.value;

  void retryQuiz() {
    currentIndex.value = 0;
    selectedAnswers.clear();
    showReview.value = false;
    secondsRemaining.value = quiz.timeLimitMinutes * 60;
    phase.value = QuizPhase.intro;
  }

  String get timeLabel {
    final m = (secondsRemaining.value ~/ 60).toString().padLeft(2, '0');
    final s = (secondsRemaining.value % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
