// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DepositEntity {

 String get id; String get categoryId; double get weight; int get totalPoints; String get status; String? get imageUrl; String? get notes; DateTime get createdAt;
/// Create a copy of DepositEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepositEntityCopyWith<DepositEntity> get copyWith => _$DepositEntityCopyWithImpl<DepositEntity>(this as DepositEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepositEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,weight,totalPoints,status,imageUrl,notes,createdAt);

@override
String toString() {
  return 'DepositEntity(id: $id, categoryId: $categoryId, weight: $weight, totalPoints: $totalPoints, status: $status, imageUrl: $imageUrl, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DepositEntityCopyWith<$Res>  {
  factory $DepositEntityCopyWith(DepositEntity value, $Res Function(DepositEntity) _then) = _$DepositEntityCopyWithImpl;
@useResult
$Res call({
 String id, String categoryId, double weight, int totalPoints, String status, String? imageUrl, String? notes, DateTime createdAt
});




}
/// @nodoc
class _$DepositEntityCopyWithImpl<$Res>
    implements $DepositEntityCopyWith<$Res> {
  _$DepositEntityCopyWithImpl(this._self, this._then);

  final DepositEntity _self;
  final $Res Function(DepositEntity) _then;

/// Create a copy of DepositEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? weight = null,Object? totalPoints = null,Object? status = null,Object? imageUrl = freezed,Object? notes = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DepositEntity].
extension DepositEntityPatterns on DepositEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepositEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepositEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepositEntity value)  $default,){
final _that = this;
switch (_that) {
case _DepositEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepositEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DepositEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String categoryId,  double weight,  int totalPoints,  String status,  String? imageUrl,  String? notes,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepositEntity() when $default != null:
return $default(_that.id,_that.categoryId,_that.weight,_that.totalPoints,_that.status,_that.imageUrl,_that.notes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String categoryId,  double weight,  int totalPoints,  String status,  String? imageUrl,  String? notes,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _DepositEntity():
return $default(_that.id,_that.categoryId,_that.weight,_that.totalPoints,_that.status,_that.imageUrl,_that.notes,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String categoryId,  double weight,  int totalPoints,  String status,  String? imageUrl,  String? notes,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _DepositEntity() when $default != null:
return $default(_that.id,_that.categoryId,_that.weight,_that.totalPoints,_that.status,_that.imageUrl,_that.notes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _DepositEntity implements DepositEntity {
  const _DepositEntity({required this.id, required this.categoryId, required this.weight, required this.totalPoints, required this.status, this.imageUrl, this.notes, required this.createdAt});
  

@override final  String id;
@override final  String categoryId;
@override final  double weight;
@override final  int totalPoints;
@override final  String status;
@override final  String? imageUrl;
@override final  String? notes;
@override final  DateTime createdAt;

/// Create a copy of DepositEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepositEntityCopyWith<_DepositEntity> get copyWith => __$DepositEntityCopyWithImpl<_DepositEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepositEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,weight,totalPoints,status,imageUrl,notes,createdAt);

@override
String toString() {
  return 'DepositEntity(id: $id, categoryId: $categoryId, weight: $weight, totalPoints: $totalPoints, status: $status, imageUrl: $imageUrl, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DepositEntityCopyWith<$Res> implements $DepositEntityCopyWith<$Res> {
  factory _$DepositEntityCopyWith(_DepositEntity value, $Res Function(_DepositEntity) _then) = __$DepositEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String categoryId, double weight, int totalPoints, String status, String? imageUrl, String? notes, DateTime createdAt
});




}
/// @nodoc
class __$DepositEntityCopyWithImpl<$Res>
    implements _$DepositEntityCopyWith<$Res> {
  __$DepositEntityCopyWithImpl(this._self, this._then);

  final _DepositEntity _self;
  final $Res Function(_DepositEntity) _then;

/// Create a copy of DepositEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? weight = null,Object? totalPoints = null,Object? status = null,Object? imageUrl = freezed,Object? notes = freezed,Object? createdAt = null,}) {
  return _then(_DepositEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
