// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryFirebaseModel _$CategoryFirebaseModelFromJson(
  Map<String, dynamic> json,
) => _CategoryFirebaseModel(
  id: json['id'] as String?,
  idCategory: (json['idCategory'] as num).toInt(),
  name: json['name'] as String,
  iconName: json['iconName'] as String,
  pointsPerKg: (json['pointsPerKg'] as num).toInt(),
);

Map<String, dynamic> _$CategoryFirebaseModelToJson(
  _CategoryFirebaseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'idCategory': instance.idCategory,
  'name': instance.name,
  'iconName': instance.iconName,
  'pointsPerKg': instance.pointsPerKg,
};
