import 'package:injectable/injectable.dart';

import '../entities/pickup.dart';
import '../repositories/pickup_repository.dart';

@injectable
class AddPickupUsecase {
  final PickupRepository repository;

  AddPickupUsecase(this.repository);

  Future<Pickup> execute({
    required DateTime eatDate,
    required List<String> users,
  }) {
    return repository.addPickup(eatDate, users);
  }
}
