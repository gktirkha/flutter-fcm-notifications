# Flutter Notifications
A Simple Project Implementing Flutter Notifications
This Method Uses Following Method to [Send FCM Token](https://github.com/gktirkha/FCM-Notifications-Python)
<BR></BR>
In This Example I Am Getting Route Argument From The FCM Notification, Based On Which I Am Changing Screen In The Application
<BR></BR>
# Important Files
* <B>main.dart</B>
    * Initializes Firebase App
    * Initializes Firebase Messaging Background Notifications Handler
    * Initializes Firebase Messaging Foreground Notifications Handler
    * Initializes FlutterLocalNotificationsPlugin
<BR></BR>
* <B>splash.dart</B>
    * Handles Killed State Notifications
    * Initializes Firebase Messaging
    * Requests For Notifications Permission
<BR></BR>
* <B>notification_service.dart</B>
    * Provides Functions To Handel Notifications

<BR></BR>
# Notes
* Make Sure To Remove Print Statements From Production Code
