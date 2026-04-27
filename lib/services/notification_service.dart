import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
      null, // icon null akan pakai icon default app
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Order Notifications',
          channelDescription: 'Notifikasi untuk pesanan baru JasTip',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          criticalAlerts: true,
        )
      ],
      debug: true,
    );

    // Minta izin ke user
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  // Fungsi untuk memicu munculnya notifikasi
  static Future<void> showOrderNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }

  // Listener Firestore: Otomatis bunyi setiap ada data baru di koleksi 'notifications'
  static void listenToNewOrders() {
    final currentUid = FirebaseAuth.instance.currentUser?.uid;

    FirebaseFirestore.instance
        .collection('notifications')
        .where('type', isEqualTo: 'new_order')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .snapshots()
        .listen((snap) {
      if (snap.docs.isEmpty) return;

      final doc = snap.docs.first;
      final data = doc.data();

      // Cek agar tidak memunculkan notifikasi untuk diri sendiri
      if (data['senderUid'] == currentUid) return;

      final Timestamp? createdAt = data['createdAt'] as Timestamp?;
      if (createdAt == null) return;

      // Cek apakah pesanannya masih baru (kurang dari 1 menit yang lalu)
      // Agar saat buka app, notifikasi lama tidak bunyi semua
      final diff = DateTime.now().difference(createdAt.toDate());
      if (diff.inMinutes < 1) {
        showOrderNotification(
          id: doc.id.hashCode, // Gunakan hash dari doc ID Firestore agar unik
          title: '🍱 Pesanan Baru Masuk!',
          body: data['message'] ?? 'Ada pesanan baru di JasTip!',
        );
      }
    });
  }
}