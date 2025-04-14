// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EatingModel _$EatingModelFromJson(Map<String, dynamic> json) {
  return _EatingModel.fromJson(json);
}

/// @nodoc
mixin _$EatingModel {
  String get id => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get applyDate => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get eatDate => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get group => throw _privateConstructorUsedError;

  /// Serializes this EatingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EatingModelCopyWith<EatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EatingModelCopyWith<$Res> {
  factory $EatingModelCopyWith(
    EatingModel value,
    $Res Function(EatingModel) then,
  ) = _$EatingModelCopyWithImpl<$Res, EatingModel>;
  @useResult
  $Res call({
    String id,
    @TimestampConverter() DateTime applyDate,
    @TimestampConverter() DateTime eatDate,
    String username,
    String group,
  });
}

/// @nodoc
class _$EatingModelCopyWithImpl<$Res, $Val extends EatingModel>
    implements $EatingModelCopyWith<$Res> {
  _$EatingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? applyDate = null,
    Object? eatDate = null,
    Object? username = null,
    Object? group = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            applyDate:
                null == applyDate
                    ? _value.applyDate
                    : applyDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            eatDate:
                null == eatDate
                    ? _value.eatDate
                    : eatDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            username:
                null == username
                    ? _value.username
                    : username // ignore: cast_nullable_to_non_nullable
                        as String,
            group:
                null == group
                    ? _value.group
                    : group // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EatingModelImplCopyWith<$Res>
    implements $EatingModelCopyWith<$Res> {
  factory _$$EatingModelImplCopyWith(
    _$EatingModelImpl value,
    $Res Function(_$EatingModelImpl) then,
  ) = __$$EatingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @TimestampConverter() DateTime applyDate,
    @TimestampConverter() DateTime eatDate,
    String username,
    String group,
  });
}

/// @nodoc
class __$$EatingModelImplCopyWithImpl<$Res>
    extends _$EatingModelCopyWithImpl<$Res, _$EatingModelImpl>
    implements _$$EatingModelImplCopyWith<$Res> {
  __$$EatingModelImplCopyWithImpl(
    _$EatingModelImpl _value,
    $Res Function(_$EatingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? applyDate = null,
    Object? eatDate = null,
    Object? username = null,
    Object? group = null,
  }) {
    return _then(
      _$EatingModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        applyDate:
            null == applyDate
                ? _value.applyDate
                : applyDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        eatDate:
            null == eatDate
                ? _value.eatDate
                : eatDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        username:
            null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                    as String,
        group:
            null == group
                ? _value.group
                : group // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EatingModelImpl implements _EatingModel {
  const _$EatingModelImpl({
    this.id = '',
    @TimestampConverter() required this.applyDate,
    @TimestampConverter() required this.eatDate,
    required this.username,
    required this.group,
  });

  factory _$EatingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EatingModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @TimestampConverter()
  final DateTime applyDate;
  @override
  @TimestampConverter()
  final DateTime eatDate;
  @override
  final String username;
  @override
  final String group;

  @override
  String toString() {
    return 'EatingModel(id: $id, applyDate: $applyDate, eatDate: $eatDate, username: $username, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EatingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.applyDate, applyDate) ||
                other.applyDate == applyDate) &&
            (identical(other.eatDate, eatDate) || other.eatDate == eatDate) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.group, group) || other.group == group));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, applyDate, eatDate, username, group);

  /// Create a copy of EatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EatingModelImplCopyWith<_$EatingModelImpl> get copyWith =>
      __$$EatingModelImplCopyWithImpl<_$EatingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EatingModelImplToJson(this);
  }
}

abstract class _EatingModel implements EatingModel {
  const factory _EatingModel({
    final String id,
    @TimestampConverter() required final DateTime applyDate,
    @TimestampConverter() required final DateTime eatDate,
    required final String username,
    required final String group,
  }) = _$EatingModelImpl;

  factory _EatingModel.fromJson(Map<String, dynamic> json) =
      _$EatingModelImpl.fromJson;

  @override
  String get id;
  @override
  @TimestampConverter()
  DateTime get applyDate;
  @override
  @TimestampConverter()
  DateTime get eatDate;
  @override
  String get username;
  @override
  String get group;

  /// Create a copy of EatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EatingModelImplCopyWith<_$EatingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
