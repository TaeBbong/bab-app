import 'package:injectable/injectable.dart';
import '../entities/eating.dart';
import '../repositories/eating_repository.dart';

@injectable
class WatchAllEatingUsecase {
  final EatingRepository repository;

  WatchAllEatingUsecase(this.repository);

  Stream<List<Eating>> execute() {
    return repository.watchAllEatings();
  }
}
