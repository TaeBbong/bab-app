import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/themes/box_decoration_theme.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/date_utils.dart';
import '../controllers/admin_controller.dart';

class TempUser {
  final String name;
  final bool isPaid;

  TempUser({required this.name, required this.isPaid});

  TempUser copyWith({String? name, bool? isPaid}) {
    return TempUser(name: name ?? this.name, isPaid: isPaid ?? this.isPaid);
  }
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final AdminController controller = Get.put(AdminController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('관리자 페이지', style: textTheme.titleLarge)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Obx(() {
            return !controller.isLoading.value
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: controller.goToPreviousDay,
                            icon: const Icon(Icons.arrow_left),
                          ),
                          Text(
                            MyDateUtils.dateToString(
                              controller.selectedDay.value,
                            ),
                            style: textTheme.titleMedium,
                          ),
                          IconButton(
                            onPressed: controller.goToNextDay,
                            icon: const Icon(Icons.arrow_right),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: theme.extension<BoxDecorationTheme>()!.card,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '총 신청자: ${controller.dailyApplicants.length}명',
                            style: textTheme.bodyMedium,
                          ),
                          Text(
                            '입금된 금액: ₩${controller.dailyApplicants.length * 7500}',
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.dailyApplicants.length,
                        itemBuilder: (context, index) {
                          final String applicant =
                              controller.dailyApplicants[index];
                          return CheckboxListTile(
                            title: Text(applicant),
                            value: true,
                            onChanged: (value) {},
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await controller.addPickup();
                          Get.snackbar('선발 완료', '픽업 담당자가 뽑혔습니다!');
                        },
                        icon: const Icon(Icons.copy),
                        label: const Text('픽업 담당자 뽑기'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(
                              text:
                                  "${Constants.applyMessagePrefix}${controller.dailyApplicants.length}${Constants.applyMessagePostfix}",
                            ),
                          );
                          Get.snackbar('복사 완료', '신청 메시지가 복사되었습니다!');
                        },
                        icon: const Icon(Icons.copy),
                        label: const Text('신청 메시지 생성'),
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
