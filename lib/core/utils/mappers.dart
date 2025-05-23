// Eat <-> EatModel
// UserInfo <-> UserInfoModel

import '../../data/models/eating_model.dart';
import '../../data/models/pickup_model.dart';
import '../../data/models/user_info_model.dart';
import '../../domain/entities/eating.dart';
import '../../domain/entities/pickup.dart';
import '../../domain/entities/user_info.dart';

class UserInfoMapper {
  static UserInfoModel toModel(UserInfo entity) {
    return UserInfoModel(username: entity.username, group: entity.group);
  }

  static UserInfo toEntity(UserInfoModel model) {
    return UserInfo(username: model.username, group: model.group);
  }
}

class EatingMapper {
  static EatingModel toModel(Eating entity) {
    return EatingModel(
      id: entity.id,
      applyDate: entity.applyDate,
      eatDate: entity.eatDate,
      username: entity.username,
      group: entity.group,
    );
  }

  static Eating toEntity(EatingModel model) {
    return Eating(
      id: model.id,
      applyDate: model.applyDate,
      eatDate: model.eatDate,
      username: model.username,
      group: model.group,
    );
  }
}

class PickupMapper {
  static PickupModel toModel(Pickup entity) {
    return PickupModel(
      id: entity.id,
      eatDate: entity.eatDate,
      users: entity.users,
    );
  }

  static Pickup toEntity(PickupModel model) {
    return Pickup(id: model.id, eatDate: model.eatDate, users: model.users);
  }
}
