import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pickup_model.freezed.dart';
part 'pickup_model.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

class StringListConverter implements JsonConverter<List<String>, dynamic> {
  const StringListConverter();

  @override
  List<String> fromJson(dynamic json) {
    if (json is List) {
      return json.map((e) => e.toString()).toList();
    }
    return [];
  }

  @override
  dynamic toJson(List<String> list) => list;
}

@freezed
class PickupModel with _$PickupModel {
  const factory PickupModel({
    @Default('') String id,
    @TimestampConverter() required DateTime eatDate,
    @StringListConverter() required List<String> users,
  }) = _PickupModel;

  factory PickupModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PickupModel.fromJson(data).copyWith(id: doc.id);
  }

  factory PickupModel.fromJson(Map<String, dynamic> json) =>
      _$PickupModelFromJson(json);
}
