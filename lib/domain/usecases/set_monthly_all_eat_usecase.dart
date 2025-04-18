import 'package:injectable/injectable.dart';

import '../../core/utils/date_utils.dart';
import '../entities/eating.dart';
import '../repositories/eating_repository.dart';

@injectable
class SetMonthlyAllEatUsecase {
  final EatingRepository repository;

  SetMonthlyAllEatUsecase(this.repository);

  Map<DateTime, List<Eating>> execute({
    required Map<DateTime, List<Eating>> allEatings,
    required DateTime targetMonth,
  }) {
    final Map<DateTime, List<Eating>> grouped = {};

    final DateTime startDay = DateTime(targetMonth.year, targetMonth.month, 1);
    final DateTime endDay = DateTime(
      targetMonth.year,
      targetMonth.month + 1,
      1,
    ).subtract(Duration(days: 1));

    for (
      DateTime day = startDay;
      !day.isAfter(endDay);
      day = day.add(const Duration(days: 1))
    ) {
      final dateKey = MyDateUtils.onlyDates(day);
      grouped[dateKey] = allEatings[dateKey] ?? [];
    }

    return grouped;
  }
}
