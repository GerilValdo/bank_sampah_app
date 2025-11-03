// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RewardModel _$RewardModelFromJson(Map<String, dynamic> json) => _RewardModel(
  id: json['id'] as String,
  title: json['title'] as String,
  pointsRequired: (json['pointsRequired'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$RewardModelToJson(_RewardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pointsRequired': instance.pointsRequired,
      'imageUrl': instance.imageUrl,
    };
