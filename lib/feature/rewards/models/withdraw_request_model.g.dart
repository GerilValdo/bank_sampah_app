// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WithdrawRequestModel _$WithdrawRequestModelFromJson(
  Map<String, dynamic> json,
) => _WithdrawRequestModel(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['userId'] as num).toInt(),
  pointsRequested: (json['pointsRequested'] as num).toInt(),
  amount: (json['amount'] as num).toDouble(),
  status: json['status'] as String,
  paymentMethod: json['paymentMethod'] as String?,
  phone: json['phone'] as String?,
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$WithdrawRequestModelToJson(
  _WithdrawRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'pointsRequested': instance.pointsRequested,
  'amount': instance.amount,
  'status': instance.status,
  'paymentMethod': instance.paymentMethod,
  'phone': instance.phone,
  'notes': instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
