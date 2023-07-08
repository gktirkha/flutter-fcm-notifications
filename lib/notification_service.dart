import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'routes.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Request Permission To Send Notification
  Future<void> requestNotification() async {
    NotificationSettings settings = await _messaging.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );
    print('Notification Auth Status ------> ${settings.authorizationStatus}');
    getToken();
  }

  // Print Token
  Future<String?> getToken() async {
    final String? token = await _messaging.getToken();
    print('FCM Token ------> $token');
    return token;
  }

  // Foreground Notification
  static void handleForeground() {
    FirebaseMessaging.onMessage.listen((event) {
      showNotification(event);
    });
  }

  // Initialize Local Notification
  static Future<void> initializeLocalNotification() async {
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosSettings = DarwinInitializationSettings();
    const InitializationSettings initializationSettings = InitializationSettings(android: androidInitializationSettings, iOS: iosSettings);
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: notificationHandler,
    );
  }

  // Show Notification
  static Future<void> showNotification(RemoteMessage message) async {
    print('Notification Content ------> ${message.data}');
    AndroidNotificationChannel androidNotificationChannel = const AndroidNotificationChannel(
      'firebase',
      'firebase',
      description: 'Description',
      importance: Importance.max,
    );
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      androidNotificationChannel.id,
      androidNotificationChannel.name,
      priority: Priority.max,
      importance: Importance.max,
    );

    DarwinNotificationDetails iosNotificationDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      message.data['title'],
      message.data['body'],
      notificationDetails,
      // Setting Route As Payload
      payload: message.data['route'],
    );
  }

  // On Tap Handler For Notification
  static void notificationHandler(NotificationResponse response) async {
    GenerateRoute.navigatorKey.currentState?.pushNamed(response.payload ?? '/');
  }
}
