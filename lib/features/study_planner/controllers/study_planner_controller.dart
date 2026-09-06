import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/mock/mock_study_tasks.dart';
import '../../../data/models/study_task_model.dart';

class StudyPlannerController extends GetxController {
  final RxList<StudyTaskModel> tasks = <StudyTaskModel>[].obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  final titleController = TextEditingController();
  final durationController = TextEditingController(text: '30');
  final Rx<StudyTaskType> selectedType = StudyTaskType.lesson.obs;

  @override
  void onInit() {
    super.onInit();
    tasks.value = List.of(MockStudyTasks.all);
    selectedDate.value = _dateOnly(DateTime.now());
  }

  static DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  List<DateTime> get weekDays {
    final today = _dateOnly(DateTime.now());
    final start = today.subtract(const Duration(days: 3));
    return List.generate(7, (i) => start.add(Duration(days: i)));
  }

  bool isSelected(DateTime date) => _dateOnly(date) == selectedDate.value;
  bool isToday(DateTime date) => _dateOnly(date) == _dateOnly(DateTime.now());

  bool hasTasks(DateTime date) =>
      tasks.any((t) => _dateOnly(t.date) == _dateOnly(date));

  void selectDate(DateTime date) => selectedDate.value = _dateOnly(date);

  List<StudyTaskModel> get tasksForSelectedDay => tasks
      .where((t) => _dateOnly(t.date) == selectedDate.value)
      .toList()
    ..sort((a, b) => a.isCompleted == b.isCompleted ? 0 : (a.isCompleted ? 1 : -1));

  int get completedMinutesToday => tasksForSelectedDay
      .where((t) => t.isCompleted)
      .fold(0, (sum, t) => sum + t.durationMinutes);

  int get totalMinutesToday =>
      tasksForSelectedDay.fold(0, (sum, t) => sum + t.durationMinutes);

  void toggleTaskComplete(String id) {
    final idx = tasks.indexWhere((t) => t.id == id);
    if (idx >= 0) {
      tasks[idx] = tasks[idx].copyWith(isCompleted: !tasks[idx].isCompleted);
    }
  }

  void openAddTaskSheet() {
    titleController.clear();
    durationController.text = '30';
    selectedType.value = StudyTaskType.lesson;
  }

  void selectType(StudyTaskType type) => selectedType.value = type;

  void addTask() {
    final title = titleController.text.trim();
    if (title.isEmpty) {
      Get.snackbar('Missing title', 'Please enter a task title.');
      return;
    }
    final duration = int.tryParse(durationController.text.trim()) ?? 30;
    tasks.add(
      StudyTaskModel(
        id: 'task_${DateTime.now().millisecondsSinceEpoch}',
        title: title,
        durationMinutes: duration,
        date: selectedDate.value,
        type: selectedType.value,
      ),
    );
    Get.back();
  }

  @override
  void onClose() {
    titleController.dispose();
    durationController.dispose();
    super.onClose();
  }
}
