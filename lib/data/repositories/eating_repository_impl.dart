import 'package:injectable/injectable.dart';

import '../../core/utils/mappers.dart';
import '../../domain/entities/eating.dart';
import '../../domain/repositories/eating_repository.dart';
import '../sources/eating_remote_data_source.dart';
import '../sources/user_info_local_data_source.dart';

@LazySingleton(as: EatingRepository)
class EatingRepositoryImpl implements EatingRepository {
  final EatingRemoteDataSource _remote;
  final UserInfoLocalDataSource _local;

  EatingRepositoryImpl(this._remote, this._local);

  @override
  Future<Eating> applyEating(DateTime eatDate) async {
    final DateTime now = DateTime.now();
    final String username = await _local.getUsername();
    final String group = await _local.getGroup();
    final Eating eating = Eating(
      applyDate: now,
      eatDate: DateTime(eatDate.year, eatDate.month, eatDate.day),
      username: username,
      group: group,
    );
    final String id = await _remote.addEating(EatingMapper.toModel(eating));
    final Eating finalEating = eating.copyWith(id: id);
    return finalEating;
  }

  @override
  Future<void> cancelEating(String id) async {
    await _remote.deleteEating(id);
  }

  @override
  Stream<List<Eating>> watchAllEatings() {
    return _remote.watchAllEatings().map(
      (models) => models.map((model) => EatingMapper.toEntity(model)).toList(),
    );
  }

  @override
  Stream<List<Eating>> watchTodayEatings() {
    return _remote.watchTodayEatings().map(
      (models) => models.map((model) => EatingMapper.toEntity(model)).toList(),
    );
  }
}
