import 'package:injectable/injectable.dart';
import '../entities/pickup.dart';

import '../repositories/pickup_repository.dart';

@injectable
class WatchPickupUsecase {
  final PickupRepository repository;

  WatchPickupUsecase(this.repository);

  Stream<Pickup> execute() {
    return repository.watchTodayPickup();
  }
}
