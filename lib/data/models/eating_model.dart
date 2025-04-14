import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'eating_model.freezed.dart';
part 'eating_model.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

@freezed
class EatingModel with _$EatingModel {
  const factory EatingModel({
    @Default('') String id,
    @TimestampConverter() required DateTime applyDate,
    @TimestampConverter() required DateTime eatDate,
    required String username,
    required String group,
  }) = _EatingModel;

  factory EatingModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return EatingModel.fromJson(data).copyWith(id: doc.id);
  }

  factory EatingModel.fromJson(Map<String, dynamic> json) =>
      _$EatingModelFromJson(json);
}
