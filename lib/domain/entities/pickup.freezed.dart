// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pickup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Pickup {
  String get id => throw _privateConstructorUsedError;
  DateTime get eatDate => throw _privateConstructorUsedError;
  List<String> get users => throw _privateConstructorUsedError;

  /// Create a copy of Pickup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PickupCopyWith<Pickup> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickupCopyWith<$Res> {
  factory $PickupCopyWith(Pickup value, $Res Function(Pickup) then) =
      _$PickupCopyWithImpl<$Res, Pickup>;
  @useResult
  $Res call({String id, DateTime eatDate, List<String> users});
}

/// @nodoc
class _$PickupCopyWithImpl<$Res, $Val extends Pickup>
    implements $PickupCopyWith<$Res> {
  _$PickupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pickup
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
abstract class _$$PickupImplCopyWith<$Res> implements $PickupCopyWith<$Res> {
  factory _$$PickupImplCopyWith(
    _$PickupImpl value,
    $Res Function(_$PickupImpl) then,
  ) = __$$PickupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime eatDate, List<String> users});
}

/// @nodoc
class __$$PickupImplCopyWithImpl<$Res>
    extends _$PickupCopyWithImpl<$Res, _$PickupImpl>
    implements _$$PickupImplCopyWith<$Res> {
  __$$PickupImplCopyWithImpl(
    _$PickupImpl _value,
    $Res Function(_$PickupImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Pickup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? eatDate = null, Object? users = null}) {
    return _then(
      _$PickupImpl(
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

class _$PickupImpl implements _Pickup {
  const _$PickupImpl({
    this.id = '',
    required this.eatDate,
    required final List<String> users,
  }) : _users = users;

  @override
  @JsonKey()
  final String id;
  @override
  final DateTime eatDate;
  final List<String> _users;
  @override
  List<String> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'Pickup(id: $id, eatDate: $eatDate, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eatDate, eatDate) || other.eatDate == eatDate) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    eatDate,
    const DeepCollectionEquality().hash(_users),
  );

  /// Create a copy of Pickup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickupImplCopyWith<_$PickupImpl> get copyWith =>
      __$$PickupImplCopyWithImpl<_$PickupImpl>(this, _$identity);
}

abstract class _Pickup implements Pickup {
  const factory _Pickup({
    final String id,
    required final DateTime eatDate,
    required final List<String> users,
  }) = _$PickupImpl;

  @override
  String get id;
  @override
  DateTime get eatDate;
  @override
  List<String> get users;

  /// Create a copy of Pickup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickupImplCopyWith<_$PickupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
