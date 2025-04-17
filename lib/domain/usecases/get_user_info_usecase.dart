import 'package:injectable/injectable.dart';

import '../entities/user_info.dart';
import '../repositories/user_info_repository.dart';

@injectable
class GetUserInfoUsecase {
  final UserInfoRepository repository;

  GetUserInfoUsecase(this.repository);

  Future<UserInfo> execute() {
    return repository.getUserInfo();
  }
}
