// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WithdrawRequestModel {

 int? get id; int get userId; int get pointsRequested; double get amount; String get status; String? get paymentMethod; String? get phone; String? get notes; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of WithdrawRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WithdrawRequestModelCopyWith<WithdrawRequestModel> get copyWith => _$WithdrawRequestModelCopyWithImpl<WithdrawRequestModel>(this as WithdrawRequestModel, _$identity);

  /// Serializes this WithdrawRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WithdrawRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pointsRequested, pointsRequested) || other.pointsRequested == pointsRequested)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,pointsRequested,amount,status,paymentMethod,phone,notes,createdAt,updatedAt);

@override
String toString() {
  return 'WithdrawRequestModel(id: $id, userId: $userId, pointsRequested: $pointsRequested, amount: $amount, status: $status, paymentMethod: $paymentMethod, phone: $phone, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $WithdrawRequestModelCopyWith<$Res>  {
  factory $WithdrawRequestModelCopyWith(WithdrawRequestModel value, $Res Function(WithdrawRequestModel) _then) = _$WithdrawRequestModelCopyWithImpl;
@useResult
$Res call({
 int? id, int userId, int pointsRequested, double amount, String status, String? paymentMethod, String? phone, String? notes, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$WithdrawRequestModelCopyWithImpl<$Res>
    implements $WithdrawRequestModelCopyWith<$Res> {
  _$WithdrawRequestModelCopyWithImpl(this._self, this._then);

  final WithdrawRequestModel _self;
  final $Res Function(WithdrawRequestModel) _then;

/// Create a copy of WithdrawRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = null,Object? pointsRequested = null,Object? amount = null,Object? status = null,Object? paymentMethod = freezed,Object? phone = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,pointsRequested: null == pointsRequested ? _self.pointsRequested : pointsRequested // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [WithdrawRequestModel].
extension WithdrawRequestModelPatterns on WithdrawRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WithdrawRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WithdrawRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WithdrawRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _WithdrawRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WithdrawRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _WithdrawRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int userId,  int pointsRequested,  double amount,  String status,  String? paymentMethod,  String? phone,  String? notes,  DateTime createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WithdrawRequestModel() when $default != null:
return $default(_that.id,_that.userId,_that.pointsRequested,_that.amount,_that.status,_that.paymentMethod,_that.phone,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int userId,  int pointsRequested,  double amount,  String status,  String? paymentMethod,  String? phone,  String? notes,  DateTime createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _WithdrawRequestModel():
return $default(_that.id,_that.userId,_that.pointsRequested,_that.amount,_that.status,_that.paymentMethod,_that.phone,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int userId,  int pointsRequested,  double amount,  String status,  String? paymentMethod,  String? phone,  String? notes,  DateTime createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _WithdrawRequestModel() when $default != null:
return $default(_that.id,_that.userId,_that.pointsRequested,_that.amount,_that.status,_that.paymentMethod,_that.phone,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WithdrawRequestModel implements WithdrawRequestModel {
  const _WithdrawRequestModel({this.id, required this.userId, required this.pointsRequested, required this.amount, required this.status, this.paymentMethod, this.phone, this.notes, required this.createdAt, this.updatedAt});
  factory _WithdrawRequestModel.fromJson(Map<String, dynamic> json) => _$WithdrawRequestModelFromJson(json);

@override final  int? id;
@override final  int userId;
@override final  int pointsRequested;
@override final  double amount;
@override final  String status;
@override final  String? paymentMethod;
@override final  String? phone;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of WithdrawRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WithdrawRequestModelCopyWith<_WithdrawRequestModel> get copyWith => __$WithdrawRequestModelCopyWithImpl<_WithdrawRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WithdrawRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WithdrawRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pointsRequested, pointsRequested) || other.pointsRequested == pointsRequested)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,pointsRequested,amount,status,paymentMethod,phone,notes,createdAt,updatedAt);

@override
String toString() {
  return 'WithdrawRequestModel(id: $id, userId: $userId, pointsRequested: $pointsRequested, amount: $amount, status: $status, paymentMethod: $paymentMethod, phone: $phone, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$WithdrawRequestModelCopyWith<$Res> implements $WithdrawRequestModelCopyWith<$Res> {
  factory _$WithdrawRequestModelCopyWith(_WithdrawRequestModel value, $Res Function(_WithdrawRequestModel) _then) = __$WithdrawRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, int userId, int pointsRequested, double amount, String status, String? paymentMethod, String? phone, String? notes, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$WithdrawRequestModelCopyWithImpl<$Res>
    implements _$WithdrawRequestModelCopyWith<$Res> {
  __$WithdrawRequestModelCopyWithImpl(this._self, this._then);

  final _WithdrawRequestModel _self;
  final $Res Function(_WithdrawRequestModel) _then;

/// Create a copy of WithdrawRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = null,Object? pointsRequested = null,Object? amount = null,Object? status = null,Object? paymentMethod = freezed,Object? phone = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_WithdrawRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,pointsRequested: null == pointsRequested ? _self.pointsRequested : pointsRequested // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
