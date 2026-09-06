import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/notification_item.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          TextButton(
            onPressed: controller.markAllAsRead,
            child: const Text('Mark all read'),
          ),
        ],
      ),
      body: Obx(() {
        final notifications = controller.notifications;
        if (notifications.isEmpty) {
          return const EmptyState(
            icon: Icons.notifications_none_rounded,
            title: 'No notifications',
            message: "You're all caught up. New updates will appear here.",
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(
              AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.xxl),
          itemCount: notifications.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return NotificationItemWidget(
              notification: notification,
              onTap: () => controller.markAsRead(notification.id),
            );
          },
        );
      }),
    );
  }
}
