import 'package:freezed_annotation/freezed_annotation.dart';

part 'pickup.freezed.dart';

@freezed
class Pickup with _$Pickup {
  const factory Pickup({
    @Default('') String id,
    required DateTime eatDate,
    required List<String> users,
  }) = _Pickup;
}
