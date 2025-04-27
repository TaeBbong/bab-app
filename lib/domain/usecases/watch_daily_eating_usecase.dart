import 'package:injectable/injectable.dart';
import '../entities/eating.dart';
import '../repositories/eating_repository.dart';

@injectable
class WatchDailyEatingUsecase {
  final EatingRepository repository;

  WatchDailyEatingUsecase(this.repository);

  Stream<List<Eating>> execute() {
    return repository.watchTodayEatings();
  }
}
