import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// import '../../core/di/di.dart';
// import '../../core/services/notification_service.dart';
import '../../core/themes/box_decoration_theme.dart';
import '../../core/themes/palette.dart';
import '../../core/utils/date_utils.dart';
import '../../core/utils/env.dart';
import '../controllers/daily_controller.dart';
import '../widgets/password_dialog.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  final DailyController controller = Get.put(DailyController());
  // final NotificationService _notificationService = getIt<NotificationService>();

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    final TextTheme textTheme = appTheme.textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          MyDateUtils.dateToString(DateTime.now()),
          style: textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.dialog(PasswordDialog());
            },
            icon: Icon(Icons.person, color: Colors.transparent),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Obx(() {
            return !controller.isLoading.value
                ? Column(
                  children: [
                    Text(
                      '⏰ 신청/취소 마감은 당일 08:50입니다. ⏰',
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child:
                          controller.checkApplyOrCancel()
                              ? Text(
                                '😀 내 신청 상태 : 신청',
                                style: textTheme.titleLarge,
                              )
                              : Text(
                                '😀 내 신청 상태 : 미신청',
                                style: textTheme.titleLarge,
                              ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: Border.all(color: Colors.transparent),
                        collapsedShape: Border.all(color: Colors.transparent),
                        title: Text(
                          '🍱 오늘의 신청자 : ${controller.dailyEatings.length}명',
                          style: textTheme.titleLarge,
                        ),
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration:
                                appTheme.extension<BoxDecorationTheme>()!.card,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.getDailyAppliedUsers().join(', '),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: Border.all(color: Colors.transparent),
                        collapsedShape: Border.all(color: Colors.transparent),
                        title: Text(
                          '👻 오늘의 픽업 & 반납 담당자',
                          style: textTheme.titleLarge,
                        ),
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration:
                                appTheme.extension<BoxDecorationTheme>()!.card,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.pickupUsers.join(', '),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: Border.all(color: Colors.transparent),
                        collapsedShape: Border.all(color: Colors.transparent),
                        title: Text(
                          '💸 식대 송금하기(7,500원)',
                          style: textTheme.titleLarge,
                        ),
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration:
                                appTheme.extension<BoxDecorationTheme>()!.card,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Clipboard.setData(
                                        const ClipboardData(
                                          text: '하나 391-911051-77607 권태형 7500원',
                                        ),
                                      );
                                      Get.snackbar('완료', '계좌번호가 복사되었습니다.');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Palette.deepPurple,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    child: const Text('계좌 복사하기'),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (!await launchUrl(
                                        Uri.parse(Env.kakaoLink),
                                      )) {
                                        throw Exception('Could not launch');
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    child: const Text(
                                      '카카오페이로 송금하기',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     _notificationService.addTestNotifySchedule(id: 123);
                    //     _notificationService.checkScheduledNotifications();
                    //   },
                    //   child: Text('test'),
                    // ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed:
                            controller.checkApplyOrCancel()
                                ? controller.cancelEating
                                : controller.applyEating,
                        style:
                            controller.checkApplyOrCancel()
                                ? ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Palette.burgundy600,
                                  ),
                                )
                                : ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Palette.deepPurple,
                                  ),
                                ),
                        child:
                            controller.checkApplyOrCancel()
                                ? const Text('식사 취소하기')
                                : const Text('식사 신청하기'),
                      ),
                    ),
                  ],
                )
                : const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}
