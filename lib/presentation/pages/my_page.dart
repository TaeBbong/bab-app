import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/themes/box_decoration_theme.dart';
import '../../core/utils/money_utils.dart';
import '../controllers/my_controller.dart';

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
                        Text(
                          '하나 000-00000-00000 권태형',
                          style: textTheme.bodyMedium,
                        ),
                        TextButton.icon(
                          onPressed: () {
                            Clipboard.setData(
                              const ClipboardData(
                                text: '하나 000-00000-00000 권태형',
                              ),
                            );
                            Get.snackbar('완료', '계좌번호가 복사되었습니다.');
                          },
                          icon: const Icon(Icons.copy, size: 18),
                          label: const Text('복사'),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
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
