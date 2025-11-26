// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_firebase_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DepositFirebaseModel {

 String? get id;// Firestore document id
 String get categoryId; double get weight; int get totalPoints; String get status;// e.g. 'pending', 'completed', 'rejected'
 String? get imageUrl;// can be storage URL
 String? get notes;@TimestampConverter() DateTime get createdAt; String? get reason; String? get nameCategory; int? get pointsPerKgCategory; String? get iconNameCategory; String? get userId;
/// Create a copy of DepositFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepositFirebaseModelCopyWith<DepositFirebaseModel> get copyWith => _$DepositFirebaseModelCopyWithImpl<DepositFirebaseModel>(this as DepositFirebaseModel, _$identity);

  /// Serializes this DepositFirebaseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepositFirebaseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.nameCategory, nameCategory) || other.nameCategory == nameCategory)&&(identical(other.pointsPerKgCategory, pointsPerKgCategory) || other.pointsPerKgCategory == pointsPerKgCategory)&&(identical(other.iconNameCategory, iconNameCategory) || other.iconNameCategory == iconNameCategory)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,weight,totalPoints,status,imageUrl,notes,createdAt,reason,nameCategory,pointsPerKgCategory,iconNameCategory,userId);

@override
String toString() {
  return 'DepositFirebaseModel(id: $id, categoryId: $categoryId, weight: $weight, totalPoints: $totalPoints, status: $status, imageUrl: $imageUrl, notes: $notes, createdAt: $createdAt, reason: $reason, nameCategory: $nameCategory, pointsPerKgCategory: $pointsPerKgCategory, iconNameCategory: $iconNameCategory, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $DepositFirebaseModelCopyWith<$Res>  {
  factory $DepositFirebaseModelCopyWith(DepositFirebaseModel value, $Res Function(DepositFirebaseModel) _then) = _$DepositFirebaseModelCopyWithImpl;
@useResult
$Res call({
 String? id, String categoryId, double weight, int totalPoints, String status, String? imageUrl, String? notes,@TimestampConverter() DateTime createdAt, String? reason, String? nameCategory, int? pointsPerKgCategory, String? iconNameCategory, String? userId
});




}
/// @nodoc
class _$DepositFirebaseModelCopyWithImpl<$Res>
    implements $DepositFirebaseModelCopyWith<$Res> {
  _$DepositFirebaseModelCopyWithImpl(this._self, this._then);

  final DepositFirebaseModel _self;
  final $Res Function(DepositFirebaseModel) _then;

/// Create a copy of DepositFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? categoryId = null,Object? weight = null,Object? totalPoints = null,Object? status = null,Object? imageUrl = freezed,Object? notes = freezed,Object? createdAt = null,Object? reason = freezed,Object? nameCategory = freezed,Object? pointsPerKgCategory = freezed,Object? iconNameCategory = freezed,Object? userId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,nameCategory: freezed == nameCategory ? _self.nameCategory : nameCategory // ignore: cast_nullable_to_non_nullable
as String?,pointsPerKgCategory: freezed == pointsPerKgCategory ? _self.pointsPerKgCategory : pointsPerKgCategory // ignore: cast_nullable_to_non_nullable
as int?,iconNameCategory: freezed == iconNameCategory ? _self.iconNameCategory : iconNameCategory // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DepositFirebaseModel].
extension DepositFirebaseModelPatterns on DepositFirebaseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepositFirebaseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepositFirebaseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepositFirebaseModel value)  $default,){
final _that = this;
switch (_that) {
case _DepositFirebaseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepositFirebaseModel value)?  $default,){
final _that = this;
switch (_that) {
case _DepositFirebaseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String categoryId,  double weight,  int totalPoints,  String status,  String? imageUrl,  String? notes, @TimestampConverter()  DateTime createdAt,  String? reason,  String? nameCategory,  int? pointsPerKgCategory,  String? iconNameCategory,  String? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepositFirebaseModel() when $default != null:
return $default(_that.id,_that.categoryId,_that.weight,_that.totalPoints,_that.status,_that.imageUrl,_that.notes,_that.createdAt,_that.reason,_that.nameCategory,_that.pointsPerKgCategory,_that.iconNameCategory,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String categoryId,  double weight,  int totalPoints,  String status,  String? imageUrl,  String? notes, @TimestampConverter()  DateTime createdAt,  String? reason,  String? nameCategory,  int? pointsPerKgCategory,  String? iconNameCategory,  String? userId)  $default,) {final _that = this;
switch (_that) {
case _DepositFirebaseModel():
return $default(_that.id,_that.categoryId,_that.weight,_that.totalPoints,_that.status,_that.imageUrl,_that.notes,_that.createdAt,_that.reason,_that.nameCategory,_that.pointsPerKgCategory,_that.iconNameCategory,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String categoryId,  double weight,  int totalPoints,  String status,  String? imageUrl,  String? notes, @TimestampConverter()  DateTime createdAt,  String? reason,  String? nameCategory,  int? pointsPerKgCategory,  String? iconNameCategory,  String? userId)?  $default,) {final _that = this;
switch (_that) {
case _DepositFirebaseModel() when $default != null:
return $default(_that.id,_that.categoryId,_that.weight,_that.totalPoints,_that.status,_that.imageUrl,_that.notes,_that.createdAt,_that.reason,_that.nameCategory,_that.pointsPerKgCategory,_that.iconNameCategory,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepositFirebaseModel implements DepositFirebaseModel {
   _DepositFirebaseModel({this.id, required this.categoryId, required this.weight, required this.totalPoints, required this.status, this.imageUrl, this.notes, @TimestampConverter() required this.createdAt, this.reason, this.nameCategory, this.pointsPerKgCategory, this.iconNameCategory, this.userId});
  factory _DepositFirebaseModel.fromJson(Map<String, dynamic> json) => _$DepositFirebaseModelFromJson(json);

@override final  String? id;
// Firestore document id
@override final  String categoryId;
@override final  double weight;
@override final  int totalPoints;
@override final  String status;
// e.g. 'pending', 'completed', 'rejected'
@override final  String? imageUrl;
// can be storage URL
@override final  String? notes;
@override@TimestampConverter() final  DateTime createdAt;
@override final  String? reason;
@override final  String? nameCategory;
@override final  int? pointsPerKgCategory;
@override final  String? iconNameCategory;
@override final  String? userId;

/// Create a copy of DepositFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepositFirebaseModelCopyWith<_DepositFirebaseModel> get copyWith => __$DepositFirebaseModelCopyWithImpl<_DepositFirebaseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepositFirebaseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepositFirebaseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.nameCategory, nameCategory) || other.nameCategory == nameCategory)&&(identical(other.pointsPerKgCategory, pointsPerKgCategory) || other.pointsPerKgCategory == pointsPerKgCategory)&&(identical(other.iconNameCategory, iconNameCategory) || other.iconNameCategory == iconNameCategory)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,weight,totalPoints,status,imageUrl,notes,createdAt,reason,nameCategory,pointsPerKgCategory,iconNameCategory,userId);

@override
String toString() {
  return 'DepositFirebaseModel(id: $id, categoryId: $categoryId, weight: $weight, totalPoints: $totalPoints, status: $status, imageUrl: $imageUrl, notes: $notes, createdAt: $createdAt, reason: $reason, nameCategory: $nameCategory, pointsPerKgCategory: $pointsPerKgCategory, iconNameCategory: $iconNameCategory, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$DepositFirebaseModelCopyWith<$Res> implements $DepositFirebaseModelCopyWith<$Res> {
  factory _$DepositFirebaseModelCopyWith(_DepositFirebaseModel value, $Res Function(_DepositFirebaseModel) _then) = __$DepositFirebaseModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String categoryId, double weight, int totalPoints, String status, String? imageUrl, String? notes,@TimestampConverter() DateTime createdAt, String? reason, String? nameCategory, int? pointsPerKgCategory, String? iconNameCategory, String? userId
});




}
/// @nodoc
class __$DepositFirebaseModelCopyWithImpl<$Res>
    implements _$DepositFirebaseModelCopyWith<$Res> {
  __$DepositFirebaseModelCopyWithImpl(this._self, this._then);

  final _DepositFirebaseModel _self;
  final $Res Function(_DepositFirebaseModel) _then;

/// Create a copy of DepositFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? categoryId = null,Object? weight = null,Object? totalPoints = null,Object? status = null,Object? imageUrl = freezed,Object? notes = freezed,Object? createdAt = null,Object? reason = freezed,Object? nameCategory = freezed,Object? pointsPerKgCategory = freezed,Object? iconNameCategory = freezed,Object? userId = freezed,}) {
  return _then(_DepositFirebaseModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,nameCategory: freezed == nameCategory ? _self.nameCategory : nameCategory // ignore: cast_nullable_to_non_nullable
as String?,pointsPerKgCategory: freezed == pointsPerKgCategory ? _self.pointsPerKgCategory : pointsPerKgCategory // ignore: cast_nullable_to_non_nullable
as int?,iconNameCategory: freezed == iconNameCategory ? _self.iconNameCategory : iconNameCategory // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
