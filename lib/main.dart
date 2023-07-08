import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'notification_service.dart';
import 'routes.dart';
import 'splash.dart';

@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  NotificationService.showNotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  await NotificationService.initializeLocalNotification();
  NotificationService.handleForeground();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: GenerateRoute.scaffoldKey,
      home: const SplashScreen(),
      onGenerateRoute: GenerateRoute.generateRoute,
      navigatorKey: GenerateRoute.navigatorKey,
    );
  }
}
