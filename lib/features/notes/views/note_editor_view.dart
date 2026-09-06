import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/mock/mock_courses.dart';
import '../../../shared/widgets/custom_button.dart';
import '../controllers/notes_controller.dart';

class NoteEditorView extends GetView<NotesController> {
  const NoteEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Obx(() => Text(controller.isEditing ? 'Edit Note' : 'New Note')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!controller.isEditing) ...[
              Text('Course', style: AppTextStyles.label),
              const SizedBox(height: AppSpacing.xs),
              Obx(
                () => Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryLighter,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: controller.selectedCourseDraft.value,
                      items: MockCourses.all
                          .map((c) => DropdownMenuItem(
                                value: c,
                                child: Text(c.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bodyMedium),
                              ))
                          .toList(),
                      onChanged: (course) {
                        if (course != null) controller.selectCourseDraft(course);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
            Text('Title', style: AppTextStyles.label),
            const SizedBox(height: AppSpacing.xs),
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(hintText: 'e.g. GetX state tips'),
            ),
            const SizedBox(height: AppSpacing.md),
            Text('Content', style: AppTextStyles.label),
            const SizedBox(height: AppSpacing.xs),
            TextField(
              controller: controller.contentController,
              minLines: 6,
              maxLines: 12,
              decoration: const InputDecoration(hintText: 'Write your note here...'),
            ),
            const SizedBox(height: AppSpacing.md),
            Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(color: AppColors.border),
                ),
                child: SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  activeThumbColor: AppColors.primary,
                  title: Text('Mark as important', style: AppTextStyles.bodyMedium),
                  value: controller.isImportantDraft.value,
                  onChanged: (_) => controller.toggleImportantDraft(),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            CustomButton(label: 'Save Note', onPressed: controller.saveNote),
          ],
        ),
      ),
    );
  }
}
