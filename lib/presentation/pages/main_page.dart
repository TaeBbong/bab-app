import 'package:bab/core/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/themes/box_decoration_theme.dart';
import '../../core/themes/palette.dart';
import '../controllers/main_controller.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainController controller = Get.put(MainController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<MainController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    final TextTheme textTheme = appTheme.textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('🗓 신청 현황', style: textTheme.titleLarge),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Obx(() {
            return !controller.isLoading.value
                ? Column(
                  children: [
                    Text('⏰ 신청/취소 마감은 당일 08:30입니다. ⏰'),
                    Text('⏰ 당일 08:30까지 입금하지 않으면 자동 취소됩니다. ⏰'),
                    TableCalendar(
                      locale: 'ko_KR',
                      firstDay: DateTime(2000, 1, 1),
                      lastDay: DateTime(2100, 12, 31),
                      focusedDay: controller.focusedDay.value,
                      selectedDayPredicate:
                          (day) => isSameDay(controller.selectedDay.value, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        controller.onDaySelected(selectedDay, focusedDay);
                      },
                      onPageChanged: (focusedDay) {
                        controller.onPageChanged(focusedDay);
                        controller.setMonthlyAllEatings();
                        controller.setMonthlyUserEatings();
                      },
                      calendarFormat: CalendarFormat.month,
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                      },
                      daysOfWeekHeight: 40,
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,
                        todayDecoration: BoxDecoration(
                          color: Palette.beige100,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Palette.beige,
                          shape: BoxShape.circle,
                        ),
                        defaultTextStyle: const TextStyle(fontSize: 16),
                        selectedTextStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        todayTextStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),

                      calendarBuilders: CalendarBuilders(
                        dowBuilder: (context, day) {
                          final text = MyDateUtils.weekdayLabel(day.weekday);
                          Color? color;
                          if (day.weekday + 1 == DateTime.sunday) {
                            color = Colors.red;
                          } else if (day.weekday + 1 == DateTime.saturday) {
                            color = Colors.blue;
                          }
                          return Center(
                            child: Text(
                              text,
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                        defaultBuilder: (context, date, events) {
                          final bool hasAppliedOnDate =
                              controller
                                  .monthlyUserEatingMap[MyDateUtils.onlyDates(
                                date,
                              )]!;
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${date.day}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                                if (hasAppliedOnDate)
                                  const Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      '🍱',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      // margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration:
                          appTheme.extension<BoxDecorationTheme>()!.card,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('오늘의 신청자', style: textTheme.titleMedium),
                          const SizedBox(height: 4),
                          Text(
                            controller.getDailyAppliedUsers().join(', '),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodySmall,
                          ),
                          const SizedBox(height: 16),
                          Text('오늘 내 신청 상태', style: textTheme.titleMedium),
                          SizedBox(height: 4),
                          controller.monthlyUserEatingMap[MyDateUtils.onlyDates(
                                controller.focusedDay.value,
                              )]!
                              ? Text('신청', style: textTheme.labelMedium)
                              : Text('미신청', style: textTheme.labelMedium),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed:
                            controller
                                    .monthlyUserEatingMap[MyDateUtils.onlyDates(
                                  controller.focusedDay.value,
                                )]!
                                ? controller.cancelEating
                                : controller.applyEating,
                        child:
                            controller
                                    .monthlyUserEatingMap[MyDateUtils.onlyDates(
                                  controller.focusedDay.value,
                                )]!
                                ? const Text('식사 신청하기')
                                : const Text('식사 취소하기'),
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
