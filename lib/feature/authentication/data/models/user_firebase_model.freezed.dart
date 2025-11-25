// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_firebase_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserFirebaseModel {

 String? get uid; String? get username; String? get email; String? get address; String? get phoneNumber; String? get profileImage;@TimestampConverter() DateTime? get createdAt;@TimestampConverter() DateTime? get updateAt; int get totalPoints; String get role;
/// Create a copy of UserFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFirebaseModelCopyWith<UserFirebaseModel> get copyWith => _$UserFirebaseModelCopyWithImpl<UserFirebaseModel>(this as UserFirebaseModel, _$identity);

  /// Serializes this UserFirebaseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFirebaseModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updateAt, updateAt) || other.updateAt == updateAt)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,username,email,address,phoneNumber,profileImage,createdAt,updateAt,totalPoints,role);

@override
String toString() {
  return 'UserFirebaseModel(uid: $uid, username: $username, email: $email, address: $address, phoneNumber: $phoneNumber, profileImage: $profileImage, createdAt: $createdAt, updateAt: $updateAt, totalPoints: $totalPoints, role: $role)';
}


}

/// @nodoc
abstract mixin class $UserFirebaseModelCopyWith<$Res>  {
  factory $UserFirebaseModelCopyWith(UserFirebaseModel value, $Res Function(UserFirebaseModel) _then) = _$UserFirebaseModelCopyWithImpl;
@useResult
$Res call({
 String? uid, String? username, String? email, String? address, String? phoneNumber, String? profileImage,@TimestampConverter() DateTime? createdAt,@TimestampConverter() DateTime? updateAt, int totalPoints, String role
});




}
/// @nodoc
class _$UserFirebaseModelCopyWithImpl<$Res>
    implements $UserFirebaseModelCopyWith<$Res> {
  _$UserFirebaseModelCopyWithImpl(this._self, this._then);

  final UserFirebaseModel _self;
  final $Res Function(UserFirebaseModel) _then;

/// Create a copy of UserFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = freezed,Object? username = freezed,Object? email = freezed,Object? address = freezed,Object? phoneNumber = freezed,Object? profileImage = freezed,Object? createdAt = freezed,Object? updateAt = freezed,Object? totalPoints = null,Object? role = null,}) {
  return _then(_self.copyWith(
uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updateAt: freezed == updateAt ? _self.updateAt : updateAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserFirebaseModel].
extension UserFirebaseModelPatterns on UserFirebaseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserFirebaseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserFirebaseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserFirebaseModel value)  $default,){
final _that = this;
switch (_that) {
case _UserFirebaseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserFirebaseModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserFirebaseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? uid,  String? username,  String? email,  String? address,  String? phoneNumber,  String? profileImage, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updateAt,  int totalPoints,  String role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserFirebaseModel() when $default != null:
return $default(_that.uid,_that.username,_that.email,_that.address,_that.phoneNumber,_that.profileImage,_that.createdAt,_that.updateAt,_that.totalPoints,_that.role);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? uid,  String? username,  String? email,  String? address,  String? phoneNumber,  String? profileImage, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updateAt,  int totalPoints,  String role)  $default,) {final _that = this;
switch (_that) {
case _UserFirebaseModel():
return $default(_that.uid,_that.username,_that.email,_that.address,_that.phoneNumber,_that.profileImage,_that.createdAt,_that.updateAt,_that.totalPoints,_that.role);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? uid,  String? username,  String? email,  String? address,  String? phoneNumber,  String? profileImage, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updateAt,  int totalPoints,  String role)?  $default,) {final _that = this;
switch (_that) {
case _UserFirebaseModel() when $default != null:
return $default(_that.uid,_that.username,_that.email,_that.address,_that.phoneNumber,_that.profileImage,_that.createdAt,_that.updateAt,_that.totalPoints,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserFirebaseModel implements UserFirebaseModel {
   _UserFirebaseModel({this.uid, this.username, this.email, this.address, this.phoneNumber, this.profileImage, @TimestampConverter() this.createdAt, @TimestampConverter() this.updateAt, this.totalPoints = 0, this.role = 'user'});
  factory _UserFirebaseModel.fromJson(Map<String, dynamic> json) => _$UserFirebaseModelFromJson(json);

@override final  String? uid;
@override final  String? username;
@override final  String? email;
@override final  String? address;
@override final  String? phoneNumber;
@override final  String? profileImage;
@override@TimestampConverter() final  DateTime? createdAt;
@override@TimestampConverter() final  DateTime? updateAt;
@override@JsonKey() final  int totalPoints;
@override@JsonKey() final  String role;

/// Create a copy of UserFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserFirebaseModelCopyWith<_UserFirebaseModel> get copyWith => __$UserFirebaseModelCopyWithImpl<_UserFirebaseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserFirebaseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserFirebaseModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updateAt, updateAt) || other.updateAt == updateAt)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,username,email,address,phoneNumber,profileImage,createdAt,updateAt,totalPoints,role);

@override
String toString() {
  return 'UserFirebaseModel(uid: $uid, username: $username, email: $email, address: $address, phoneNumber: $phoneNumber, profileImage: $profileImage, createdAt: $createdAt, updateAt: $updateAt, totalPoints: $totalPoints, role: $role)';
}


}

/// @nodoc
abstract mixin class _$UserFirebaseModelCopyWith<$Res> implements $UserFirebaseModelCopyWith<$Res> {
  factory _$UserFirebaseModelCopyWith(_UserFirebaseModel value, $Res Function(_UserFirebaseModel) _then) = __$UserFirebaseModelCopyWithImpl;
@override @useResult
$Res call({
 String? uid, String? username, String? email, String? address, String? phoneNumber, String? profileImage,@TimestampConverter() DateTime? createdAt,@TimestampConverter() DateTime? updateAt, int totalPoints, String role
});




}
/// @nodoc
class __$UserFirebaseModelCopyWithImpl<$Res>
    implements _$UserFirebaseModelCopyWith<$Res> {
  __$UserFirebaseModelCopyWithImpl(this._self, this._then);

  final _UserFirebaseModel _self;
  final $Res Function(_UserFirebaseModel) _then;

/// Create a copy of UserFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = freezed,Object? username = freezed,Object? email = freezed,Object? address = freezed,Object? phoneNumber = freezed,Object? profileImage = freezed,Object? createdAt = freezed,Object? updateAt = freezed,Object? totalPoints = null,Object? role = null,}) {
  return _then(_UserFirebaseModel(
uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updateAt: freezed == updateAt ? _self.updateAt : updateAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
