// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_request_firebase_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WithdrawRequestFirebaseModel {

 String? get id; String get userId; int get pointsRequested; double get amount; String get paymentMethod; String? get phone;@TimestampConverter() DateTime get createdAt; String get status; String? get reason;
/// Create a copy of WithdrawRequestFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WithdrawRequestFirebaseModelCopyWith<WithdrawRequestFirebaseModel> get copyWith => _$WithdrawRequestFirebaseModelCopyWithImpl<WithdrawRequestFirebaseModel>(this as WithdrawRequestFirebaseModel, _$identity);

  /// Serializes this WithdrawRequestFirebaseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WithdrawRequestFirebaseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pointsRequested, pointsRequested) || other.pointsRequested == pointsRequested)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,pointsRequested,amount,paymentMethod,phone,createdAt,status,reason);

@override
String toString() {
  return 'WithdrawRequestFirebaseModel(id: $id, userId: $userId, pointsRequested: $pointsRequested, amount: $amount, paymentMethod: $paymentMethod, phone: $phone, createdAt: $createdAt, status: $status, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $WithdrawRequestFirebaseModelCopyWith<$Res>  {
  factory $WithdrawRequestFirebaseModelCopyWith(WithdrawRequestFirebaseModel value, $Res Function(WithdrawRequestFirebaseModel) _then) = _$WithdrawRequestFirebaseModelCopyWithImpl;
@useResult
$Res call({
 String? id, String userId, int pointsRequested, double amount, String paymentMethod, String? phone,@TimestampConverter() DateTime createdAt, String status, String? reason
});




}
/// @nodoc
class _$WithdrawRequestFirebaseModelCopyWithImpl<$Res>
    implements $WithdrawRequestFirebaseModelCopyWith<$Res> {
  _$WithdrawRequestFirebaseModelCopyWithImpl(this._self, this._then);

  final WithdrawRequestFirebaseModel _self;
  final $Res Function(WithdrawRequestFirebaseModel) _then;

/// Create a copy of WithdrawRequestFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = null,Object? pointsRequested = null,Object? amount = null,Object? paymentMethod = null,Object? phone = freezed,Object? createdAt = null,Object? status = null,Object? reason = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,pointsRequested: null == pointsRequested ? _self.pointsRequested : pointsRequested // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WithdrawRequestFirebaseModel].
extension WithdrawRequestFirebaseModelPatterns on WithdrawRequestFirebaseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WithdrawRequestFirebaseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WithdrawRequestFirebaseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WithdrawRequestFirebaseModel value)  $default,){
final _that = this;
switch (_that) {
case _WithdrawRequestFirebaseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WithdrawRequestFirebaseModel value)?  $default,){
final _that = this;
switch (_that) {
case _WithdrawRequestFirebaseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String userId,  int pointsRequested,  double amount,  String paymentMethod,  String? phone, @TimestampConverter()  DateTime createdAt,  String status,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WithdrawRequestFirebaseModel() when $default != null:
return $default(_that.id,_that.userId,_that.pointsRequested,_that.amount,_that.paymentMethod,_that.phone,_that.createdAt,_that.status,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String userId,  int pointsRequested,  double amount,  String paymentMethod,  String? phone, @TimestampConverter()  DateTime createdAt,  String status,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _WithdrawRequestFirebaseModel():
return $default(_that.id,_that.userId,_that.pointsRequested,_that.amount,_that.paymentMethod,_that.phone,_that.createdAt,_that.status,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String userId,  int pointsRequested,  double amount,  String paymentMethod,  String? phone, @TimestampConverter()  DateTime createdAt,  String status,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _WithdrawRequestFirebaseModel() when $default != null:
return $default(_that.id,_that.userId,_that.pointsRequested,_that.amount,_that.paymentMethod,_that.phone,_that.createdAt,_that.status,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WithdrawRequestFirebaseModel implements WithdrawRequestFirebaseModel {
   _WithdrawRequestFirebaseModel({this.id, required this.userId, required this.pointsRequested, required this.amount, required this.paymentMethod, this.phone, @TimestampConverter() required this.createdAt, this.status = 'pending', this.reason});
  factory _WithdrawRequestFirebaseModel.fromJson(Map<String, dynamic> json) => _$WithdrawRequestFirebaseModelFromJson(json);

@override final  String? id;
@override final  String userId;
@override final  int pointsRequested;
@override final  double amount;
@override final  String paymentMethod;
@override final  String? phone;
@override@TimestampConverter() final  DateTime createdAt;
@override@JsonKey() final  String status;
@override final  String? reason;

/// Create a copy of WithdrawRequestFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WithdrawRequestFirebaseModelCopyWith<_WithdrawRequestFirebaseModel> get copyWith => __$WithdrawRequestFirebaseModelCopyWithImpl<_WithdrawRequestFirebaseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WithdrawRequestFirebaseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WithdrawRequestFirebaseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pointsRequested, pointsRequested) || other.pointsRequested == pointsRequested)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,pointsRequested,amount,paymentMethod,phone,createdAt,status,reason);

@override
String toString() {
  return 'WithdrawRequestFirebaseModel(id: $id, userId: $userId, pointsRequested: $pointsRequested, amount: $amount, paymentMethod: $paymentMethod, phone: $phone, createdAt: $createdAt, status: $status, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$WithdrawRequestFirebaseModelCopyWith<$Res> implements $WithdrawRequestFirebaseModelCopyWith<$Res> {
  factory _$WithdrawRequestFirebaseModelCopyWith(_WithdrawRequestFirebaseModel value, $Res Function(_WithdrawRequestFirebaseModel) _then) = __$WithdrawRequestFirebaseModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String userId, int pointsRequested, double amount, String paymentMethod, String? phone,@TimestampConverter() DateTime createdAt, String status, String? reason
});




}
/// @nodoc
class __$WithdrawRequestFirebaseModelCopyWithImpl<$Res>
    implements _$WithdrawRequestFirebaseModelCopyWith<$Res> {
  __$WithdrawRequestFirebaseModelCopyWithImpl(this._self, this._then);

  final _WithdrawRequestFirebaseModel _self;
  final $Res Function(_WithdrawRequestFirebaseModel) _then;

/// Create a copy of WithdrawRequestFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = null,Object? pointsRequested = null,Object? amount = null,Object? paymentMethod = null,Object? phone = freezed,Object? createdAt = null,Object? status = null,Object? reason = freezed,}) {
  return _then(_WithdrawRequestFirebaseModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,pointsRequested: null == pointsRequested ? _self.pointsRequested : pointsRequested // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
