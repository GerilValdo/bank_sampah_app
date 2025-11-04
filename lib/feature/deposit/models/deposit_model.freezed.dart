// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DepositModel {

 int? get id; int get categoryId; double get weight; int get totalPoints; String get status; String? get imageUrl; String? get notes; DateTime get createdAt; String? get reason; String? get nameCategory; int? get pointsPerKgCategory; String? get iconNameCategory;
/// Create a copy of DepositModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepositModelCopyWith<DepositModel> get copyWith => _$DepositModelCopyWithImpl<DepositModel>(this as DepositModel, _$identity);

  /// Serializes this DepositModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepositModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.nameCategory, nameCategory) || other.nameCategory == nameCategory)&&(identical(other.pointsPerKgCategory, pointsPerKgCategory) || other.pointsPerKgCategory == pointsPerKgCategory)&&(identical(other.iconNameCategory, iconNameCategory) || other.iconNameCategory == iconNameCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,weight,totalPoints,status,imageUrl,notes,createdAt,reason,nameCategory,pointsPerKgCategory,iconNameCategory);

@override
String toString() {
  return 'DepositModel(id: $id, categoryId: $categoryId, weight: $weight, totalPoints: $totalPoints, status: $status, imageUrl: $imageUrl, notes: $notes, createdAt: $createdAt, reason: $reason, nameCategory: $nameCategory, pointsPerKgCategory: $pointsPerKgCategory, iconNameCategory: $iconNameCategory)';
}


}

