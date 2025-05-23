// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pickup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PickupModel _$PickupModelFromJson(Map<String, dynamic> json) {
  return _PickupModel.fromJson(json);
}

/// @nodoc
mixin _$PickupModel {
  String get id => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get eatDate => throw _privateConstructorUsedError;
  @StringListConverter()
  List<String> get users => throw _privateConstructorUsedError;

  /// Serializes this PickupModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PickupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PickupModelCopyWith<PickupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickupModelCopyWith<$Res> {
  factory $PickupModelCopyWith(
    PickupModel value,
    $Res Function(PickupModel) then,
  ) = _$PickupModelCopyWithImpl<$Res, PickupModel>;
  @useResult
  $Res call({
    String id,
    @TimestampConverter() DateTime eatDate,
    @StringListConverter() List<String> users,
  });
}

/// @nodoc
class _$PickupModelCopyWithImpl<$Res, $Val extends PickupModel>
    implements $PickupModelCopyWith<$Res> {
  _$PickupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PickupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? eatDate = null, Object? users = null}) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            eatDate:
                null == eatDate
                    ? _value.eatDate
                    : eatDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            users:
                null == users
                    ? _value.users
                    : users // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PickupModelImplCopyWith<$Res>
    implements $PickupModelCopyWith<$Res> {
  factory _$$PickupModelImplCopyWith(
    _$PickupModelImpl value,
    $Res Function(_$PickupModelImpl) then,
  ) = __$$PickupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @TimestampConverter() DateTime eatDate,
    @StringListConverter() List<String> users,
  });
}

/// @nodoc
class __$$PickupModelImplCopyWithImpl<$Res>
    extends _$PickupModelCopyWithImpl<$Res, _$PickupModelImpl>
    implements _$$PickupModelImplCopyWith<$Res> {
  __$$PickupModelImplCopyWithImpl(
    _$PickupModelImpl _value,
    $Res Function(_$PickupModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PickupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? eatDate = null, Object? users = null}) {
    return _then(
      _$PickupModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        eatDate:
            null == eatDate
                ? _value.eatDate
                : eatDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        users:
            null == users
                ? _value._users
                : users // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PickupModelImpl implements _PickupModel {
  const _$PickupModelImpl({
    this.id = '',
    @TimestampConverter() required this.eatDate,
    @StringListConverter() required final List<String> users,
  }) : _users = users;

  factory _$PickupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PickupModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @TimestampConverter()
  final DateTime eatDate;
  final List<String> _users;
  @override
  @StringListConverter()
  List<String> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'PickupModel(id: $id, eatDate: $eatDate, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickupModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eatDate, eatDate) || other.eatDate == eatDate) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    eatDate,
    const DeepCollectionEquality().hash(_users),
  );

  /// Create a copy of PickupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickupModelImplCopyWith<_$PickupModelImpl> get copyWith =>
      __$$PickupModelImplCopyWithImpl<_$PickupModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PickupModelImplToJson(this);
  }
}

abstract class _PickupModel implements PickupModel {
  const factory _PickupModel({
    final String id,
    @TimestampConverter() required final DateTime eatDate,
    @StringListConverter() required final List<String> users,
  }) = _$PickupModelImpl;

  factory _PickupModel.fromJson(Map<String, dynamic> json) =
      _$PickupModelImpl.fromJson;

  @override
  String get id;
  @override
  @TimestampConverter()
  DateTime get eatDate;
  @override
  @StringListConverter()
  List<String> get users;

  /// Create a copy of PickupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickupModelImplCopyWith<_$PickupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
