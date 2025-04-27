import '../entities/eating.dart';

abstract class EatingRepository {
  Future<Eating> applyEating(DateTime eatDate);
  Future<void> cancelEating(String id);
  Stream<List<Eating>> watchTodayEatings();
  Stream<List<Eating>> watchAllEatings();
}
