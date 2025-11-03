// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redeem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RedeemModel _$RedeemModelFromJson(Map<String, dynamic> json) => _RedeemModel(
  id: json['id'] as String,
  rewardId: json['rewardId'] as String,
  userId: json['userId'] as String,
  redeemedAt: DateTime.parse(json['redeemedAt'] as String),
);

Map<String, dynamic> _$RedeemModelToJson(_RedeemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rewardId': instance.rewardId,
      'userId': instance.userId,
      'redeemedAt': instance.redeemedAt.toIso8601String(),
    };
