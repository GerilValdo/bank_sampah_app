// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserFirebaseModel _$UserFirebaseModelFromJson(Map<String, dynamic> json) =>
    _UserFirebaseModel(
      uid: json['uid'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profileImage: json['profileImage'] as String?,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updateAt: const TimestampConverter().fromJson(json['updateAt']),
      totalPoints: (json['totalPoints'] as num?)?.toInt() ?? 0,
      role: json['role'] as String? ?? 'user',
    );

Map<String, dynamic> _$UserFirebaseModelToJson(_UserFirebaseModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'profileImage': instance.profileImage,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updateAt': const TimestampConverter().toJson(instance.updateAt),
      'totalPoints': instance.totalPoints,
      'role': instance.role,
    };
