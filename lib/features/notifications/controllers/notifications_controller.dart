import 'package:get/get.dart';
import '../../../data/mock/mock_notifications.dart';
import '../../../data/models/notification_model.dart';

class NotificationsController extends GetxController {
  final RxList<NotificationModel> notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    notifications.value = List.of(MockNotifications.all);
  }

  int get unreadCount => notifications.where((n) => !n.isRead).length;

  void markAsRead(String id) {
    final idx = notifications.indexWhere((n) => n.id == id);
    if (idx >= 0 && !notifications[idx].isRead) {
      notifications[idx] = notifications[idx].copyWith(isRead: true);
    }
  }

  void markAllAsRead() {
    notifications.value =
        notifications.map((n) => n.copyWith(isRead: true)).toList();
  }
}
