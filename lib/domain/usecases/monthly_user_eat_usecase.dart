import 'package:injectable/injectable.dart';

import '../../core/utils/date_utils.dart';
import '../../core/utils/mappers.dart';
import '../../data/models/eating_model.dart';
import '../entities/eating.dart';
import '../repositories/eating_repository.dart';

@injectable
class MonthlyUserEatUsecase {
  final EatingRepository repository;

  MonthlyUserEatUsecase(this.repository);

  Future<Map<DateTime, bool>> execute({required DateTime focusedDay}) async {
    final List<EatingModel> models = await repository.getUserEatingsInMonth(
      focusedDay,
    );
    final List<Eating> eatings =
        models.map((e) => EatingMapper.toEntity(e)).toList();

    final DateTime startDay = DateTime(focusedDay.year, focusedDay.month, 1);
    final DateTime endDay = DateTime(
      focusedDay.year,
      focusedDay.month + 1,
      1,
    ).subtract(Duration(days: 1));

    final Map<DateTime, bool> grouped = {};

    for (
      DateTime day = startDay;
      !day.isAfter(endDay);
      day.add(Duration(days: 1))
    ) {
      final DateTime date = MyDateUtils.onlyDates(day);
      grouped[date] = false;
    }

    for (final eating in eatings) {
      final DateTime date = MyDateUtils.onlyDates(eating.eatDate);
      grouped[date] = true;
    }
    return grouped;
  }
}
