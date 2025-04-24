import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/themes/box_decoration_theme.dart';
import '../../core/utils/env.dart';
import '../../core/utils/money_utils.dart';
import '../controllers/my_controller.dart';

// TODO: 마이페이지는 필요한가? 다시 고민하기
// TODO: 정산하기 기능(카카오)
// TODO: 픽업할 사람 랜덤으로 뽑아서 푸시 알림 => 서버에서 푸시알림.. => 서버 기능이 필요한데..? => Firestore가지고 되나..?

class MyPage extends StatefulWidget {
  const MyPage({super.key});
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final MyController controller = Get.put(MyController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    final TextTheme textTheme = appTheme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('😊 마이페이지', style: textTheme.titleLarge),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Obx(() {
            return !controller.isLoading.value
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('입금 계좌', style: textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(Env.kakaoLink))) {
                              throw Exception('Could not launch');
                            }
                          },
                          child: Text(
                            '카카오톡으로 송금하기',
                            style: textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_left),
                          onPressed: () async {
                            controller.goToPreviousMonth();
                          },
                        ),
                        Text(
                          '${controller.selectedYear.value}년 ${controller.selectedMonth.value}월',
                          style: textTheme.titleMedium,
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_right),
                          onPressed: () async {
                            controller.goToNextMonth();
                          },
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration:
                          appTheme.extension<BoxDecorationTheme>()!.card,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('이번 달 식사 횟수', style: textTheme.bodySmall),
                              SizedBox(height: 4),
                              Text(
                                '${controller.monthlyUserAmount.value}회',
                                style: textTheme.titleMedium,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('이번 달 식대 총액', style: textTheme.bodySmall),
                              SizedBox(height: 4),
                              Text(
                                MoneyUtils.formatKrMoney(
                                  controller.monthlyUserAmount.value * 7500,
                                ),
                                style: textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('관리자 페이지로 이동'),
                      ),
                    ),
                  ],
                )
                : Center(child: const CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}