/// @nodoc
abstract mixin class $DepositModelCopyWith<$Res>  {
  factory $DepositModelCopyWith(DepositModel value, $Res Function(DepositModel) _then) = _$DepositModelCopyWithImpl;
@useResult
$Res call({
 int? id, int categoryId, double weight, int totalPoints, String status, String? imageUrl, String? notes, DateTime createdAt, String? reason, String? nameCategory, int? pointsPerKgCategory, String? iconNameCategory
});




}
/// @nodoc
class _$DepositModelCopyWithImpl<$Res>
    implements $DepositModelCopyWith<$Res> {
  _$DepositModelCopyWithImpl(this._self, this._then);

  final DepositModel _self;
  final $Res Function(DepositModel) _then;

/// Create a copy of DepositModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? categoryId = null,Object? weight = null,Object? totalPoints = null,Object? status = null,Object? imageUrl = freezed,Object? notes = freezed,Object? createdAt = null,Object? reason = freezed,Object? nameCategory = freezed,Object? pointsPerKgCategory = freezed,Object? iconNameCategory = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,nameCategory: freezed == nameCategory ? _self.nameCategory : nameCategory // ignore: cast_nullable_to_non_nullable
as String?,pointsPerKgCategory: freezed == pointsPerKgCategory ? _self.pointsPerKgCategory : pointsPerKgCategory // ignore: cast_nullable_to_non_nullable
as int?,iconNameCategory: freezed == iconNameCategory ? _self.iconNameCategory : iconNameCategory // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DepositModel].
extension DepositModelPatterns on DepositModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepositModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepositModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepositModel value)  $default,){
final _that = this;
switch (_that) {
case _DepositModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepositModel value)?  $default,){
final _that = this;
switch (_that) {
case _DepositModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int categoryId,  double weight,  int totalPoints,  String status,  String? imageUrl,  String? notes,  DateTime createdAt,  String? reason,  String? nameCategory,  int? pointsPerKgCategory,  String? iconNameCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepositModel() when $default != null:
return $default(_that.id,_that.categoryId,_that.weight,_that.totalPoints,_that.status,_that.imageUrl,_that.notes,_that.createdAt,_that.reason,_that.nameCategory,_that.pointsPerKgCategory,_that.iconNameCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int categoryId,  double weight,  int totalPoints,  String status,  String? imageUrl,  String? notes,  DateTime createdAt,  String? reason,  String? nameCategory,  int? pointsPerKgCategory,  String? iconNameCategory)  $default,) {final _that = this;
switch (_that) {
case _DepositModel():
return $default(_that.id,_that.categoryId,_that.weight,_that.totalPoints,_that.status,_that.imageUrl,_that.notes,_that.createdAt,_that.reason,_that.nameCategory,_that.pointsPerKgCategory,_that.iconNameCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int categoryId,  double weight,  int totalPoints,  String status,  String? imageUrl,  String? notes,  DateTime createdAt,  String? reason,  String? nameCategory,  int? pointsPerKgCategory,  String? iconNameCategory)?  $default,) {final _that = this;
switch (_that) {
case _DepositModel() when $default != null:
return $default(_that.id,_that.categoryId,_that.weight,_that.totalPoints,_that.status,_that.imageUrl,_that.notes,_that.createdAt,_that.reason,_that.nameCategory,_that.pointsPerKgCategory,_that.iconNameCategory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepositModel implements DepositModel {
   _DepositModel({this.id, required this.categoryId, required this.weight, required this.totalPoints, required this.status, this.imageUrl, this.notes, required this.createdAt, this.reason, this.nameCategory, this.pointsPerKgCategory, this.iconNameCategory});
  factory _DepositModel.fromJson(Map<String, dynamic> json) => _$DepositModelFromJson(json);

@override final  int? id;
@override final  int categoryId;
@override final  double weight;
@override final  int totalPoints;
@override final  String status;
@override final  String? imageUrl;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  String? reason;
@override final  String? nameCategory;
@override final  int? pointsPerKgCategory;
@override final  String? iconNameCategory;

/// Create a copy of DepositModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepositModelCopyWith<_DepositModel> get copyWith => __$DepositModelCopyWithImpl<_DepositModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepositModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepositModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.nameCategory, nameCategory) || other.nameCategory == nameCategory)&&(identical(other.pointsPerKgCategory, pointsPerKgCategory) || other.pointsPerKgCategory == pointsPerKgCategory)&&(identical(other.iconNameCategory, iconNameCategory) || other.iconNameCategory == iconNameCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,weight,totalPoints,status,imageUrl,notes,createdAt,reason,nameCategory,pointsPerKgCategory,iconNameCategory);

@override
String toString() {
  return 'DepositModel(id: $id, categoryId: $categoryId, weight: $weight, totalPoints: $totalPoints, status: $status, imageUrl: $imageUrl, notes: $notes, createdAt: $createdAt, reason: $reason, nameCategory: $nameCategory, pointsPerKgCategory: $pointsPerKgCategory, iconNameCategory: $iconNameCategory)';
}


}

/// @nodoc
abstract mixin class _$DepositModelCopyWith<$Res> implements $DepositModelCopyWith<$Res> {
  factory _$DepositModelCopyWith(_DepositModel value, $Res Function(_DepositModel) _then) = __$DepositModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, int categoryId, double weight, int totalPoints, String status, String? imageUrl, String? notes, DateTime createdAt, String? reason, String? nameCategory, int? pointsPerKgCategory, String? iconNameCategory
});




}
/// @nodoc
class __$DepositModelCopyWithImpl<$Res>
    implements _$DepositModelCopyWith<$Res> {
  __$DepositModelCopyWithImpl(this._self, this._then);

  final _DepositModel _self;
  final $Res Function(_DepositModel) _then;

/// Create a copy of DepositModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? categoryId = null,Object? weight = null,Object? totalPoints = null,Object? status = null,Object? imageUrl = freezed,Object? notes = freezed,Object? createdAt = null,Object? reason = freezed,Object? nameCategory = freezed,Object? pointsPerKgCategory = freezed,Object? iconNameCategory = freezed,}) {
  return _then(_DepositModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,nameCategory: freezed == nameCategory ? _self.nameCategory : nameCategory // ignore: cast_nullable_to_non_nullable
as String?,pointsPerKgCategory: freezed == pointsPerKgCategory ? _self.pointsPerKgCategory : pointsPerKgCategory // ignore: cast_nullable_to_non_nullable
as int?,iconNameCategory: freezed == iconNameCategory ? _self.iconNameCategory : iconNameCategory // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
