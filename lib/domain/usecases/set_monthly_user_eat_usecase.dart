import 'package:injectable/injectable.dart';

import '../../core/utils/date_utils.dart';
import '../entities/eating.dart';
import '../repositories/eating_repository.dart';

@injectable
class SetMonthlyUserEatUsecase {
  final EatingRepository repository;

  SetMonthlyUserEatUsecase(this.repository);

  Map<DateTime, bool> execute({
    required Map<DateTime, List<Eating>> allEatings,
    required String username,
    required DateTime targetMonth,
  }) {
    final DateTime startDay = DateTime(targetMonth.year, targetMonth.month, 1);
    final DateTime endDay = DateTime(
      targetMonth.year,
      targetMonth.month + 1,
      1,
    ).subtract(Duration(days: 1));

    final Map<DateTime, bool> grouped = {};

    for (
      DateTime day = startDay;
      !day.isAfter(endDay);
      day = day.add(Duration(days: 1))
    ) {
      final DateTime date = MyDateUtils.onlyDates(day);
      final List<Eating> eatings = allEatings[date] ?? [];
      if (eatings.isEmpty) {
        grouped[date] = false;
      } else if (eatings.any((eating) => eating.username == username)) {
        grouped[date] = true;
      } else {
        grouped[date] = false;
      }
    }
    return grouped;
  }
}
