import 'package:injectable/injectable.dart';

import '../entities/user_info.dart';
import '../repositories/user_info_repository.dart';

@injectable
class RegisterUserUsecase {
  final UserInfoRepository repository;

  RegisterUserUsecase(this.repository);

  Future<void> execute({required String username, required String group}) {
    final UserInfo userInfo = UserInfo(username: username, group: group);
    return repository.registerUser(userInfo: userInfo);
  }
}
