import 'package:injectable/injectable.dart';

import '../repositories/eating_repository.dart';

@injectable
class CancelEatUsecase {
  final EatingRepository repository;

  CancelEatUsecase(this.repository);

  Future<void> execute({required String docId}) {
    return repository.cancelEating(docId);
  }
}
