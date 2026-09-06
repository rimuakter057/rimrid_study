import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/study_task_model.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/stat_card.dart';
import '../controllers/study_planner_controller.dart';

class StudyPlannerView extends GetView<StudyPlannerController> {
  const StudyPlannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(title: const Text('Study Planner')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddTaskSheet(context),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Obx(
              () => Row(
                children: [
                  Expanded(
                    child: StatCard(
                      icon: Icons.track_changes_rounded,
                      value: '${controller.completedMinutesToday}/'
                          '${controller.totalMinutesToday} min',
                      label: 'Planned for this day',
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: StatCard(
                      icon: Icons.task_alt_rounded,
                      value:
                          '${controller.tasksForSelectedDay.where((t) => t.isCompleted).length}/'
                          '${controller.tasksForSelectedDay.length}',
                      label: 'Tasks completed',
                      accentColor: AppColors.success,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 76,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              itemCount: controller.weekDays.length,
              separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.xs),
              itemBuilder: (context, index) {
                final day = controller.weekDays[index];
                return Obx(() {
                  final selected = controller.isSelected(day);
                  final today = controller.isToday(day);
                  final hasTask = controller.hasTasks(day);
                  return GestureDetector(
                    onTap: () => controller.selectDate(day),
                    child: Container(
                      width: 52,
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primary : AppColors.surface,
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                        border: Border.all(
                          color: selected
                              ? AppColors.primary
                              : (today ? AppColors.primaryLight : AppColors.border),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            DateFormat('E').format(day),
                            style: AppTextStyles.caption.copyWith(
                              color: selected ? Colors.white70 : AppColors.textMuted,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat('d').format(day),
                            style: AppTextStyles.cardTitle.copyWith(
                              color: selected ? Colors.white : AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: hasTask
                                  ? (selected ? Colors.white : AppColors.primary)
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Expanded(
            child: Obx(() {
              final tasks = controller.tasksForSelectedDay;
              if (tasks.isEmpty) {
                return const EmptyState(
                  icon: Icons.event_note_outlined,
                  title: 'Nothing planned',
                  message: 'Tap the + button to add a study task for this day.',
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md, 0, AppSpacing.md, AppSpacing.xxl),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return _TaskTile(
                    task: task,
                    onToggle: () => controller.toggleTaskComplete(task.id),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _openAddTaskSheet(BuildContext context) {
    controller.openAddTaskSheet();
    Get.bottomSheet(
      Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.lg,
          right: AppSpacing.lg,
          top: AppSpacing.lg,
          bottom: MediaQuery.viewInsetsOf(context).bottom + AppSpacing.lg,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add Study Task', style: AppTextStyles.h3),
                const SizedBox(height: AppSpacing.md),
                TextField(
                  controller: controller.titleController,
                  decoration: const InputDecoration(hintText: 'e.g. Widget testing basics'),
                ),
                const SizedBox(height: AppSpacing.md),
                TextField(
                  controller: controller.durationController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Duration in minutes'),
                ),
                const SizedBox(height: AppSpacing.md),
                Obx(
                  () => Wrap(
                    spacing: AppSpacing.xs,
                    children: StudyTaskType.values.map((type) {
                      final selected = controller.selectedType.value == type;
                      return ChoiceChip(
                        label: Text(type.label),
                        selected: selected,
                        onSelected: (_) => controller.selectType(type),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                CustomButton(label: 'Save Task', onPressed: controller.addTask),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TaskTile extends StatelessWidget {
  final StudyTaskModel task;
  final VoidCallback onToggle;

  const _TaskTile({required this.task, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.secondaryLight,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Icon(task.type.icon, size: 20, color: AppColors.primary),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: AppTextStyles.cardTitle.copyWith(
                    decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                    color: task.isCompleted ? AppColors.textMuted : AppColors.textPrimary,
                  ),
                ),
                if (task.courseTitle != null)
                  Text(
                    task.courseTitle!,
                    style: AppTextStyles.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.schedule_rounded, size: 12, color: AppColors.textMuted),
                    const SizedBox(width: 4),
                    Text('${task.durationMinutes} min', style: AppTextStyles.caption),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onToggle,
            child: Icon(
              task.isCompleted
                  ? Icons.check_circle_rounded
                  : Icons.radio_button_unchecked_rounded,
              color: task.isCompleted ? AppColors.success : AppColors.textMuted,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
