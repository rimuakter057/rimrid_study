import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/models/chat_message_model.dart';

/// A single chat bubble used on the AI Study Assistant screen.
class AiMessageBubble extends StatelessWidget {
  final ChatMessageModel message;

  const AiMessageBubble({super.key, required this.message});

  bool get _isUser => message.sender == ChatSender.user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        mainAxisAlignment:
            _isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!_isUser) ...[
            Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.auto_awesome_rounded,
                  size: 15, color: Colors.white),
            ),
            const SizedBox(width: AppSpacing.xs),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
              decoration: BoxDecoration(
                color: _isUser ? AppColors.primary : AppColors.surface,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(AppRadius.lg),
                  topRight: const Radius.circular(AppRadius.lg),
                  bottomLeft: Radius.circular(_isUser ? AppRadius.lg : 4),
                  bottomRight: Radius.circular(_isUser ? 4 : AppRadius.lg),
                ),
                border: _isUser ? null : Border.all(color: AppColors.border),
              ),
              child: Text(
                message.text,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: _isUser ? Colors.white : AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
