import '../entities/pickup.dart';

abstract class PickupRepository {
  Future<Pickup> addPickup(DateTime eatDate, List<String> users);
  Stream<Pickup> watchTodayPickup();
}
