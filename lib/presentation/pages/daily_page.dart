import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/themes/box_decoration_theme.dart';
import '../../core/themes/palette.dart';
import '../../core/utils/date_utils.dart';
import '../../core/utils/env.dart';
import '../controllers/daily_controller.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  final DailyController controller = Get.put(DailyController());

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
              Get.toNamed('/my');
            },
            icon: Icon(Icons.person),
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
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        '😀 내 신청 상태 : 신청!',
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
                          '🍱 오늘의 신청자 : 00명',
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
                                  // controller.getDailyAppliedUsers().join(', '),
                                  [
                                    '권태형',
                                    '이철수',
                                    '김철수',
                                    '권철수',
                                    '명철수',
                                    '권태형',
                                    '이철수',
                                    '김철수',
                                    '권철수',
                                    '명철수',
                                    '권태형',
                                    '이철수',
                                    '김철수',
                                    '권철수',
                                    '명철수',
                                  ].join(', '),
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
                                  // controller.getDailyAppliedUsers().join(', '),
                                  ['권태형', '이철수'].join(', '),
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
                                          text: '하나 000-00000-00000 권태형',
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
                                    child: const Text('카카오페이로 송금하기'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed:
                            controller.checkApplyOrCancel(
                                  controller.focusedDay.value,
                                )
                                ? controller.cancelEating
                                : controller.applyEating,
                        style:
                            controller.checkApplyOrCancel(
                                  controller.focusedDay.value,
                                )
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
                            controller.checkApplyOrCancel(
                                  controller.focusedDay.value,
                                )
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
