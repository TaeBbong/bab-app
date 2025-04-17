class MyDateUtils {
  static String weekdayLabel(int weekday) {
    const labels = ['월', '화', '수', '목', '금', '토', '일'];
    return labels[(weekday % 7)]; // 1:월 ~ 7:일 → 0-indexed 보정
  }

  static DateTime onlyDates(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static String dateToString(DateTime date) {
    return '${date.year}년 ${date.month}월 ${date.day}일(${weekdayLabel(date.weekday - 1)})';
  }
}
