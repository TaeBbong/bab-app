import 'package:injectable/injectable.dart';

import '../../core/utils/date_utils.dart';
import '../../core/utils/mappers.dart';
import '../../data/models/eating_model.dart';
import '../entities/eating.dart';
import '../repositories/eating_repository.dart';

@injectable
class MonthlyAllEatUsecase {
  final EatingRepository repository;

  MonthlyAllEatUsecase(this.repository);

  Future<Map<DateTime, List<Eating>>> execute({
    required DateTime focusedDay,
  }) async {
    final List<EatingModel> models = await repository.getAllEatingsInMonth(
      focusedDay,
    );

    final List<Eating> eatings =
        models.map((e) => EatingMapper.toEntity(e)).toList();

    final Map<DateTime, List<Eating>> grouped = {};

    final DateTime startDay = DateTime(focusedDay.year, focusedDay.month, 1);
    final DateTime endDay = DateTime(
      focusedDay.year,
      focusedDay.month + 1,
      1,
    ).subtract(Duration(days: 1));

    for (
      DateTime day = startDay;
      !day.isAfter(endDay);
      day = day.add(Duration(days: 1))
    ) {
      final DateTime date = MyDateUtils.onlyDates(day);
      grouped[date] = [];
    }

    for (final eating in eatings) {
      final DateTime date = MyDateUtils.onlyDates(eating.eatDate);

      if (!grouped.containsKey(date)) {
        grouped[date] = [];
      }
      grouped[date]!.add(eating);
    }

    return grouped;
  }
}
