import 'package:intl/intl.dart';

class MoneyUtils {
  static String formatKrMoney(int money) {
    final format = NumberFormat.currency(locale: 'ko_KR', symbol: '₩');
    return format.format(money);
  }
}
