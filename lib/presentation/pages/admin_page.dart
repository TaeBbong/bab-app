import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/themes/box_decoration_theme.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/date_utils.dart';

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
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;
  int selectedDay = DateTime.now().day;
  String selectedWeekday = MyDateUtils.weekdayLabel(DateTime.now().weekday - 1);

  final List<TempUser> applicants = [
    TempUser(name: '김철수', isPaid: true),
    TempUser(name: '박영희', isPaid: false),
    TempUser(name: '이민수', isPaid: true),
    TempUser(name: '김철수', isPaid: true),
    TempUser(name: '박영희', isPaid: false),
    TempUser(name: '이민수', isPaid: true),
    TempUser(name: '김철수', isPaid: true),
    TempUser(name: '박영희', isPaid: false),
    TempUser(name: '이민수', isPaid: true),
    TempUser(name: '김철수', isPaid: true),
    TempUser(name: '박영희', isPaid: false),
    TempUser(name: '이민수', isPaid: true),
  ];

  void _changeDate({required int delta, required String type}) {
    final current = DateTime(selectedYear, selectedMonth, selectedDay);
    DateTime newDate;

    if (type == 'day') {
      newDate = current.add(Duration(days: delta));
    } else if (type == 'month') {
      newDate = DateTime(current.year, current.month + delta, current.day);
    } else {
      newDate = DateTime(current.year + delta, current.month, current.day);
    }

    setState(() {
      selectedYear = newDate.year;
      selectedMonth = newDate.month;
      selectedDay = newDate.day;
      selectedWeekday = MyDateUtils.weekdayLabel(newDate.weekday - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final totalApplicants = applicants.length;
    final totalAmount = applicants.where((a) => a.isPaid).length * 6000;

    return Scaffold(
      appBar: AppBar(title: Text('관리자 페이지', style: textTheme.titleLarge)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 날짜 선택
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => _changeDate(delta: -1, type: 'day'),
                      icon: const Icon(Icons.arrow_left),
                    ),
                    Text(
                      '$selectedYear년 $selectedMonth월 $selectedDay일($selectedWeekday)',
                      style: textTheme.titleMedium,
                    ),
                    IconButton(
                      onPressed: () => _changeDate(delta: 1, type: 'day'),
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // 신청자 현황
              Container(
                padding: const EdgeInsets.all(16),
                decoration: theme.extension<BoxDecorationTheme>()!.card,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '총 신청자: $totalApplicants명',
                      style: textTheme.bodyMedium,
                    ),
                    Text('입금된 금액: ₩$totalAmount', style: textTheme.bodyMedium),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // 신청자 리스트
              Expanded(
                child: ListView.builder(
                  itemCount: applicants.length,
                  itemBuilder: (context, index) {
                    final applicant = applicants[index];
                    return CheckboxListTile(
                      title: Text(applicant.name),
                      value: applicant.isPaid,
                      onChanged: (value) {
                        setState(() {
                          applicants[index] = applicant.copyWith(
                            isPaid: value ?? false,
                          );
                        });
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              // 복사 버튼
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(
                        text:
                            "${Constants.applyMessagePrefix}$totalApplicants${Constants.applyMessagePostfix}",
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('신청 메시지가 복사되었습니다!')),
                    );
                  },
                  icon: const Icon(Icons.copy),
                  label: const Text('신청 메시지 생성'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
