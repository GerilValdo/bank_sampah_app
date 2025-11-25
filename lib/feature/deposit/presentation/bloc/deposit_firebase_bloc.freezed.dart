// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_firebase_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DepositFirebaseEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepositFirebaseEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DepositFirebaseEvent()';
}


}

/// @nodoc
class $DepositFirebaseEventCopyWith<$Res>  {
$DepositFirebaseEventCopyWith(DepositFirebaseEvent _, $Res Function(DepositFirebaseEvent) __);
}


/// Adds pattern-matching-related methods to [DepositFirebaseEvent].
extension DepositFirebaseEventPatterns on DepositFirebaseEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadDeposits value)?  loadDeposits,TResult Function( _AddDeposit value)?  addDeposit,TResult Function( _UpdateDeposit value)?  updateDeposit,TResult Function( _DeleteDeposit value)?  deleteDeposit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadDeposits() when loadDeposits != null:
return loadDeposits(_that);case _AddDeposit() when addDeposit != null:
return addDeposit(_that);case _UpdateDeposit() when updateDeposit != null:
return updateDeposit(_that);case _DeleteDeposit() when deleteDeposit != null:
return deleteDeposit(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadDeposits value)  loadDeposits,required TResult Function( _AddDeposit value)  addDeposit,required TResult Function( _UpdateDeposit value)  updateDeposit,required TResult Function( _DeleteDeposit value)  deleteDeposit,}){
final _that = this;
switch (_that) {
case _LoadDeposits():
return loadDeposits(_that);case _AddDeposit():
return addDeposit(_that);case _UpdateDeposit():
return updateDeposit(_that);case _DeleteDeposit():
return deleteDeposit(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadDeposits value)?  loadDeposits,TResult? Function( _AddDeposit value)?  addDeposit,TResult? Function( _UpdateDeposit value)?  updateDeposit,TResult? Function( _DeleteDeposit value)?  deleteDeposit,}){
final _that = this;
switch (_that) {
case _LoadDeposits() when loadDeposits != null:
return loadDeposits(_that);case _AddDeposit() when addDeposit != null:
return addDeposit(_that);case _UpdateDeposit() when updateDeposit != null:
return updateDeposit(_that);case _DeleteDeposit() when deleteDeposit != null:
return deleteDeposit(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId)?  loadDeposits,TResult Function( DepositFirebaseModel deposit)?  addDeposit,TResult Function( DepositFirebaseModel deposit)?  updateDeposit,TResult Function( String id)?  deleteDeposit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadDeposits() when loadDeposits != null:
return loadDeposits(_that.userId);case _AddDeposit() when addDeposit != null:
return addDeposit(_that.deposit);case _UpdateDeposit() when updateDeposit != null:
return updateDeposit(_that.deposit);case _DeleteDeposit() when deleteDeposit != null:
return deleteDeposit(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId)  loadDeposits,required TResult Function( DepositFirebaseModel deposit)  addDeposit,required TResult Function( DepositFirebaseModel deposit)  updateDeposit,required TResult Function( String id)  deleteDeposit,}) {final _that = this;
switch (_that) {
case _LoadDeposits():
return loadDeposits(_that.userId);case _AddDeposit():
return addDeposit(_that.deposit);case _UpdateDeposit():
return updateDeposit(_that.deposit);case _DeleteDeposit():
return deleteDeposit(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId)?  loadDeposits,TResult? Function( DepositFirebaseModel deposit)?  addDeposit,TResult? Function( DepositFirebaseModel deposit)?  updateDeposit,TResult? Function( String id)?  deleteDeposit,}) {final _that = this;
switch (_that) {
case _LoadDeposits() when loadDeposits != null:
return loadDeposits(_that.userId);case _AddDeposit() when addDeposit != null:
return addDeposit(_that.deposit);case _UpdateDeposit() when updateDeposit != null:
return updateDeposit(_that.deposit);case _DeleteDeposit() when deleteDeposit != null:
return deleteDeposit(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _LoadDeposits implements DepositFirebaseEvent {
  const _LoadDeposits(this.userId);
  

 final  String userId;

/// Create a copy of DepositFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadDepositsCopyWith<_LoadDeposits> get copyWith => __$LoadDepositsCopyWithImpl<_LoadDeposits>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadDeposits&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'DepositFirebaseEvent.loadDeposits(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$LoadDepositsCopyWith<$Res> implements $DepositFirebaseEventCopyWith<$Res> {
  factory _$LoadDepositsCopyWith(_LoadDeposits value, $Res Function(_LoadDeposits) _then) = __$LoadDepositsCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class __$LoadDepositsCopyWithImpl<$Res>
    implements _$LoadDepositsCopyWith<$Res> {
  __$LoadDepositsCopyWithImpl(this._self, this._then);

  final _LoadDeposits _self;
  final $Res Function(_LoadDeposits) _then;

/// Create a copy of DepositFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_LoadDeposits(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AddDeposit implements DepositFirebaseEvent {
  const _AddDeposit(this.deposit);
  

 final  DepositFirebaseModel deposit;

/// Create a copy of DepositFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddDepositCopyWith<_AddDeposit> get copyWith => __$AddDepositCopyWithImpl<_AddDeposit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddDeposit&&(identical(other.deposit, deposit) || other.deposit == deposit));
}


@override
int get hashCode => Object.hash(runtimeType,deposit);

@override
String toString() {
  return 'DepositFirebaseEvent.addDeposit(deposit: $deposit)';
}


}

/// @nodoc
abstract mixin class _$AddDepositCopyWith<$Res> implements $DepositFirebaseEventCopyWith<$Res> {
  factory _$AddDepositCopyWith(_AddDeposit value, $Res Function(_AddDeposit) _then) = __$AddDepositCopyWithImpl;
@useResult
$Res call({
 DepositFirebaseModel deposit
});


$DepositFirebaseModelCopyWith<$Res> get deposit;

}
/// @nodoc
class __$AddDepositCopyWithImpl<$Res>
    implements _$AddDepositCopyWith<$Res> {
  __$AddDepositCopyWithImpl(this._self, this._then);

  final _AddDeposit _self;
  final $Res Function(_AddDeposit) _then;

/// Create a copy of DepositFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deposit = null,}) {
  return _then(_AddDeposit(
null == deposit ? _self.deposit : deposit // ignore: cast_nullable_to_non_nullable
as DepositFirebaseModel,
  ));
}

/// Create a copy of DepositFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepositFirebaseModelCopyWith<$Res> get deposit {
  
  return $DepositFirebaseModelCopyWith<$Res>(_self.deposit, (value) {
    return _then(_self.copyWith(deposit: value));
  });
}
}

/// @nodoc


class _UpdateDeposit implements DepositFirebaseEvent {
  const _UpdateDeposit(this.deposit);
  

 final  DepositFirebaseModel deposit;

/// Create a copy of DepositFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDepositCopyWith<_UpdateDeposit> get copyWith => __$UpdateDepositCopyWithImpl<_UpdateDeposit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDeposit&&(identical(other.deposit, deposit) || other.deposit == deposit));
}


@override
int get hashCode => Object.hash(runtimeType,deposit);

@override
String toString() {
  return 'DepositFirebaseEvent.updateDeposit(deposit: $deposit)';
}


}

