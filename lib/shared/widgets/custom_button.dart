import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

enum CustomButtonVariant { primary, outlined, text }

/// A single reusable button used across the app so press states, radii,
/// and loading behavior stay consistent everywhere.
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final CustomButtonVariant variant;
  final bool isLoading;
  final IconData? icon;
  final double? width;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = CustomButtonVariant.primary,
    this.isLoading = false,
    this.icon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final child = isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.4,
              valueColor: AlwaysStoppedAnimation<Color>(
                variant == CustomButtonVariant.primary
                    ? AppColors.textOnPrimary
                    : AppColors.primary,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18),
                const SizedBox(width: AppSpacing.xs),
              ],
              Text(label),
            ],
          );

    final effectiveOnPressed = isLoading ? null : onPressed;

    Widget button;
    switch (variant) {
      case CustomButtonVariant.primary:
        button = ElevatedButton(onPressed: effectiveOnPressed, child: child);
        break;
      case CustomButtonVariant.outlined:
        button = OutlinedButton(onPressed: effectiveOnPressed, child: child);
        break;
      case CustomButtonVariant.text:
        button = TextButton(
          onPressed: effectiveOnPressed,
          style: TextButton.styleFrom(minimumSize: const Size.fromHeight(44)),
          child: DefaultTextStyle(
            style: AppTextStyles.buttonOutlined,
            child: child,
          ),
        );
        break;
    }

    return SizedBox(width: width ?? double.infinity, child: button);
  }
}
