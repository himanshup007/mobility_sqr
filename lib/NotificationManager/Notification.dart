import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationManager {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
  BehaviorSubject<ReceivedNotification>();
  String selectedNotificationPayload;
  final BehaviorSubject<String> selectNotificationSubject =
  BehaviorSubject<String>();

    MethodChannel platform =
  MethodChannel('dexterx.dev/flutter_local_notifications_example');
  NotificationManager._privateConstructor(){
initilazingNotifications();

  }


  static final NotificationManager _instance =
      NotificationManager._privateConstructor();

  static NotificationManager get instance => _instance;

initilazingNotifications() async {
  WidgetsFlutterBinding.ensureInitialized();
  _requestPermissions();
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('app_icon');

  /// Note: permissions aren't requested here just to demonstrate that can be
  /// done later
  final IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {
        didReceiveLocalNotificationSubject.add(ReceivedNotification(
            id: id, title: title, body: body, payload: payload));
      });
  const MacOSInitializationSettings initializationSettingsMacOS =
  MacOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false);
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
        if (payload != null) {
          debugPrint('notification payload: $payload');
        }
        selectedNotificationPayload = payload;
        selectNotificationSubject.add(payload);
      });






}
  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );        
  }


  cancelNotification() async {

    await flutterLocalNotificationsPlugin.cancel(0);
  }



  Future<void> showNotification(int progress,String picName) async {
    const int maxProgress = 100;
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
        final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('$platform', '$platform',
            'progress channel description',
            channelShowBadge: false,
            importance: Importance.max,
            priority: Priority.high,
            onlyAlertOnce: true,
            showProgress: true,
            maxProgress: maxProgress,
            progress: progress);
        final NotificationDetails platformChannelSpecifics =
        NotificationDetails(iOS: iOSPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
            0,
            '$picName',
            '',
            platformChannelSpecifics,
            payload: 'item x');


  }

}

class ReceivedNotification {
  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}