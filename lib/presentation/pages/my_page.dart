import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/themes/box_decoration_theme.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;

  void _goToPreviousMonth() {
    setState(() {
      if (selectedMonth == 1) {
        selectedMonth = 12;
        selectedYear -= 1;
      } else {
        selectedMonth -= 1;
      }
    });
  }

  void _goToNextMonth() {
    setState(() {
      if (selectedMonth == 12) {
        selectedMonth = 1;
        selectedYear += 1;
      } else {
        selectedMonth += 1;
      }
    });
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('입금 계좌', style: textTheme.titleMedium),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('하나 000-00000-00000 권태형', style: textTheme.bodyMedium),
                  TextButton.icon(
                    onPressed: () {
                      Clipboard.setData(
                        const ClipboardData(text: '하나 000-00000-00000 권태형'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('계좌번호가 복사되었습니다.')),
                      );
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
                    onPressed: _goToPreviousMonth,
                  ),
                  Text(
                    '$selectedYear년 $selectedMonth월',
                    style: textTheme.titleMedium,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_right),
                    onPressed: _goToNextMonth,
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: appTheme.extension<BoxDecorationTheme>()!.card,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('이번 달 식사 횟수', style: textTheme.bodySmall),
                        SizedBox(height: 4),
                        Text('12회', style: textTheme.titleMedium),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('이번 달 식대 총액', style: textTheme.bodySmall),
                        SizedBox(height: 4),
                        Text('₩96,000', style: textTheme.titleMedium),
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
          ),
        ),
      ),
    );
  }
}
