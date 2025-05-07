import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Abstract class for NotificationService
///
/// 1. NotificationService gets permission(ALARM) from user.
///
/// 2. NotificationService adds, cancels local notification schedule for registered Schedules.
abstract class NotificationService {
  FlutterLocalNotificationsPlugin getLocalNotificationPlugin();
  Future<void> getPermissions();
  Future<void> init();
  Future<void> initialZoneSchedules();
  Future<void> onDidReceiveNotificationResponse({required String link});
  Future<void> addNotifySchedule({
    required int id,
    required String appName,
    required String title,
    required tz.TZDateTime scheduleDate,
  });
  Future<void> checkScheduledNotifications();
  Future<void> addTestNotifySchedule({required int id});
}

@LazySingleton(as: NotificationService)
class NotificationServiceImpl implements NotificationService {
  static final FlutterLocalNotificationsPlugin _localNotifyPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  FlutterLocalNotificationsPlugin getLocalNotificationPlugin() {
    return _localNotifyPlugin;
  }

  /// Get permissions from user when opens app.
  ///
  /// Called by main.dart
  @override
  Future<void> getPermissions() async {
    if (await Permission.notification.isDenied &&
        !await Permission.notification.isPermanentlyDenied) {
      await [Permission.notification, Permission.scheduleExactAlarm].request();
    }
  }

  /// Initialize notification plugin settings.
  ///
  /// Called by main.dart
  @override
  Future<void> init() async {
    AndroidInitializationSettings android = const AndroidInitializationSettings(
      "@mipmap/ic_launcher",
    );
    DarwinInitializationSettings ios = const DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    InitializationSettings settings = InitializationSettings(
      android: android,
      iOS: ios,
    );
    await _localNotifyPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) async {
        if (details.payload != null) {
          onDidReceiveNotificationResponse(link: details.payload!);
        }
      },
    );
    tz.initializeTimeZones();
  }

  tz.TZDateTime _timeZoneSetting({
    required DateTime scheduleDate,
    required int hour,
    required int minute,
  }) {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));
    tz.TZDateTime target = tz.TZDateTime(
      tz.getLocation('Asia/Seoul'),
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      hour,
      minute,
    );
    return target;
  }

  /// `onDidReceiveNotificationResponse` handles onClickNotification from foreground/background state.
  ///
  /// Callback function for plugin.initialize(onDidReceiveNotificationResponse: () {}).
  ///
  /// Finds `targetSchedule` by key `link`, then routes to `detail` page.
  /// If `targetSchedule` was not found by key `link`, routes to `create` page.
  @override
  Future<void> onDidReceiveNotificationResponse({required String link}) async {
    Get.toNamed('/daily');
  }

  @override
  Future<void> initialZoneSchedules() async {
    final tz.TZDateTime onApplyEat = _timeZoneSetting(
      scheduleDate: DateTime.now(),
      hour: 8,
      minute: 10,
    );

    final tz.TZDateTime onDeadLine = _timeZoneSetting(
      scheduleDate: DateTime.now(),
      hour: 8,
      minute: 45,
    );

    final tz.TZDateTime onPickups = _timeZoneSetting(
      scheduleDate: DateTime.now(),
      hour: 11,
      minute: 00,
    );

    await addNotifySchedule(
      id: 0,
      appName: '밥',
      title: '식사 신청 시간입니다!',
      scheduleDate: onApplyEat,
    );
    await addNotifySchedule(
      id: 1,
      appName: '밥',
      title: '식사 신청 마감이 5분 남았습니다.',
      scheduleDate: onDeadLine,
    );
    await addNotifySchedule(
      id: 2,
      appName: '밥',
      title: '오늘의 픽업 담당자를 확인하세요.',
      scheduleDate: onPickups,
    );
  }

  /// Add notification schedule.
  ///
  /// Called by notifyScheduleAtPreviousDay()
  @override
  Future<void> addNotifySchedule({
    required int id,
    required String appName,
    required String title,
    required tz.TZDateTime scheduleDate,
  }) async {
    NotificationDetails details = const NotificationDetails(
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
      android: AndroidNotificationDetails(
        "1",
        "test",
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    await _localNotifyPlugin.zonedSchedule(
      id,
      "밥",
      title,
      scheduleDate,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: scheduleDate.toIso8601String(),
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  @override
  Future<void> checkScheduledNotifications() async {
    List<PendingNotificationRequest> pendingNotifications =
        await _localNotifyPlugin.pendingNotificationRequests();

    // ignore: avoid_print
    print("📢 Total Scheduled Notifications: ${pendingNotifications.length}");

    for (var notification in pendingNotifications) {
      // ignore: avoid_print
      print(
        "🔔 ID: ${notification.id}, Title: ${notification.title}, Body: ${notification.body}, Date: ${notification.payload}",
      );
    }
  }

  @override
  Future<void> addTestNotifySchedule({required int id}) async {
    NotificationDetails details = const NotificationDetails(
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
      android: AndroidNotificationDetails(
        "1",
        "test",
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));
    tz.TZDateTime target = tz.TZDateTime.now(
      tz.getLocation('Asia/Seoul'),
    ).add(const Duration(minutes: 1));
    await _localNotifyPlugin.zonedSchedule(
      id,
      "밥",
      "test notify $id",
      target,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: "https://naver.com",
    );
  }
}
