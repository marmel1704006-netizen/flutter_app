enum NotificationType { discount, order, seasonal, newProduct }

class NotificationItem {
  final String id;
  final String title;
  final String message;
  final DateTime createdAt;
  final NotificationType type;
  bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.createdAt,
    required this.type,
    this.isRead = false,
  });
}