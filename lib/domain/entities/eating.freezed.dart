// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Eating {
  String get id => throw _privateConstructorUsedError;
  DateTime get applyDate => throw _privateConstructorUsedError;
  DateTime get eatDate => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get group => throw _privateConstructorUsedError;

  /// Create a copy of Eating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EatingCopyWith<Eating> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EatingCopyWith<$Res> {
  factory $EatingCopyWith(Eating value, $Res Function(Eating) then) =
      _$EatingCopyWithImpl<$Res, Eating>;
  @useResult
  $Res call({
    String id,
    DateTime applyDate,
    DateTime eatDate,
    String username,
    String group,
  });
}

/// @nodoc
class _$EatingCopyWithImpl<$Res, $Val extends Eating>
    implements $EatingCopyWith<$Res> {
  _$EatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Eating
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
abstract class _$$EatingImplCopyWith<$Res> implements $EatingCopyWith<$Res> {
  factory _$$EatingImplCopyWith(
    _$EatingImpl value,
    $Res Function(_$EatingImpl) then,
  ) = __$$EatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime applyDate,
    DateTime eatDate,
    String username,
    String group,
  });
}

/// @nodoc
class __$$EatingImplCopyWithImpl<$Res>
    extends _$EatingCopyWithImpl<$Res, _$EatingImpl>
    implements _$$EatingImplCopyWith<$Res> {
  __$$EatingImplCopyWithImpl(
    _$EatingImpl _value,
    $Res Function(_$EatingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Eating
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
      _$EatingImpl(
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

class _$EatingImpl implements _Eating {
  const _$EatingImpl({
    this.id = '',
    required this.applyDate,
    required this.eatDate,
    required this.username,
    required this.group,
  });

  @override
  @JsonKey()
  final String id;
  @override
  final DateTime applyDate;
  @override
  final DateTime eatDate;
  @override
  final String username;
  @override
  final String group;

  @override
  String toString() {
    return 'Eating(id: $id, applyDate: $applyDate, eatDate: $eatDate, username: $username, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EatingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.applyDate, applyDate) ||
                other.applyDate == applyDate) &&
            (identical(other.eatDate, eatDate) || other.eatDate == eatDate) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, applyDate, eatDate, username, group);

  /// Create a copy of Eating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EatingImplCopyWith<_$EatingImpl> get copyWith =>
      __$$EatingImplCopyWithImpl<_$EatingImpl>(this, _$identity);
}

abstract class _Eating implements Eating {
  const factory _Eating({
    final String id,
    required final DateTime applyDate,
    required final DateTime eatDate,
    required final String username,
    required final String group,
  }) = _$EatingImpl;

  @override
  String get id;
  @override
  DateTime get applyDate;
  @override
  DateTime get eatDate;
  @override
  String get username;
  @override
  String get group;

  /// Create a copy of Eating
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EatingImplCopyWith<_$EatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
