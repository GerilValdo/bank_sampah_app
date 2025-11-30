import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_request_firebase_model.freezed.dart';
part 'withdraw_request_firebase_model.g.dart';

@freezed
abstract class WithdrawRequestFirebaseModel
    with _$WithdrawRequestFirebaseModel {
  factory WithdrawRequestFirebaseModel({
    String? id, 
    required String userId,
    required int pointsRequested,
    required double amount, 
    required String paymentMethod, 
    String? phone, 
    @TimestampConverter() required DateTime createdAt,
    @Default('pending') String status, 
    String? reason, 
  }) = _WithdrawRequestFirebaseModel;

  factory WithdrawRequestFirebaseModel.fromJson(Map<String, dynamic> json) =>
      _$WithdrawRequestFirebaseModelFromJson(json);

  factory WithdrawRequestFirebaseModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? <String, dynamic>{};
    return WithdrawRequestFirebaseModel.fromJson({...data, 'id': doc.id});
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
