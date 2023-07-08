import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_service.dart';
import 'routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    _notificationService.requestNotificationPermission();
    navigateToNextScreen();
    super.initState();
  }

  void navigateToNextScreen() {
    // Getting Route From Payload After Launching App From Killed State
    FlutterLocalNotificationsPlugin().getNotificationAppLaunchDetails().then(
      (value) {
        final String initialRoute = value?.notificationResponse?.payload ?? RouteNames.home;
        Timer(
          const Duration(seconds: 1),
          () {
            GenerateRoute.navigatorKey.currentState?.pushReplacementNamed(initialRoute);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
