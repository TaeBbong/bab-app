import '../../data/models/eating_model.dart';

abstract class EatingRepository {
  Future<void> applyEating(DateTime eatDate);
  Future<void> cancelEating(String id);
  Future<bool> hasUserEatingOnDate(DateTime date);
  Future<List<EatingModel>> getAllEatingsOnDate(DateTime date);
  Future<List<EatingModel>> getUserEatingsInMonth(DateTime monthDate);
  Future<List<EatingModel>> getAllEatingsInMonth(DateTime monthDate);
}
