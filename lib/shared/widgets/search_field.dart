import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

/// Pill-shaped search bar used on Home, Explore, and Notes.
class SearchFieldWidget extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final Widget? trailing;

  const SearchFieldWidget({
    super.key,
    this.hint = 'Search courses, lessons...',
    this.controller,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.secondaryLighter,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                const Icon(Icons.search_rounded,
                    size: 20, color: AppColors.textMuted),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: TextField(
                    controller: controller,
                    onTap: onTap,
                    onChanged: onChanged,
                    readOnly: readOnly,
                    style: AppTextStyles.bodyMedium,
                    decoration: InputDecoration(
                      hintText: hint,
                      border: InputBorder.none,
                      isCollapsed: true,
                      filled: false,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: AppSpacing.sm),
          trailing!,
        ],
      ],
    );
  }
}
