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
