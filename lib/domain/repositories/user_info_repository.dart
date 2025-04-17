import '../entities/user_info.dart';

abstract class UserInfoRepository {
  Future<void> registerUser({required UserInfo userInfo});
  Future<UserInfo> getUserInfo();
}
