// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DepositEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepositEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DepositEvent()';
}


}

/// @nodoc
class $DepositEventCopyWith<$Res>  {
$DepositEventCopyWith(DepositEvent _, $Res Function(DepositEvent) __);
}


/// Adds pattern-matching-related methods to [DepositEvent].
extension DepositEventPatterns on DepositEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadDeposits value)?  loadDeposits,TResult Function( _AddDeposit value)?  addDeposit,TResult Function( _DeleteDeposit value)?  deleteDeposit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadDeposits() when loadDeposits != null:
return loadDeposits(_that);case _AddDeposit() when addDeposit != null:
return addDeposit(_that);case _DeleteDeposit() when deleteDeposit != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadDeposits value)  loadDeposits,required TResult Function( _AddDeposit value)  addDeposit,required TResult Function( _DeleteDeposit value)  deleteDeposit,}){
final _that = this;
switch (_that) {
case _LoadDeposits():
return loadDeposits(_that);case _AddDeposit():
return addDeposit(_that);case _DeleteDeposit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadDeposits value)?  loadDeposits,TResult? Function( _AddDeposit value)?  addDeposit,TResult? Function( _DeleteDeposit value)?  deleteDeposit,}){
final _that = this;
switch (_that) {
case _LoadDeposits() when loadDeposits != null:
return loadDeposits(_that);case _AddDeposit() when addDeposit != null:
return addDeposit(_that);case _DeleteDeposit() when deleteDeposit != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadDeposits,TResult Function( DepositModel deposit)?  addDeposit,TResult Function( int id)?  deleteDeposit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadDeposits() when loadDeposits != null:
return loadDeposits();case _AddDeposit() when addDeposit != null:
return addDeposit(_that.deposit);case _DeleteDeposit() when deleteDeposit != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadDeposits,required TResult Function( DepositModel deposit)  addDeposit,required TResult Function( int id)  deleteDeposit,}) {final _that = this;
switch (_that) {
case _LoadDeposits():
return loadDeposits();case _AddDeposit():
return addDeposit(_that.deposit);case _DeleteDeposit():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadDeposits,TResult? Function( DepositModel deposit)?  addDeposit,TResult? Function( int id)?  deleteDeposit,}) {final _that = this;
switch (_that) {
case _LoadDeposits() when loadDeposits != null:
return loadDeposits();case _AddDeposit() when addDeposit != null:
return addDeposit(_that.deposit);case _DeleteDeposit() when deleteDeposit != null:
return deleteDeposit(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _LoadDeposits implements DepositEvent {
  const _LoadDeposits();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadDeposits);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DepositEvent.loadDeposits()';
}


}




/// @nodoc


class _AddDeposit implements DepositEvent {
  const _AddDeposit(this.deposit);
  

 final  DepositModel deposit;

/// Create a copy of DepositEvent
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
  return 'DepositEvent.addDeposit(deposit: $deposit)';
}


}

/// @nodoc
abstract mixin class _$AddDepositCopyWith<$Res> implements $DepositEventCopyWith<$Res> {
  factory _$AddDepositCopyWith(_AddDeposit value, $Res Function(_AddDeposit) _then) = __$AddDepositCopyWithImpl;
@useResult
$Res call({
 DepositModel deposit
});


$DepositModelCopyWith<$Res> get deposit;

}
/// @nodoc
class __$AddDepositCopyWithImpl<$Res>
    implements _$AddDepositCopyWith<$Res> {
  __$AddDepositCopyWithImpl(this._self, this._then);

  final _AddDeposit _self;
  final $Res Function(_AddDeposit) _then;

/// Create a copy of DepositEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deposit = null,}) {
  return _then(_AddDeposit(
null == deposit ? _self.deposit : deposit // ignore: cast_nullable_to_non_nullable
as DepositModel,
  ));
}

