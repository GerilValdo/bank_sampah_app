import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_firebase_model.freezed.dart';
part 'deposit_firebase_model.g.dart';

@freezed
abstract class DepositFirebaseModel with _$DepositFirebaseModel {
  factory DepositFirebaseModel({
    String? id, 
    required String categoryId,
    required double weight,
    required int totalPoints,
    required String status, 
    String? imageUrl, 
    String? notes,
    @TimestampConverter() required DateTime createdAt,
    String? reason,
    String? nameCategory,
    int? pointsPerKgCategory,
    String? iconNameCategory,
    String? userId, 
  }) = _DepositFirebaseModel;

  factory DepositFirebaseModel.fromJson(Map<String, dynamic> json) =>
      _$DepositFirebaseModelFromJson(json);

  factory DepositFirebaseModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? <String, dynamic>{};
    // attach doc id
    return DepositFirebaseModel.fromJson({...data, 'id': doc.id});
  }
}

class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic json) {
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.parse(json);
    throw ArgumentError('Invalid timestamp: $json');
  }

  @override
  dynamic toJson(DateTime date) => Timestamp.fromDate(date);
}
