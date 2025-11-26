// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_request_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WithdrawRequestFirebaseModel _$WithdrawRequestFirebaseModelFromJson(
  Map<String, dynamic> json,
) => _WithdrawRequestFirebaseModel(
  id: json['id'] as String?,
  userId: json['userId'] as String,
  pointsRequested: (json['pointsRequested'] as num).toInt(),
  amount: (json['amount'] as num).toDouble(),
  paymentMethod: json['paymentMethod'] as String,
  phone: json['phone'] as String?,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  status: json['status'] as String? ?? 'pending',
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$WithdrawRequestFirebaseModelToJson(
  _WithdrawRequestFirebaseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'pointsRequested': instance.pointsRequested,
  'amount': instance.amount,
  'paymentMethod': instance.paymentMethod,
  'phone': instance.phone,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'status': instance.status,
  'reason': instance.reason,
};