/// @nodoc
abstract mixin class _$UpdateDepositCopyWith<$Res> implements $DepositFirebaseEventCopyWith<$Res> {
  factory _$UpdateDepositCopyWith(_UpdateDeposit value, $Res Function(_UpdateDeposit) _then) = __$UpdateDepositCopyWithImpl;
@useResult
$Res call({
 DepositFirebaseModel deposit
});


$DepositFirebaseModelCopyWith<$Res> get deposit;

}
/// @nodoc
class __$UpdateDepositCopyWithImpl<$Res>
    implements _$UpdateDepositCopyWith<$Res> {
  __$UpdateDepositCopyWithImpl(this._self, this._then);

  final _UpdateDeposit _self;
  final $Res Function(_UpdateDeposit) _then;

/// Create a copy of DepositFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deposit = null,}) {
  return _then(_UpdateDeposit(
null == deposit ? _self.deposit : deposit // ignore: cast_nullable_to_non_nullable
as DepositFirebaseModel,
  ));
}

/// Create a copy of DepositFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepositFirebaseModelCopyWith<$Res> get deposit {
  
  return $DepositFirebaseModelCopyWith<$Res>(_self.deposit, (value) {
    return _then(_self.copyWith(deposit: value));
  });
}
}

/// @nodoc


class _DeleteDeposit implements DepositFirebaseEvent {
  const _DeleteDeposit(this.id);
  

