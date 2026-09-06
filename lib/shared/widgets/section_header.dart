import 'package:flutter/material.dart';
import '../../core/theme/app_text_styles.dart';

/// Title + optional "See all" action used above horizontal/vertical lists.
class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.sectionTitle),
        if (actionLabel != null)
          GestureDetector(
            onTap: onActionTap,
            child: Text(actionLabel!, style: AppTextStyles.buttonOutlined.copyWith(fontSize: 13)),
          ),
      ],
    );
  }
}
