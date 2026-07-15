import 'package:flutter/material.dart';
import '../models/notification_item.dart';

class NotificationProvider with ChangeNotifier {
  final List<NotificationItem> _notifications = [
    NotificationItem(
      id: '1',
      title: 'Welcome to GlowUp! 🎉',
      message: 'As a new customer — get 10% off your first order. Promo code: WELCOME10',
      createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      type: NotificationType.discount,
    ),
    NotificationItem(
      id: '2',
      title: 'Seasonal Sale',
      message: 'Beauty season has started! Up to -30% off selected skincare products.',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      type: NotificationType.seasonal,
    ),
    NotificationItem(
      id: '3',
      title: 'Your order is on its way 🚚',
      message: 'Order #1042 has been handed over to the delivery service. Expected tomorrow.',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      type: NotificationType.order,
    ),
    NotificationItem(
      id: '4',
      title: 'New Perfume Collection',
      message: 'A new collection of elite perfumes has just arrived. Be the first to explore!',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      type: NotificationType.newProduct,
    ),
    NotificationItem(
      id: '5',
      title: 'Personal Discount Just for You 💝',
      message: 'Exclusively for you — 15% off all Makeup products until end of the week.',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      type: NotificationType.discount,
    ),
  ];

  List<NotificationItem> get notifications => _notifications;

  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  void markAsRead(String id) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notifications[index].isRead = true;
      notifyListeners();
    }
  }

  void markAllAsRead() {
    for (final n in _notifications) {
      n.isRead = true;
    }
    notifyListeners();
  }
}