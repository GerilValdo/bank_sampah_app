// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RedeemModel {

 String get id; String get rewardId; String get userId; DateTime get redeemedAt;
/// Create a copy of RedeemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RedeemModelCopyWith<RedeemModel> get copyWith => _$RedeemModelCopyWithImpl<RedeemModel>(this as RedeemModel, _$identity);

  /// Serializes this RedeemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RedeemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rewardId, rewardId) || other.rewardId == rewardId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.redeemedAt, redeemedAt) || other.redeemedAt == redeemedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rewardId,userId,redeemedAt);

@override
String toString() {
  return 'RedeemModel(id: $id, rewardId: $rewardId, userId: $userId, redeemedAt: $redeemedAt)';
}


}

/// @nodoc
abstract mixin class $RedeemModelCopyWith<$Res>  {
  factory $RedeemModelCopyWith(RedeemModel value, $Res Function(RedeemModel) _then) = _$RedeemModelCopyWithImpl;
@useResult
$Res call({
 String id, String rewardId, String userId, DateTime redeemedAt
});




}
/// @nodoc
class _$RedeemModelCopyWithImpl<$Res>
    implements $RedeemModelCopyWith<$Res> {
  _$RedeemModelCopyWithImpl(this._self, this._then);

  final RedeemModel _self;
  final $Res Function(RedeemModel) _then;

/// Create a copy of RedeemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rewardId = null,Object? userId = null,Object? redeemedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rewardId: null == rewardId ? _self.rewardId : rewardId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,redeemedAt: null == redeemedAt ? _self.redeemedAt : redeemedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RedeemModel].
extension RedeemModelPatterns on RedeemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RedeemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RedeemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RedeemModel value)  $default,){
final _that = this;
switch (_that) {
case _RedeemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RedeemModel value)?  $default,){
final _that = this;
switch (_that) {
case _RedeemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String rewardId,  String userId,  DateTime redeemedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RedeemModel() when $default != null:
return $default(_that.id,_that.rewardId,_that.userId,_that.redeemedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String rewardId,  String userId,  DateTime redeemedAt)  $default,) {final _that = this;
switch (_that) {
case _RedeemModel():
return $default(_that.id,_that.rewardId,_that.userId,_that.redeemedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String rewardId,  String userId,  DateTime redeemedAt)?  $default,) {final _that = this;
switch (_that) {
case _RedeemModel() when $default != null:
return $default(_that.id,_that.rewardId,_that.userId,_that.redeemedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RedeemModel implements RedeemModel {
  const _RedeemModel({required this.id, required this.rewardId, required this.userId, required this.redeemedAt});
  factory _RedeemModel.fromJson(Map<String, dynamic> json) => _$RedeemModelFromJson(json);

@override final  String id;
@override final  String rewardId;
@override final  String userId;
@override final  DateTime redeemedAt;

/// Create a copy of RedeemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RedeemModelCopyWith<_RedeemModel> get copyWith => __$RedeemModelCopyWithImpl<_RedeemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RedeemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RedeemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rewardId, rewardId) || other.rewardId == rewardId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.redeemedAt, redeemedAt) || other.redeemedAt == redeemedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rewardId,userId,redeemedAt);

@override
String toString() {
  return 'RedeemModel(id: $id, rewardId: $rewardId, userId: $userId, redeemedAt: $redeemedAt)';
}


}

/// @nodoc
abstract mixin class _$RedeemModelCopyWith<$Res> implements $RedeemModelCopyWith<$Res> {
  factory _$RedeemModelCopyWith(_RedeemModel value, $Res Function(_RedeemModel) _then) = __$RedeemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String rewardId, String userId, DateTime redeemedAt
});




}
/// @nodoc
class __$RedeemModelCopyWithImpl<$Res>
    implements _$RedeemModelCopyWith<$Res> {
  __$RedeemModelCopyWithImpl(this._self, this._then);

  final _RedeemModel _self;
  final $Res Function(_RedeemModel) _then;

/// Create a copy of RedeemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rewardId = null,Object? userId = null,Object? redeemedAt = null,}) {
  return _then(_RedeemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rewardId: null == rewardId ? _self.rewardId : rewardId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,redeemedAt: null == redeemedAt ? _self.redeemedAt : redeemedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
