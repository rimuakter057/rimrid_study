import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/quiz_option.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(title: Text(controller.quiz.title)),
      body: SafeArea(
        child: Obx(() {
          switch (controller.phase.value) {
            case QuizPhase.intro:
              return _IntroPhase(controller: controller);
            case QuizPhase.question:
              return _QuestionPhase(controller: controller);
            case QuizPhase.result:
              return _ResultPhase(controller: controller);
          }
        }),
      ),
    );
  }
}

class _IntroPhase extends StatelessWidget {
  final QuizController controller;
  const _IntroPhase({required this.controller});

  @override
  Widget build(BuildContext context) {
    final quiz = controller.quiz;
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: const BoxDecoration(
              color: AppColors.secondaryLight,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.quiz_rounded, size: 40, color: AppColors.primary),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(quiz.title, style: AppTextStyles.h2, textAlign: TextAlign.center),
          const SizedBox(height: AppSpacing.xs),
          Text(
            quiz.courseTitle,
            style: AppTextStyles.bodyRegular,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _StatChip(
                icon: Icons.help_outline_rounded,
                label: '${quiz.questions.length} questions',
              ),
              const SizedBox(width: AppSpacing.sm),
              _StatChip(
                icon: Icons.schedule_rounded,
                label: '${quiz.timeLimitMinutes} min',
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'Answer every question before the timer runs out. You can review '
            'your answers once you submit the quiz.',
            style: AppTextStyles.bodyRegular,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          CustomButton(label: 'Start Quiz', onPressed: controller.startQuiz),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _StatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.secondaryLight,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.primary),
          const SizedBox(width: 4),
          Text(label,
              style: AppTextStyles.label.copyWith(color: AppColors.primaryDark)),
        ],
      ),
    );
  }
}

class _QuestionPhase extends StatelessWidget {
  final QuizController controller;
  const _QuestionPhase({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final question = controller.currentQuestion;
      final selected = controller.selectedForCurrent;
      return Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                    child: LinearProgressIndicator(
                      value: (controller.currentIndex.value + 1) /
                          controller.totalQuestions,
                      minHeight: 6,
                      backgroundColor: AppColors.secondaryLight,
                      valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.timer_outlined, size: 16, color: AppColors.warning),
                    const SizedBox(width: 4),
                    Text(
                      controller.timeLabel,
                      style: AppTextStyles.label.copyWith(color: AppColors.warning),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Question ${controller.currentIndex.value + 1} of ${controller.totalQuestions}',
              style: AppTextStyles.caption,
            ),
            const SizedBox(height: AppSpacing.md),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(question.question, style: AppTextStyles.h3),
                    const SizedBox(height: AppSpacing.lg),
                    ...question.options.asMap().entries.map((entry) {
                      final state = selected == entry.key
                          ? QuizOptionState.selected
                          : QuizOptionState.normal;
                      return QuizOption(
                        label: entry.value,
                        state: state,
                        onTap: () => controller.selectAnswer(entry.key),
                      );
                    }),
                  ],
                ),
              ),
            ),
            CustomButton(
              label: controller.isLastQuestion ? 'Submit Quiz' : 'Next',
              onPressed: selected == null ? null : controller.nextQuestion,
            ),
          ],
        ),
      );
    });
  }
}

class _ResultPhase extends StatelessWidget {
  final QuizController controller;
  const _ResultPhase({required this.controller});

  String _performanceMessage(double accuracy) {
    if (accuracy >= 0.9) return "Outstanding! You've mastered this topic.";
    if (accuracy >= 0.7) return 'Great job! Just a few gaps to close.';
    if (accuracy >= 0.5) return 'Good effort — review the topics you missed.';
    return "Don't worry, revisit the lesson and try again.";
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final correct = controller.correctCount;
      final total = controller.totalQuestions;
      final accuracy = controller.accuracy;

      return SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryLight,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 4),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${(accuracy * 100).round()}%', style: AppTextStyles.h1),
                          Text('Accuracy', style: AppTextStyles.caption),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(_performanceMessage(accuracy),
                      style: AppTextStyles.bodyLarge, textAlign: TextAlign.center),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Row(
              children: [
                Expanded(
                  child: _ResultStat(
                    label: 'Correct',
                    value: '$correct',
                    color: AppColors.success,
                    icon: Icons.check_circle_outline_rounded,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: _ResultStat(
                    label: 'Wrong',
                    value: '${total - correct}',
                    color: AppColors.error,
                    icon: Icons.cancel_outlined,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: _ResultStat(
                    label: 'Total',
                    value: '$total',
                    color: AppColors.primary,
                    icon: Icons.help_outline_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            CustomButton(label: 'Try Again', onPressed: controller.retryQuiz),
            const SizedBox(height: AppSpacing.sm),
            CustomButton(
              label: controller.showReview.value ? 'Hide Review' : 'Review Answers',
              variant: CustomButtonVariant.outlined,
              onPressed: controller.toggleReview,
            ),
            if (controller.showReview.value) ...[
              const SizedBox(height: AppSpacing.xl),
              Text('Review', style: AppTextStyles.sectionTitle),
              const SizedBox(height: AppSpacing.sm),
              ...controller.quiz.questions.asMap().entries.map((entry) {
                final index = entry.key;
                final question = entry.value;
                final userAnswer = controller.selectedAnswers[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: AppSpacing.md),
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${index + 1}. ${question.question}',
                          style: AppTextStyles.cardTitle),
                      const SizedBox(height: AppSpacing.sm),
                      ...question.options.asMap().entries.map((optEntry) {
                        QuizOptionState state = QuizOptionState.normal;
                        if (optEntry.key == question.correctIndex) {
                          state = QuizOptionState.correct;
                        } else if (optEntry.key == userAnswer) {
                          state = QuizOptionState.incorrect;
                        }
                        return QuizOption(label: optEntry.value, state: state);
                      }),
                      if (question.explanation.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.xs),
                        Text(question.explanation, style: AppTextStyles.bodyRegular),
                      ],
                    ],
                  ),
                );
              }),
            ],
          ],
        ),
      );
    });
  }
}

class _ResultStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;

  const _ResultStat({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.h3),
          Text(label, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
