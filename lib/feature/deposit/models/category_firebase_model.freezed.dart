// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_firebase_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryFirebaseModel {

 String? get id; int get idCategory; String get name; String get iconName; int get pointsPerKg;
/// Create a copy of CategoryFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryFirebaseModelCopyWith<CategoryFirebaseModel> get copyWith => _$CategoryFirebaseModelCopyWithImpl<CategoryFirebaseModel>(this as CategoryFirebaseModel, _$identity);

  /// Serializes this CategoryFirebaseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryFirebaseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.idCategory, idCategory) || other.idCategory == idCategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.pointsPerKg, pointsPerKg) || other.pointsPerKg == pointsPerKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idCategory,name,iconName,pointsPerKg);

@override
String toString() {
  return 'CategoryFirebaseModel(id: $id, idCategory: $idCategory, name: $name, iconName: $iconName, pointsPerKg: $pointsPerKg)';
}


}

/// @nodoc
abstract mixin class $CategoryFirebaseModelCopyWith<$Res>  {
  factory $CategoryFirebaseModelCopyWith(CategoryFirebaseModel value, $Res Function(CategoryFirebaseModel) _then) = _$CategoryFirebaseModelCopyWithImpl;
@useResult
$Res call({
 String? id, int idCategory, String name, String iconName, int pointsPerKg
});




}
/// @nodoc
class _$CategoryFirebaseModelCopyWithImpl<$Res>
    implements $CategoryFirebaseModelCopyWith<$Res> {
  _$CategoryFirebaseModelCopyWithImpl(this._self, this._then);

  final CategoryFirebaseModel _self;
  final $Res Function(CategoryFirebaseModel) _then;

/// Create a copy of CategoryFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? idCategory = null,Object? name = null,Object? iconName = null,Object? pointsPerKg = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,idCategory: null == idCategory ? _self.idCategory : idCategory // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,pointsPerKg: null == pointsPerKg ? _self.pointsPerKg : pointsPerKg // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryFirebaseModel].
extension CategoryFirebaseModelPatterns on CategoryFirebaseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryFirebaseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryFirebaseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryFirebaseModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryFirebaseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryFirebaseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryFirebaseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int idCategory,  String name,  String iconName,  int pointsPerKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryFirebaseModel() when $default != null:
return $default(_that.id,_that.idCategory,_that.name,_that.iconName,_that.pointsPerKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int idCategory,  String name,  String iconName,  int pointsPerKg)  $default,) {final _that = this;
switch (_that) {
case _CategoryFirebaseModel():
return $default(_that.id,_that.idCategory,_that.name,_that.iconName,_that.pointsPerKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int idCategory,  String name,  String iconName,  int pointsPerKg)?  $default,) {final _that = this;
switch (_that) {
case _CategoryFirebaseModel() when $default != null:
return $default(_that.id,_that.idCategory,_that.name,_that.iconName,_that.pointsPerKg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryFirebaseModel implements CategoryFirebaseModel {
   _CategoryFirebaseModel({this.id, required this.idCategory, required this.name, required this.iconName, required this.pointsPerKg});
  factory _CategoryFirebaseModel.fromJson(Map<String, dynamic> json) => _$CategoryFirebaseModelFromJson(json);

@override final  String? id;
@override final  int idCategory;
@override final  String name;
@override final  String iconName;
@override final  int pointsPerKg;

/// Create a copy of CategoryFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryFirebaseModelCopyWith<_CategoryFirebaseModel> get copyWith => __$CategoryFirebaseModelCopyWithImpl<_CategoryFirebaseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryFirebaseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryFirebaseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.idCategory, idCategory) || other.idCategory == idCategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.pointsPerKg, pointsPerKg) || other.pointsPerKg == pointsPerKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idCategory,name,iconName,pointsPerKg);

@override
String toString() {
  return 'CategoryFirebaseModel(id: $id, idCategory: $idCategory, name: $name, iconName: $iconName, pointsPerKg: $pointsPerKg)';
}


}

/// @nodoc
abstract mixin class _$CategoryFirebaseModelCopyWith<$Res> implements $CategoryFirebaseModelCopyWith<$Res> {
  factory _$CategoryFirebaseModelCopyWith(_CategoryFirebaseModel value, $Res Function(_CategoryFirebaseModel) _then) = __$CategoryFirebaseModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, int idCategory, String name, String iconName, int pointsPerKg
});




}
/// @nodoc
class __$CategoryFirebaseModelCopyWithImpl<$Res>
    implements _$CategoryFirebaseModelCopyWith<$Res> {
  __$CategoryFirebaseModelCopyWithImpl(this._self, this._then);

  final _CategoryFirebaseModel _self;
  final $Res Function(_CategoryFirebaseModel) _then;

/// Create a copy of CategoryFirebaseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? idCategory = null,Object? name = null,Object? iconName = null,Object? pointsPerKg = null,}) {
  return _then(_CategoryFirebaseModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,idCategory: null == idCategory ? _self.idCategory : idCategory // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,pointsPerKg: null == pointsPerKg ? _self.pointsPerKg : pointsPerKg // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
