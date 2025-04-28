// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PickupModelImpl _$$PickupModelImplFromJson(Map<String, dynamic> json) =>
    _$PickupModelImpl(
      id: json['id'] as String? ?? '',
      eatDate: const TimestampConverter().fromJson(
        json['eatDate'] as Timestamp,
      ),
      users: const StringListConverter().fromJson(json['users']),
    );

Map<String, dynamic> _$$PickupModelImplToJson(_$PickupModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eatDate': const TimestampConverter().toJson(instance.eatDate),
      'users': const StringListConverter().toJson(instance.users),
    };
