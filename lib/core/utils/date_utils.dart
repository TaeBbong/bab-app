class MyDateUtils {
  static String weekdayLabel(int weekday) {
    const labels = ['월', '화', '수', '목', '금', '토', '일'];
    return labels[(weekday % 7)]; // 1:월 ~ 7:일 → 0-indexed 보정
  }
}
