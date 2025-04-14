import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_info_model.dart';

abstract class UserInfoLocalDataSource {
  Future<void> saveUserInfo(UserInfoModel userInfo);
  Future<UserInfoModel?> getUserInfo();
  Future<void> clearUserInfo();
}

const _keyUsername = 'user_info_username';
const _keyGroup = 'user_info_group';

@LazySingleton(as: UserInfoLocalDataSource)
class UserInfoLocalDataSourceImpl implements UserInfoLocalDataSource {
  final SharedPreferences _prefs;

  UserInfoLocalDataSourceImpl(this._prefs);

  @override
  Future<void> saveUserInfo(UserInfoModel userInfo) async {
    await _prefs.setString(_keyUsername, userInfo.username);
    await _prefs.setString(_keyGroup, userInfo.group);
  }

  @override
  Future<UserInfoModel?> getUserInfo() async {
    final username = _prefs.getString(_keyUsername);
    final group = _prefs.getString(_keyGroup);

    if (username == null || group == null) return null;

    return UserInfoModel(username: username, group: group);
  }

  @override
  Future<void> clearUserInfo() async {
    await _prefs.remove(_keyUsername);
    await _prefs.remove(_keyGroup);
  }
}
