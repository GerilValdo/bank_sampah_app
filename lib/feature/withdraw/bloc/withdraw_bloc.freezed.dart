// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WithdrawEvent {

 int get userId;
/// Create a copy of WithdrawEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WithdrawEventCopyWith<WithdrawEvent> get copyWith => _$WithdrawEventCopyWithImpl<WithdrawEvent>(this as WithdrawEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WithdrawEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'WithdrawEvent(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $WithdrawEventCopyWith<$Res>  {
  factory $WithdrawEventCopyWith(WithdrawEvent value, $Res Function(WithdrawEvent) _then) = _$WithdrawEventCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class _$WithdrawEventCopyWithImpl<$Res>
    implements $WithdrawEventCopyWith<$Res> {
  _$WithdrawEventCopyWithImpl(this._self, this._then);

  final WithdrawEvent _self;
  final $Res Function(WithdrawEvent) _then;

/// Create a copy of WithdrawEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WithdrawEvent].
extension WithdrawEventPatterns on WithdrawEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int userId,  int pointsRequested,  double amount,  String paymentMethod,  String? phone)?  createRequest,TResult Function( int userId)?  loadRequests,required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int userId,  int pointsRequested,  double amount,  String paymentMethod,  String? phone)  createRequest,required TResult Function( int userId)  loadRequests,}) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int userId,  int pointsRequested,  double amount,  String paymentMethod,  String? phone)?  createRequest,TResult? Function( int userId)?  loadRequests,}) {final _that = this;
switch (_that) {
case _CreateRequest() when createRequest != null:
return createRequest(_that.userId,_that.pointsRequested,_that.amount,_that.paymentMethod,_that.phone);case _LoadRequests() when loadRequests != null:
return loadRequests(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _CreateRequest implements WithdrawEvent {
  const _CreateRequest({required this.userId, required this.pointsRequested, required this.amount, required this.paymentMethod, this.phone});
  

@override final  int userId;
 final  int pointsRequested;
 final  double amount;
 final  String paymentMethod;
 final  String? phone;

/// Create a copy of WithdrawEvent
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
  return 'WithdrawEvent.createRequest(userId: $userId, pointsRequested: $pointsRequested, amount: $amount, paymentMethod: $paymentMethod, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$CreateRequestCopyWith<$Res> implements $WithdrawEventCopyWith<$Res> {
  factory _$CreateRequestCopyWith(_CreateRequest value, $Res Function(_CreateRequest) _then) = __$CreateRequestCopyWithImpl;
@override @useResult
$Res call({
 int userId, int pointsRequested, double amount, String paymentMethod, String? phone
});




}
/// @nodoc
class __$CreateRequestCopyWithImpl<$Res>
    implements _$CreateRequestCopyWith<$Res> {
  __$CreateRequestCopyWithImpl(this._self, this._then);

  final _CreateRequest _self;
  final $Res Function(_CreateRequest) _then;

/// Create a copy of WithdrawEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? pointsRequested = null,Object? amount = null,Object? paymentMethod = null,Object? phone = freezed,}) {
  return _then(_CreateRequest(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,pointsRequested: null == pointsRequested ? _self.pointsRequested : pointsRequested // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadRequests implements WithdrawEvent {
  const _LoadRequests(this.userId);
  

@override final  int userId;

/// Create a copy of WithdrawEvent
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
  return 'WithdrawEvent.loadRequests(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$LoadRequestsCopyWith<$Res> implements $WithdrawEventCopyWith<$Res> {
  factory _$LoadRequestsCopyWith(_LoadRequests value, $Res Function(_LoadRequests) _then) = __$LoadRequestsCopyWithImpl;
@override @useResult
$Res call({
 int userId
});




}
/// @nodoc
class __$LoadRequestsCopyWithImpl<$Res>
    implements _$LoadRequestsCopyWith<$Res> {
  __$LoadRequestsCopyWithImpl(this._self, this._then);

  final _LoadRequests _self;
  final $Res Function(_LoadRequests) _then;

/// Create a copy of WithdrawEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_LoadRequests(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$WithdrawState {

 bool get isLoading; List<WithdrawRequestModel> get requests; String? get successMessage; String? get errorMessage;
/// Create a copy of WithdrawState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WithdrawStateCopyWith<WithdrawState> get copyWith => _$WithdrawStateCopyWithImpl<WithdrawState>(this as WithdrawState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WithdrawState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.requests, requests)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(requests),successMessage,errorMessage);

@override
String toString() {
  return 'WithdrawState(isLoading: $isLoading, requests: $requests, successMessage: $successMessage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $WithdrawStateCopyWith<$Res>  {
  factory $WithdrawStateCopyWith(WithdrawState value, $Res Function(WithdrawState) _then) = _$WithdrawStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<WithdrawRequestModel> requests, String? successMessage, String? errorMessage
});




}
/// @nodoc
class _$WithdrawStateCopyWithImpl<$Res>
    implements $WithdrawStateCopyWith<$Res> {
  _$WithdrawStateCopyWithImpl(this._self, this._then);

  final WithdrawState _self;
  final $Res Function(WithdrawState) _then;

/// Create a copy of WithdrawState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? requests = null,Object? successMessage = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<WithdrawRequestModel>,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WithdrawState].
extension WithdrawStatePatterns on WithdrawState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WithdrawState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WithdrawState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WithdrawState value)  $default,){
final _that = this;
switch (_that) {
case _WithdrawState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WithdrawState value)?  $default,){
final _that = this;
switch (_that) {
case _WithdrawState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<WithdrawRequestModel> requests,  String? successMessage,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WithdrawState() when $default != null:
return $default(_that.isLoading,_that.requests,_that.successMessage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<WithdrawRequestModel> requests,  String? successMessage,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _WithdrawState():
return $default(_that.isLoading,_that.requests,_that.successMessage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<WithdrawRequestModel> requests,  String? successMessage,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _WithdrawState() when $default != null:
return $default(_that.isLoading,_that.requests,_that.successMessage,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _WithdrawState implements WithdrawState {
  const _WithdrawState({this.isLoading = false, final  List<WithdrawRequestModel> requests = const [], this.successMessage, this.errorMessage}): _requests = requests;
  

@override@JsonKey() final  bool isLoading;
 final  List<WithdrawRequestModel> _requests;
@override@JsonKey() List<WithdrawRequestModel> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

@override final  String? successMessage;
@override final  String? errorMessage;

/// Create a copy of WithdrawState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WithdrawStateCopyWith<_WithdrawState> get copyWith => __$WithdrawStateCopyWithImpl<_WithdrawState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WithdrawState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._requests, _requests)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_requests),successMessage,errorMessage);

@override
String toString() {
  return 'WithdrawState(isLoading: $isLoading, requests: $requests, successMessage: $successMessage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$WithdrawStateCopyWith<$Res> implements $WithdrawStateCopyWith<$Res> {
  factory _$WithdrawStateCopyWith(_WithdrawState value, $Res Function(_WithdrawState) _then) = __$WithdrawStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<WithdrawRequestModel> requests, String? successMessage, String? errorMessage
});




}
/// @nodoc
class __$WithdrawStateCopyWithImpl<$Res>
    implements _$WithdrawStateCopyWith<$Res> {
  __$WithdrawStateCopyWithImpl(this._self, this._then);

  final _WithdrawState _self;
  final $Res Function(_WithdrawState) _then;

/// Create a copy of WithdrawState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? requests = null,Object? successMessage = freezed,Object? errorMessage = freezed,}) {
  return _then(_WithdrawState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<WithdrawRequestModel>,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
