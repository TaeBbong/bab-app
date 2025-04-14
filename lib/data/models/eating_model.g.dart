// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EatingModelImpl _$$EatingModelImplFromJson(Map<String, dynamic> json) =>
    _$EatingModelImpl(
      id: json['id'] as String? ?? '',
      applyDate: const TimestampConverter().fromJson(
        json['applyDate'] as Timestamp,
      ),
      eatDate: const TimestampConverter().fromJson(
        json['eatDate'] as Timestamp,
      ),
      username: json['username'] as String,
      group: json['group'] as String,
    );

Map<String, dynamic> _$$EatingModelImplToJson(_$EatingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applyDate': const TimestampConverter().toJson(instance.applyDate),
      'eatDate': const TimestampConverter().toJson(instance.eatDate),
      'username': instance.username,
      'group': instance.group,
    };
