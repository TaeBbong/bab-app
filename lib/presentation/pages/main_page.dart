import 'package:bab/core/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/themes/palette.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          '🗓 일정',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Palette.black,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TableCalendar(
              locale: 'ko_KR',
              firstDay: DateTime(2000, 1, 1),
              lastDay: DateTime(2100, 12, 31),
              focusedDay: DateTime.now(),
              // focusedDay: _controller.focusedDay.value,
              // selectedDayPredicate:
              //     (day) => isSameDay(_controller.selectedDay.value, day),
              // onDaySelected: (selectedDay, focusedDay) {
              //   _controller.onDaySelected(selectedDay, focusedDay);
              // },
              // onPageChanged: (focusedDay) {
              //   _controller.onPageChanged(focusedDay);
              //   _controller.getSchedulesForMonth(focusedDay);
              // },
              calendarFormat: CalendarFormat.month,
              availableCalendarFormats: const {CalendarFormat.month: 'Month'},
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
                  if (day.weekday == DateTime.sunday) {
                    color = Colors.red;
                  } else if (day.weekday == DateTime.saturday) {
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
                  final hasEvent = true;
                  // final hasEvent = events[DateUtils.dateOnly(day)]?.isNotEmpty ?? false;

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
                        if (hasEvent)
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Text('🍱', style: TextStyle(fontSize: 16)),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('오늘의 신청자', style: textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    '권태형 김철수 박지철 윤철수 김철수 정현철 김지철 양철철 민철철 강현철',
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text('오늘 내 신청 상태', style: textTheme.titleMedium),
                      SizedBox(width: 8),
                      Text('미신청', style: textTheme.labelMedium),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('식사 신청하기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
