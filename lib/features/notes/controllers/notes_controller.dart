import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/mock/mock_courses.dart';
import '../../../data/mock/mock_notes.dart';
import '../../../data/models/course_model.dart';
import '../../../data/models/note_model.dart';

class NotesController extends GetxController {
  final RxList<NoteModel> notes = <NoteModel>[].obs;
  final RxString searchQuery = ''.obs;

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final Rxn<String> editingNoteId = Rxn<String>();
  final RxBool isImportantDraft = false.obs;
  final Rxn<CourseModel> selectedCourseDraft = Rxn<CourseModel>();

  @override
  void onInit() {
    super.onInit();
    notes.value = List.of(MockNotes.all);
  }

  List<NoteModel> get filteredNotes {
    final q = searchQuery.value.trim().toLowerCase();
    final list = q.isEmpty
        ? notes
        : notes
            .where((n) =>
                n.title.toLowerCase().contains(q) ||
                n.content.toLowerCase().contains(q) ||
                n.courseTitle.toLowerCase().contains(q))
            .toList();
    final sorted = [...list]
      ..sort((a, b) {
        if (a.isImportant != b.isImportant) return a.isImportant ? -1 : 1;
        return b.updatedAt.compareTo(a.updatedAt);
      });
    return sorted;
  }

  bool get isEditing => editingNoteId.value != null;

  void openNewNote() {
    editingNoteId.value = null;
    titleController.clear();
    contentController.clear();
    isImportantDraft.value = false;
    selectedCourseDraft.value = MockCourses.all.first;
    Get.toNamed(AppRoutes.noteEditor);
  }

  void openEditNote(NoteModel note) {
    editingNoteId.value = note.id;
    titleController.text = note.title;
    contentController.text = note.content;
    isImportantDraft.value = note.isImportant;
    selectedCourseDraft.value = MockCourses.byId(note.courseId);
    Get.toNamed(AppRoutes.noteEditor);
  }

  void selectCourseDraft(CourseModel course) => selectedCourseDraft.value = course;

  void toggleImportantDraft() => isImportantDraft.value = !isImportantDraft.value;

  void saveNote() {
    final title = titleController.text.trim();
    final content = contentController.text.trim();
    if (title.isEmpty || content.isEmpty) {
      Get.snackbar('Missing info', 'Please add both a title and content.');
      return;
    }

    if (editingNoteId.value != null) {
      final idx = notes.indexWhere((n) => n.id == editingNoteId.value);
      if (idx >= 0) {
        notes[idx] = notes[idx].copyWith(
          title: title,
          content: content,
          isImportant: isImportantDraft.value,
          updatedAt: DateTime.now(),
        );
      }
    } else {
      final course = selectedCourseDraft.value ?? MockCourses.all.first;
      notes.insert(
        0,
        NoteModel(
          id: 'note_${DateTime.now().millisecondsSinceEpoch}',
          courseId: course.id,
          courseTitle: course.title,
          title: title,
          content: content,
          isImportant: isImportantDraft.value,
          updatedAt: DateTime.now(),
        ),
      );
    }
    Get.back();
  }

  void deleteNote(String id) => notes.removeWhere((n) => n.id == id);

  void toggleImportant(String id) {
    final idx = notes.indexWhere((n) => n.id == id);
    if (idx >= 0) {
      notes[idx] = notes[idx].copyWith(isImportant: !notes[idx].isImportant);
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }
}
