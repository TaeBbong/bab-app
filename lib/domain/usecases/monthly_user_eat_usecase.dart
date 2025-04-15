import 'package:injectable/injectable.dart';

import '../../core/utils/mappers.dart';
import '../../data/models/eating_model.dart';
import '../entities/eating.dart';
import '../repositories/eating_repository.dart';

@injectable
class MonthlyUserEatUsecase {
  final EatingRepository repository;

  MonthlyUserEatUsecase(this.repository);

  Future<List<Eating>> execute({required DateTime date}) async {
    final List<EatingModel> models = await repository.getUserEatingsInMonth(
      date,
    );
    return models.map((e) => EatingMapper.toEntity(e)).toList();
  }
}
