// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_firebase_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WithdrawFirebaseEvent {

 String get userId;
/// Create a copy of WithdrawFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WithdrawFirebaseEventCopyWith<WithdrawFirebaseEvent> get copyWith => _$WithdrawFirebaseEventCopyWithImpl<WithdrawFirebaseEvent>(this as WithdrawFirebaseEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WithdrawFirebaseEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'WithdrawFirebaseEvent(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $WithdrawFirebaseEventCopyWith<$Res>  {
  factory $WithdrawFirebaseEventCopyWith(WithdrawFirebaseEvent value, $Res Function(WithdrawFirebaseEvent) _then) = _$WithdrawFirebaseEventCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$WithdrawFirebaseEventCopyWithImpl<$Res>
    implements $WithdrawFirebaseEventCopyWith<$Res> {
  _$WithdrawFirebaseEventCopyWithImpl(this._self, this._then);

  final WithdrawFirebaseEvent _self;
  final $Res Function(WithdrawFirebaseEvent) _then;

/// Create a copy of WithdrawFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WithdrawFirebaseEvent].
extension WithdrawFirebaseEventPatterns on WithdrawFirebaseEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateRequest value)?  createRequest,TResult Function( _LoadRequests value)?  loadRequests,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateRequest() when createRequest != null:
return createRequest(_that);case _LoadRequests() when loadRequests != null:
return loadRequests(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateRequest value)  createRequest,required TResult Function( _LoadRequests value)  loadRequests,}){
final _that = this;
switch (_that) {
case _CreateRequest():
return createRequest(_that);case _LoadRequests():
return loadRequests(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateRequest value)?  createRequest,TResult? Function( _LoadRequests value)?  loadRequests,}){
final _that = this;
switch (_that) {
case _CreateRequest() when createRequest != null:
return createRequest(_that);case _LoadRequests() when loadRequests != null:
return loadRequests(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId,  int pointsRequested,  double amount,  String paymentMethod,  String? phone)?  createRequest,TResult Function( String userId)?  loadRequests,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateRequest() when createRequest != null:
return createRequest(_that.userId,_that.pointsRequested,_that.amount,_that.paymentMethod,_that.phone);case _LoadRequests() when loadRequests != null:
return loadRequests(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId,  int pointsRequested,  double amount,  String paymentMethod,  String? phone)  createRequest,required TResult Function( String userId)  loadRequests,}) {final _that = this;
switch (_that) {
case _CreateRequest():
return createRequest(_that.userId,_that.pointsRequested,_that.amount,_that.paymentMethod,_that.phone);case _LoadRequests():
return loadRequests(_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId,  int pointsRequested,  double amount,  String paymentMethod,  String? phone)?  createRequest,TResult? Function( String userId)?  loadRequests,}) {final _that = this;
switch (_that) {
case _CreateRequest() when createRequest != null:
return createRequest(_that.userId,_that.pointsRequested,_that.amount,_that.paymentMethod,_that.phone);case _LoadRequests() when loadRequests != null:
return loadRequests(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _CreateRequest implements WithdrawFirebaseEvent {
  const _CreateRequest({required this.userId, required this.pointsRequested, required this.amount, required this.paymentMethod, this.phone});
  

@override final  String userId;
 final  int pointsRequested;
 final  double amount;
 final  String paymentMethod;
 final  String? phone;

/// Create a copy of WithdrawFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateRequestCopyWith<_CreateRequest> get copyWith => __$CreateRequestCopyWithImpl<_CreateRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateRequest&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pointsRequested, pointsRequested) || other.pointsRequested == pointsRequested)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,userId,pointsRequested,amount,paymentMethod,phone);

@override
String toString() {
  return 'WithdrawFirebaseEvent.createRequest(userId: $userId, pointsRequested: $pointsRequested, amount: $amount, paymentMethod: $paymentMethod, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$CreateRequestCopyWith<$Res> implements $WithdrawFirebaseEventCopyWith<$Res> {
  factory _$CreateRequestCopyWith(_CreateRequest value, $Res Function(_CreateRequest) _then) = __$CreateRequestCopyWithImpl;
@override @useResult
$Res call({
 String userId, int pointsRequested, double amount, String paymentMethod, String? phone
});




}
/// @nodoc
class __$CreateRequestCopyWithImpl<$Res>
    implements _$CreateRequestCopyWith<$Res> {
  __$CreateRequestCopyWithImpl(this._self, this._then);

  final _CreateRequest _self;
  final $Res Function(_CreateRequest) _then;

/// Create a copy of WithdrawFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? pointsRequested = null,Object? amount = null,Object? paymentMethod = null,Object? phone = freezed,}) {
  return _then(_CreateRequest(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,pointsRequested: null == pointsRequested ? _self.pointsRequested : pointsRequested // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadRequests implements WithdrawFirebaseEvent {
  const _LoadRequests(this.userId);
  

@override final  String userId;

/// Create a copy of WithdrawFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadRequestsCopyWith<_LoadRequests> get copyWith => __$LoadRequestsCopyWithImpl<_LoadRequests>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadRequests&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'WithdrawFirebaseEvent.loadRequests(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$LoadRequestsCopyWith<$Res> implements $WithdrawFirebaseEventCopyWith<$Res> {
  factory _$LoadRequestsCopyWith(_LoadRequests value, $Res Function(_LoadRequests) _then) = __$LoadRequestsCopyWithImpl;
@override @useResult
$Res call({
 String userId
});




}
/// @nodoc
class __$LoadRequestsCopyWithImpl<$Res>
    implements _$LoadRequestsCopyWith<$Res> {
  __$LoadRequestsCopyWithImpl(this._self, this._then);

  final _LoadRequests _self;
  final $Res Function(_LoadRequests) _then;

/// Create a copy of WithdrawFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_LoadRequests(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$WithdrawFirebaseState {

 bool get isLoading; List<WithdrawRequestFirebaseModel> get withdraws; String? get successMessage; String? get errorMessage;
/// Create a copy of WithdrawFirebaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WithdrawFirebaseStateCopyWith<WithdrawFirebaseState> get copyWith => _$WithdrawFirebaseStateCopyWithImpl<WithdrawFirebaseState>(this as WithdrawFirebaseState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WithdrawFirebaseState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.withdraws, withdraws)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(withdraws),successMessage,errorMessage);

@override
String toString() {
  return 'WithdrawFirebaseState(isLoading: $isLoading, withdraws: $withdraws, successMessage: $successMessage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $WithdrawFirebaseStateCopyWith<$Res>  {
  factory $WithdrawFirebaseStateCopyWith(WithdrawFirebaseState value, $Res Function(WithdrawFirebaseState) _then) = _$WithdrawFirebaseStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<WithdrawRequestFirebaseModel> withdraws, String? successMessage, String? errorMessage
});




}
/// @nodoc
class _$WithdrawFirebaseStateCopyWithImpl<$Res>
    implements $WithdrawFirebaseStateCopyWith<$Res> {
  _$WithdrawFirebaseStateCopyWithImpl(this._self, this._then);

  final WithdrawFirebaseState _self;
  final $Res Function(WithdrawFirebaseState) _then;

/// Create a copy of WithdrawFirebaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? withdraws = null,Object? successMessage = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,withdraws: null == withdraws ? _self.withdraws : withdraws // ignore: cast_nullable_to_non_nullable
as List<WithdrawRequestFirebaseModel>,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WithdrawFirebaseState].
extension WithdrawFirebaseStatePatterns on WithdrawFirebaseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WithdrawFirebaseState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WithdrawFirebaseState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WithdrawFirebaseState value)  $default,){
final _that = this;
switch (_that) {
case _WithdrawFirebaseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WithdrawFirebaseState value)?  $default,){
final _that = this;
switch (_that) {
case _WithdrawFirebaseState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<WithdrawRequestFirebaseModel> withdraws,  String? successMessage,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WithdrawFirebaseState() when $default != null:
return $default(_that.isLoading,_that.withdraws,_that.successMessage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<WithdrawRequestFirebaseModel> withdraws,  String? successMessage,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _WithdrawFirebaseState():
return $default(_that.isLoading,_that.withdraws,_that.successMessage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<WithdrawRequestFirebaseModel> withdraws,  String? successMessage,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _WithdrawFirebaseState() when $default != null:
return $default(_that.isLoading,_that.withdraws,_that.successMessage,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _WithdrawFirebaseState implements WithdrawFirebaseState {
  const _WithdrawFirebaseState({this.isLoading = false, final  List<WithdrawRequestFirebaseModel> withdraws = const [], this.successMessage, this.errorMessage}): _withdraws = withdraws;
  

@override@JsonKey() final  bool isLoading;
 final  List<WithdrawRequestFirebaseModel> _withdraws;
@override@JsonKey() List<WithdrawRequestFirebaseModel> get withdraws {
  if (_withdraws is EqualUnmodifiableListView) return _withdraws;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_withdraws);
}

@override final  String? successMessage;
@override final  String? errorMessage;

/// Create a copy of WithdrawFirebaseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WithdrawFirebaseStateCopyWith<_WithdrawFirebaseState> get copyWith => __$WithdrawFirebaseStateCopyWithImpl<_WithdrawFirebaseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WithdrawFirebaseState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._withdraws, _withdraws)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_withdraws),successMessage,errorMessage);

@override
String toString() {
  return 'WithdrawFirebaseState(isLoading: $isLoading, withdraws: $withdraws, successMessage: $successMessage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$WithdrawFirebaseStateCopyWith<$Res> implements $WithdrawFirebaseStateCopyWith<$Res> {
  factory _$WithdrawFirebaseStateCopyWith(_WithdrawFirebaseState value, $Res Function(_WithdrawFirebaseState) _then) = __$WithdrawFirebaseStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<WithdrawRequestFirebaseModel> withdraws, String? successMessage, String? errorMessage
});




}
/// @nodoc
class __$WithdrawFirebaseStateCopyWithImpl<$Res>
    implements _$WithdrawFirebaseStateCopyWith<$Res> {
  __$WithdrawFirebaseStateCopyWithImpl(this._self, this._then);

  final _WithdrawFirebaseState _self;
  final $Res Function(_WithdrawFirebaseState) _then;

/// Create a copy of WithdrawFirebaseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? withdraws = null,Object? successMessage = freezed,Object? errorMessage = freezed,}) {
  return _then(_WithdrawFirebaseState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,withdraws: null == withdraws ? _self._withdraws : withdraws // ignore: cast_nullable_to_non_nullable
as List<WithdrawRequestFirebaseModel>,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
