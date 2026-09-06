import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/search_field.dart';
import '../controllers/notes_controller.dart';
import '../widgets/note_card.dart';

class NotesView extends GetView<NotesController> {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(title: const Text('My Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.openNewNote,
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: SearchFieldWidget(
              hint: 'Search notes...',
              onChanged: (value) => controller.searchQuery.value = value,
            ),
          ),
          Expanded(
            child: Obx(() {
              final notes = controller.filteredNotes;
              if (notes.isEmpty) {
                return const EmptyState(
                  icon: Icons.note_alt_outlined,
                  title: 'No notes yet',
                  message:
                      'Notes you take while learning will show up here, '
                      'organized by course and lesson.',
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md, 0, AppSpacing.md, AppSpacing.xxl),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return NoteCard(
                    note: note,
                    onTap: () => controller.openEditNote(note),
                    onToggleImportant: () => controller.toggleImportant(note.id),
                    onDelete: () => controller.deleteNote(note.id),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
