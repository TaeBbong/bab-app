import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/mappers.dart';
import '../../domain/entities/eating.dart';
import '../../domain/repositories/eating_repository.dart';
import '../../data/models/eating_model.dart';
import '../sources/eating_remote_data_source.dart';

@LazySingleton(as: EatingRepository)
class EatingRepositoryImpl implements EatingRepository {
  final EatingRemoteDataSource _remote;
  final SharedPreferences _prefs;

  EatingRepositoryImpl(this._remote, this._prefs);

  String get _username => _prefs.getString('username') ?? '';
  String get _group => _prefs.getString('group') ?? '';

  @override
  Future<void> applyEating(DateTime eatDate) async {
    final now = DateTime.now();
    final eating = Eating(
      id: '',
      applyDate: now,
      eatDate: DateTime(eatDate.year, eatDate.month, eatDate.day),
      username: _username,
      group: _group,
    );
    await _remote.addEating(EatingMapper.toModel(eating));
  }

  @override
  Future<void> cancelEating(String id) async {
    await _remote.deleteEating(id);
  }

  @override
  Future<bool> hasUserEatingOnDate(DateTime date) async {
    final all = await _remote.getAllEatings();
    final targetDate = _dateOnly(date);

    return all.any(
      (model) =>
          model.username == _username && _dateOnly(model.eatDate) == targetDate,
    );
  }

  @override
  Future<List<EatingModel>> getAllEatingsOnDate(DateTime date) async {
    final targetDate = _dateOnly(date);
    final all = await _remote.getAllEatings();
    return all
        .where((model) => _dateOnly(model.eatDate) == targetDate)
        .toList();
  }

  @override
  Future<List<EatingModel>> getUserEatingsInMonth(DateTime monthDate) async {
    final all = await _remote.getAllEatings();
    return all
        .where(
          (model) =>
              model.username == _username &&
              model.eatDate.year == monthDate.year &&
              model.eatDate.month == monthDate.month,
        )
        .toList();
  }

  @override
  Future<List<EatingModel>> getAllEatingsInMonth(DateTime monthDate) async {
    final all = await _remote.getAllEatings();
    return all
        .where(
          (model) =>
              model.eatDate.year == monthDate.year &&
              model.eatDate.month == monthDate.month,
        )
        .toList();
  }

  DateTime _dateOnly(DateTime dt) => DateTime(dt.year, dt.month, dt.day);
}
