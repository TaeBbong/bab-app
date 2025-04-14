import 'package:freezed_annotation/freezed_annotation.dart';

part 'eating.freezed.dart';

@freezed
class Eating with _$Eating {
  const factory Eating({
    @Default('') String id,
    required DateTime applyDate,
    required DateTime eatDate,
    required String username,
    required String group,
  }) = _Eating;
}
