import 'package:injectable/injectable.dart';

import '../repositories/eating_repository.dart';

@injectable
class DailyUserEatUsecase {
  final EatingRepository repository;

  DailyUserEatUsecase(this.repository);

  Future<bool> execute({required DateTime date}) async {
    return repository.hasUserEatingOnDate(date);
  }
}
