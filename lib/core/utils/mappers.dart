// Eat <-> EatModel
// UserInfo <-> UserInfoModel

import '../../data/models/user_info_model.dart';
import '../../domain/entities/user_info.dart';

class UserInfoMapper {
  static UserInfoModel toModel(UserInfo entity) {
    return UserInfoModel(username: entity.username, group: entity.group);
  }

  static UserInfo toEntity(UserInfoModel model) {
    return UserInfo(username: model.username, group: model.group);
  }
}
