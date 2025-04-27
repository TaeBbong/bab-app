import '../../data/models/eating_model.dart';
import '../entities/eating.dart';

abstract class EatingRepository {
  Future<Eating> applyEating(DateTime eatDate);
  Future<void> cancelEating(String id);
  Future<bool> hasUserEatingOnDate(DateTime date);
  Future<List<EatingModel>> getAllEatings();
  Future<List<EatingModel>> getAllEatingsOnDate(DateTime date);
  Future<List<EatingModel>> getUserEatingsInMonth(DateTime monthDate);
  Future<List<EatingModel>> getAllEatingsInMonth(DateTime monthDate);
  Stream<List<Eating>> watchTodayEatings();
}
