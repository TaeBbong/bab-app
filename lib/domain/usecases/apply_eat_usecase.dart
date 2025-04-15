import 'package:injectable/injectable.dart';

import '../repositories/eating_repository.dart';

@injectable
class ApplyEatUsecase {
  final EatingRepository repository;

  ApplyEatUsecase(this.repository);

  Future<void> execute({required DateTime eatDate}) {
    return repository.applyEating(eatDate);
  }
}