/// Create a copy of DepositEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepositModelCopyWith<$Res> get deposit {
  
  return $DepositModelCopyWith<$Res>(_self.deposit, (value) {
    return _then(_self.copyWith(deposit: value));
  });
}
}

/// @nodoc


class _DeleteDeposit implements DepositEvent {
  const _DeleteDeposit(this.id);
  

 final  int id;

/// Create a copy of DepositEvent
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
  return 'DepositEvent.deleteDeposit(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteDepositCopyWith<$Res> implements $DepositEventCopyWith<$Res> {
  factory _$DeleteDepositCopyWith(_DeleteDeposit value, $Res Function(_DeleteDeposit) _then) = __$DeleteDepositCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DeleteDepositCopyWithImpl<$Res>
    implements _$DeleteDepositCopyWith<$Res> {
  __$DeleteDepositCopyWithImpl(this._self, this._then);

  final _DeleteDeposit _self;
  final $Res Function(_DeleteDeposit) _then;

/// Create a copy of DepositEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteDeposit(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$DepositState {

 List<DepositModel> get deposits; bool get isLoading; String? get errorMessage;
/// Create a copy of DepositState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepositStateCopyWith<DepositState> get copyWith => _$DepositStateCopyWithImpl<DepositState>(this as DepositState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepositState&&const DeepCollectionEquality().equals(other.deposits, deposits)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(deposits),isLoading,errorMessage);

@override
String toString() {
  return 'DepositState(deposits: $deposits, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DepositStateCopyWith<$Res>  {
  factory $DepositStateCopyWith(DepositState value, $Res Function(DepositState) _then) = _$DepositStateCopyWithImpl;
@useResult
$Res call({
 List<DepositModel> deposits, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$DepositStateCopyWithImpl<$Res>
    implements $DepositStateCopyWith<$Res> {
  _$DepositStateCopyWithImpl(this._self, this._then);

  final DepositState _self;
  final $Res Function(DepositState) _then;

/// Create a copy of DepositState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deposits = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
deposits: null == deposits ? _self.deposits : deposits // ignore: cast_nullable_to_non_nullable
as List<DepositModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DepositState].
extension DepositStatePatterns on DepositState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepositState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepositState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepositState value)  $default,){
final _that = this;
switch (_that) {
case _DepositState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepositState value)?  $default,){
final _that = this;
switch (_that) {
case _DepositState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DepositModel> deposits,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepositState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DepositModel> deposits,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _DepositState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DepositModel> deposits,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DepositState() when $default != null:
return $default(_that.deposits,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DepositState implements DepositState {
  const _DepositState({final  List<DepositModel> deposits = const [], this.isLoading = false, this.errorMessage}): _deposits = deposits;
  

 final  List<DepositModel> _deposits;
@override@JsonKey() List<DepositModel> get deposits {
  if (_deposits is EqualUnmodifiableListView) return _deposits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deposits);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of DepositState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepositStateCopyWith<_DepositState> get copyWith => __$DepositStateCopyWithImpl<_DepositState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepositState&&const DeepCollectionEquality().equals(other._deposits, _deposits)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_deposits),isLoading,errorMessage);

@override
String toString() {
  return 'DepositState(deposits: $deposits, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$DepositStateCopyWith<$Res> implements $DepositStateCopyWith<$Res> {
  factory _$DepositStateCopyWith(_DepositState value, $Res Function(_DepositState) _then) = __$DepositStateCopyWithImpl;
@override @useResult
$Res call({
 List<DepositModel> deposits, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$DepositStateCopyWithImpl<$Res>
    implements _$DepositStateCopyWith<$Res> {
  __$DepositStateCopyWithImpl(this._self, this._then);

  final _DepositState _self;
  final $Res Function(_DepositState) _then;

/// Create a copy of DepositState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deposits = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_DepositState(
deposits: null == deposits ? _self._deposits : deposits // ignore: cast_nullable_to_non_nullable
as List<DepositModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
