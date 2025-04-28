import 'package:injectable/injectable.dart';

import '../../core/utils/mappers.dart';
import '../../domain/entities/pickup.dart';
import '../../domain/repositories/pickup_repository.dart';
import '../sources/pickup_remote_data_source.dart';

@LazySingleton(as: PickupRepository)
class PickupRepositoryImpl implements PickupRepository {
  final PickupRemoteDataSource _remote;

  PickupRepositoryImpl(this._remote);

  @override
  Future<Pickup> addPickup(DateTime eatDate, List<String> users) async {
    final Pickup pickup = Pickup(
      eatDate: DateTime(eatDate.year, eatDate.month, eatDate.day),
      users: users,
    );
    final String id = await _remote.addPickup(PickupMapper.toModel(pickup));
    final Pickup finalPickup = pickup.copyWith(id: id);
    return finalPickup;
  }

  @override
  Stream<Pickup> watchTodayPickup() {
    return _remote.watchPickup().map((model) => PickupMapper.toEntity(model));
  }
}
