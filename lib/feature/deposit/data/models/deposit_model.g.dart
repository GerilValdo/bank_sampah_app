// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DepositModel _$DepositModelFromJson(Map<String, dynamic> json) =>
    _DepositModel(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      weight: (json['weight'] as num).toDouble(),
      totalPoints: (json['totalPoints'] as num).toInt(),
      status: json['status'] as String,
      imageUrl: json['imageUrl'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$DepositModelToJson(_DepositModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'weight': instance.weight,
      'totalPoints': instance.totalPoints,
      'status': instance.status,
      'imageUrl': instance.imageUrl,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
    };
