// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_firebase_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryFirebaseEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryFirebaseEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryFirebaseEvent()';
}


}

/// @nodoc
class $HistoryFirebaseEventCopyWith<$Res>  {
$HistoryFirebaseEventCopyWith(HistoryFirebaseEvent _, $Res Function(HistoryFirebaseEvent) __);
}


/// Adds pattern-matching-related methods to [HistoryFirebaseEvent].
extension HistoryFirebaseEventPatterns on HistoryFirebaseEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadTransactions value)?  loadTransactions,TResult Function( _FilterChanged value)?  filterChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadTransactions() when loadTransactions != null:
return loadTransactions(_that);case _FilterChanged() when filterChanged != null:
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadTransactions value)  loadTransactions,required TResult Function( _FilterChanged value)  filterChanged,}){
final _that = this;
switch (_that) {
case _LoadTransactions():
return loadTransactions(_that);case _FilterChanged():
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadTransactions value)?  loadTransactions,TResult? Function( _FilterChanged value)?  filterChanged,}){
final _that = this;
switch (_that) {
case _LoadTransactions() when loadTransactions != null:
return loadTransactions(_that);case _FilterChanged() when filterChanged != null:
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId)?  loadTransactions,TResult Function( String category)?  filterChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadTransactions() when loadTransactions != null:
return loadTransactions(_that.userId);case _FilterChanged() when filterChanged != null:
return filterChanged(_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId)  loadTransactions,required TResult Function( String category)  filterChanged,}) {final _that = this;
switch (_that) {
case _LoadTransactions():
return loadTransactions(_that.userId);case _FilterChanged():
return filterChanged(_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId)?  loadTransactions,TResult? Function( String category)?  filterChanged,}) {final _that = this;
switch (_that) {
case _LoadTransactions() when loadTransactions != null:
return loadTransactions(_that.userId);case _FilterChanged() when filterChanged != null:
return filterChanged(_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _LoadTransactions implements HistoryFirebaseEvent {
  const _LoadTransactions(this.userId);
  

 final  String userId;

/// Create a copy of HistoryFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadTransactionsCopyWith<_LoadTransactions> get copyWith => __$LoadTransactionsCopyWithImpl<_LoadTransactions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadTransactions&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'HistoryFirebaseEvent.loadTransactions(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$LoadTransactionsCopyWith<$Res> implements $HistoryFirebaseEventCopyWith<$Res> {
  factory _$LoadTransactionsCopyWith(_LoadTransactions value, $Res Function(_LoadTransactions) _then) = __$LoadTransactionsCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class __$LoadTransactionsCopyWithImpl<$Res>
    implements _$LoadTransactionsCopyWith<$Res> {
  __$LoadTransactionsCopyWithImpl(this._self, this._then);

  final _LoadTransactions _self;
  final $Res Function(_LoadTransactions) _then;

/// Create a copy of HistoryFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_LoadTransactions(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FilterChanged implements HistoryFirebaseEvent {
  const _FilterChanged(this.category);
  

 final  String category;

/// Create a copy of HistoryFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterChangedCopyWith<_FilterChanged> get copyWith => __$FilterChangedCopyWithImpl<_FilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterChanged&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'HistoryFirebaseEvent.filterChanged(category: $category)';
}


}

/// @nodoc
abstract mixin class _$FilterChangedCopyWith<$Res> implements $HistoryFirebaseEventCopyWith<$Res> {
  factory _$FilterChangedCopyWith(_FilterChanged value, $Res Function(_FilterChanged) _then) = __$FilterChangedCopyWithImpl;
@useResult
$Res call({
 String category
});




}
/// @nodoc
class __$FilterChangedCopyWithImpl<$Res>
    implements _$FilterChangedCopyWith<$Res> {
  __$FilterChangedCopyWithImpl(this._self, this._then);

  final _FilterChanged _self;
  final $Res Function(_FilterChanged) _then;

/// Create a copy of HistoryFirebaseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_FilterChanged(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$HistoryFirebaseState {

 List<DepositFirebaseModel> get allTransactions; List<DepositFirebaseModel> get filteredTransactions; String get selectedCategory; int get completedCount; int get pendingCount; int get rejectedCount; bool get isLoading; String? get errorMessage;
/// Create a copy of HistoryFirebaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryFirebaseStateCopyWith<HistoryFirebaseState> get copyWith => _$HistoryFirebaseStateCopyWithImpl<HistoryFirebaseState>(this as HistoryFirebaseState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryFirebaseState&&const DeepCollectionEquality().equals(other.allTransactions, allTransactions)&&const DeepCollectionEquality().equals(other.filteredTransactions, filteredTransactions)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.rejectedCount, rejectedCount) || other.rejectedCount == rejectedCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(allTransactions),const DeepCollectionEquality().hash(filteredTransactions),selectedCategory,completedCount,pendingCount,rejectedCount,isLoading,errorMessage);

@override
String toString() {
  return 'HistoryFirebaseState(allTransactions: $allTransactions, filteredTransactions: $filteredTransactions, selectedCategory: $selectedCategory, completedCount: $completedCount, pendingCount: $pendingCount, rejectedCount: $rejectedCount, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HistoryFirebaseStateCopyWith<$Res>  {
  factory $HistoryFirebaseStateCopyWith(HistoryFirebaseState value, $Res Function(HistoryFirebaseState) _then) = _$HistoryFirebaseStateCopyWithImpl;
@useResult
$Res call({
 List<DepositFirebaseModel> allTransactions, List<DepositFirebaseModel> filteredTransactions, String selectedCategory, int completedCount, int pendingCount, int rejectedCount, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$HistoryFirebaseStateCopyWithImpl<$Res>
    implements $HistoryFirebaseStateCopyWith<$Res> {
  _$HistoryFirebaseStateCopyWithImpl(this._self, this._then);

  final HistoryFirebaseState _self;
  final $Res Function(HistoryFirebaseState) _then;

/// Create a copy of HistoryFirebaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allTransactions = null,Object? filteredTransactions = null,Object? selectedCategory = null,Object? completedCount = null,Object? pendingCount = null,Object? rejectedCount = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
allTransactions: null == allTransactions ? _self.allTransactions : allTransactions // ignore: cast_nullable_to_non_nullable
as List<DepositFirebaseModel>,filteredTransactions: null == filteredTransactions ? _self.filteredTransactions : filteredTransactions // ignore: cast_nullable_to_non_nullable
as List<DepositFirebaseModel>,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,rejectedCount: null == rejectedCount ? _self.rejectedCount : rejectedCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryFirebaseState].
extension HistoryFirebaseStatePatterns on HistoryFirebaseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryFirebaseState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryFirebaseState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryFirebaseState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryFirebaseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryFirebaseState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryFirebaseState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DepositFirebaseModel> allTransactions,  List<DepositFirebaseModel> filteredTransactions,  String selectedCategory,  int completedCount,  int pendingCount,  int rejectedCount,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryFirebaseState() when $default != null:
return $default(_that.allTransactions,_that.filteredTransactions,_that.selectedCategory,_that.completedCount,_that.pendingCount,_that.rejectedCount,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DepositFirebaseModel> allTransactions,  List<DepositFirebaseModel> filteredTransactions,  String selectedCategory,  int completedCount,  int pendingCount,  int rejectedCount,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HistoryFirebaseState():
return $default(_that.allTransactions,_that.filteredTransactions,_that.selectedCategory,_that.completedCount,_that.pendingCount,_that.rejectedCount,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DepositFirebaseModel> allTransactions,  List<DepositFirebaseModel> filteredTransactions,  String selectedCategory,  int completedCount,  int pendingCount,  int rejectedCount,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HistoryFirebaseState() when $default != null:
return $default(_that.allTransactions,_that.filteredTransactions,_that.selectedCategory,_that.completedCount,_that.pendingCount,_that.rejectedCount,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryFirebaseState implements HistoryFirebaseState {
  const _HistoryFirebaseState({final  List<DepositFirebaseModel> allTransactions = const [], final  List<DepositFirebaseModel> filteredTransactions = const [], this.selectedCategory = 'All', this.completedCount = 0, this.pendingCount = 0, this.rejectedCount = 0, this.isLoading = false, this.errorMessage}): _allTransactions = allTransactions,_filteredTransactions = filteredTransactions;
  

 final  List<DepositFirebaseModel> _allTransactions;
@override@JsonKey() List<DepositFirebaseModel> get allTransactions {
  if (_allTransactions is EqualUnmodifiableListView) return _allTransactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allTransactions);
}

 final  List<DepositFirebaseModel> _filteredTransactions;
@override@JsonKey() List<DepositFirebaseModel> get filteredTransactions {
  if (_filteredTransactions is EqualUnmodifiableListView) return _filteredTransactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredTransactions);
}

@override@JsonKey() final  String selectedCategory;
@override@JsonKey() final  int completedCount;
@override@JsonKey() final  int pendingCount;
@override@JsonKey() final  int rejectedCount;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of HistoryFirebaseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryFirebaseStateCopyWith<_HistoryFirebaseState> get copyWith => __$HistoryFirebaseStateCopyWithImpl<_HistoryFirebaseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryFirebaseState&&const DeepCollectionEquality().equals(other._allTransactions, _allTransactions)&&const DeepCollectionEquality().equals(other._filteredTransactions, _filteredTransactions)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.rejectedCount, rejectedCount) || other.rejectedCount == rejectedCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allTransactions),const DeepCollectionEquality().hash(_filteredTransactions),selectedCategory,completedCount,pendingCount,rejectedCount,isLoading,errorMessage);

@override
String toString() {
  return 'HistoryFirebaseState(allTransactions: $allTransactions, filteredTransactions: $filteredTransactions, selectedCategory: $selectedCategory, completedCount: $completedCount, pendingCount: $pendingCount, rejectedCount: $rejectedCount, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HistoryFirebaseStateCopyWith<$Res> implements $HistoryFirebaseStateCopyWith<$Res> {
  factory _$HistoryFirebaseStateCopyWith(_HistoryFirebaseState value, $Res Function(_HistoryFirebaseState) _then) = __$HistoryFirebaseStateCopyWithImpl;
@override @useResult
$Res call({
 List<DepositFirebaseModel> allTransactions, List<DepositFirebaseModel> filteredTransactions, String selectedCategory, int completedCount, int pendingCount, int rejectedCount, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$HistoryFirebaseStateCopyWithImpl<$Res>
    implements _$HistoryFirebaseStateCopyWith<$Res> {
  __$HistoryFirebaseStateCopyWithImpl(this._self, this._then);

  final _HistoryFirebaseState _self;
  final $Res Function(_HistoryFirebaseState) _then;

/// Create a copy of HistoryFirebaseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allTransactions = null,Object? filteredTransactions = null,Object? selectedCategory = null,Object? completedCount = null,Object? pendingCount = null,Object? rejectedCount = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_HistoryFirebaseState(
allTransactions: null == allTransactions ? _self._allTransactions : allTransactions // ignore: cast_nullable_to_non_nullable
as List<DepositFirebaseModel>,filteredTransactions: null == filteredTransactions ? _self._filteredTransactions : filteredTransactions // ignore: cast_nullable_to_non_nullable
as List<DepositFirebaseModel>,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,rejectedCount: null == rejectedCount ? _self.rejectedCount : rejectedCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
