// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DepositFirebaseModel _$DepositFirebaseModelFromJson(
  Map<String, dynamic> json,
) => _DepositFirebaseModel(
  id: json['id'] as String?,
  categoryId: (json['categoryId'] as num).toInt(),
  weight: (json['weight'] as num).toDouble(),
  totalPoints: (json['totalPoints'] as num).toInt(),
  status: json['status'] as String,
  imageUrl: json['imageUrl'] as String?,
  notes: json['notes'] as String?,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  reason: json['reason'] as String?,
  nameCategory: json['nameCategory'] as String?,
  pointsPerKgCategory: (json['pointsPerKgCategory'] as num?)?.toInt(),
  iconNameCategory: json['iconNameCategory'] as String?,
  userId: json['userId'] as String?,
);

Map<String, dynamic> _$DepositFirebaseModelToJson(
  _DepositFirebaseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'categoryId': instance.categoryId,
  'weight': instance.weight,
  'totalPoints': instance.totalPoints,
  'status': instance.status,
  'imageUrl': instance.imageUrl,
  'notes': instance.notes,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'reason': instance.reason,
  'nameCategory': instance.nameCategory,
  'pointsPerKgCategory': instance.pointsPerKgCategory,
  'iconNameCategory': instance.iconNameCategory,
  'userId': instance.userId,
};
