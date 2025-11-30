import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_firebase_model.freezed.dart';
part 'user_firebase_model.g.dart';

@freezed
abstract class UserFirebaseModel with _$UserFirebaseModel {
  factory UserFirebaseModel({
    String? uid,
    String? username,
    String? email,
    String? address,
    String? phoneNumber,
    String? profileImage,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updateAt,
    @Default(0) int totalPoints,
    @Default('user') String role,
  }) = _UserFirebaseModel;

  factory UserFirebaseModel.fromJson(Map<String, dynamic> json) =>
      _$UserFirebaseModelFromJson(json);

  factory UserFirebaseModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? <String, dynamic>{};
    final merged = {...data, 'uid': doc.id};
    return UserFirebaseModel.fromJson(merged);
  }
}

class TimestampConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampConverter();

  @override
  DateTime? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.tryParse(json);
    return null;
  }

  @override
  dynamic toJson(DateTime? date) {
    if (date == null) return null;
    return Timestamp.fromDate(date);
  }
}