 final  String id;

/// Create a copy of DepositFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteDepositCopyWith<_DeleteDeposit> get copyWith => __$DeleteDepositCopyWithImpl<_DeleteDeposit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteDeposit&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DepositFirebaseEvent.deleteDeposit(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteDepositCopyWith<$Res> implements $DepositFirebaseEventCopyWith<$Res> {
  factory _$DeleteDepositCopyWith(_DeleteDeposit value, $Res Function(_DeleteDeposit) _then) = __$DeleteDepositCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteDepositCopyWithImpl<$Res>
    implements _$DeleteDepositCopyWith<$Res> {
  __$DeleteDepositCopyWithImpl(this._self, this._then);

  final _DeleteDeposit _self;
  final $Res Function(_DeleteDeposit) _then;

/// Create a copy of DepositFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteDeposit(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$DepositFirebaseState {

 List<DepositFirebaseModel> get deposits; bool get isLoading; String? get errorMessage;
/// Create a copy of DepositFirebaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepositFirebaseStateCopyWith<DepositFirebaseState> get copyWith => _$DepositFirebaseStateCopyWithImpl<DepositFirebaseState>(this as DepositFirebaseState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepositFirebaseState&&const DeepCollectionEquality().equals(other.deposits, deposits)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(deposits),isLoading,errorMessage);

@override
String toString() {
  return 'DepositFirebaseState(deposits: $deposits, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DepositFirebaseStateCopyWith<$Res>  {
  factory $DepositFirebaseStateCopyWith(DepositFirebaseState value, $Res Function(DepositFirebaseState) _then) = _$DepositFirebaseStateCopyWithImpl;
@useResult
$Res call({
 List<DepositFirebaseModel> deposits, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$DepositFirebaseStateCopyWithImpl<$Res>
    implements $DepositFirebaseStateCopyWith<$Res> {
  _$DepositFirebaseStateCopyWithImpl(this._self, this._then);

  final DepositFirebaseState _self;
  final $Res Function(DepositFirebaseState) _then;

/// Create a copy of DepositFirebaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deposits = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
deposits: null == deposits ? _self.deposits : deposits // ignore: cast_nullable_to_non_nullable
as List<DepositFirebaseModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DepositFirebaseState].
extension DepositFirebaseStatePatterns on DepositFirebaseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepositFirebaseState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepositFirebaseState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepositFirebaseState value)  $default,){
final _that = this;
switch (_that) {
case _DepositFirebaseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepositFirebaseState value)?  $default,){
final _that = this;
switch (_that) {
case _DepositFirebaseState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DepositFirebaseModel> deposits,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepositFirebaseState() when $default != null:
return $default(_that.deposits,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DepositFirebaseModel> deposits,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _DepositFirebaseState():
return $default(_that.deposits,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DepositFirebaseModel> deposits,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DepositFirebaseState() when $default != null:
return $default(_that.deposits,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DepositFirebaseState implements DepositFirebaseState {
  const _DepositFirebaseState({final  List<DepositFirebaseModel> deposits = const [], this.isLoading = false, this.errorMessage}): _deposits = deposits;
  

 final  List<DepositFirebaseModel> _deposits;
@override@JsonKey() List<DepositFirebaseModel> get deposits {
  if (_deposits is EqualUnmodifiableListView) return _deposits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deposits);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of DepositFirebaseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepositFirebaseStateCopyWith<_DepositFirebaseState> get copyWith => __$DepositFirebaseStateCopyWithImpl<_DepositFirebaseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepositFirebaseState&&const DeepCollectionEquality().equals(other._deposits, _deposits)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_deposits),isLoading,errorMessage);

@override
String toString() {
  return 'DepositFirebaseState(deposits: $deposits, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$DepositFirebaseStateCopyWith<$Res> implements $DepositFirebaseStateCopyWith<$Res> {
  factory _$DepositFirebaseStateCopyWith(_DepositFirebaseState value, $Res Function(_DepositFirebaseState) _then) = __$DepositFirebaseStateCopyWithImpl;
@override @useResult
$Res call({
 List<DepositFirebaseModel> deposits, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$DepositFirebaseStateCopyWithImpl<$Res>
    implements _$DepositFirebaseStateCopyWith<$Res> {
  __$DepositFirebaseStateCopyWithImpl(this._self, this._then);

  final _DepositFirebaseState _self;
  final $Res Function(_DepositFirebaseState) _then;

/// Create a copy of DepositFirebaseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deposits = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_DepositFirebaseState(
deposits: null == deposits ? _self._deposits : deposits // ignore: cast_nullable_to_non_nullable
as List<DepositFirebaseModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
