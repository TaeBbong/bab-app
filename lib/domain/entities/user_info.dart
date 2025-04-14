import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({required String username, required String group}) =
      _UserInfo;
}
