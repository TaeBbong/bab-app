import 'package:injectable/injectable.dart';

import '../../core/utils/mappers.dart';
import '../../domain/entities/user_info.dart';
import '../../domain/repositories/user_info_repository.dart';
import '../models/user_info_model.dart';
import '../sources/user_info_local_data_source.dart';

@LazySingleton(as: UserInfoRepository)
class UserInfoRepositoryImpl implements UserInfoRepository {
  final UserInfoLocalDataSource userInfoLocalDataSource;

  UserInfoRepositoryImpl(this.userInfoLocalDataSource);

  @override
  Future<void> registerUser({required UserInfo userInfo}) async {
    try {
      final UserInfoModel userInfoModel = UserInfoMapper.toModel(userInfo);
      userInfoLocalDataSource.saveUserInfo(userInfoModel);
    } catch (e) {
      throw Exception('[-] Error while fetching from server');
    }
  }
}
