// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UiState {

 String get monthlyTotalLabel; int get expenseCount; int get localTapCount;
/// Create a copy of _UiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UiStateCopyWith<_UiState> get copyWith => __$UiStateCopyWithImpl<_UiState>(this as _UiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UiState&&(identical(other.monthlyTotalLabel, monthlyTotalLabel) || other.monthlyTotalLabel == monthlyTotalLabel)&&(identical(other.expenseCount, expenseCount) || other.expenseCount == expenseCount)&&(identical(other.localTapCount, localTapCount) || other.localTapCount == localTapCount));
}


@override
int get hashCode => Object.hash(runtimeType,monthlyTotalLabel,expenseCount,localTapCount);

@override
String toString() {
  return '_UiState(monthlyTotalLabel: $monthlyTotalLabel, expenseCount: $expenseCount, localTapCount: $localTapCount)';
}


}

/// @nodoc
abstract mixin class _$UiStateCopyWith<$Res>  {
  factory _$UiStateCopyWith(_UiState value, $Res Function(_UiState) _then) = __$UiStateCopyWithImpl;
@useResult
$Res call({
 String monthlyTotalLabel, int expenseCount, int localTapCount
});




}
/// @nodoc
class __$UiStateCopyWithImpl<$Res>
    implements _$UiStateCopyWith<$Res> {
  __$UiStateCopyWithImpl(this._self, this._then);

  final _UiState _self;
  final $Res Function(_UiState) _then;

/// Create a copy of _UiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? monthlyTotalLabel = null,Object? expenseCount = null,Object? localTapCount = null,}) {
  return _then(_self.copyWith(
monthlyTotalLabel: null == monthlyTotalLabel ? _self.monthlyTotalLabel : monthlyTotalLabel // ignore: cast_nullable_to_non_nullable
as String,expenseCount: null == expenseCount ? _self.expenseCount : expenseCount // ignore: cast_nullable_to_non_nullable
as int,localTapCount: null == localTapCount ? _self.localTapCount : localTapCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [_UiState].
extension _UiStatePatterns on _UiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( __UiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case __UiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( __UiState value)  $default,){
final _that = this;
switch (_that) {
case __UiState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( __UiState value)?  $default,){
final _that = this;
switch (_that) {
case __UiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String monthlyTotalLabel,  int expenseCount,  int localTapCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case __UiState() when $default != null:
return $default(_that.monthlyTotalLabel,_that.expenseCount,_that.localTapCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String monthlyTotalLabel,  int expenseCount,  int localTapCount)  $default,) {final _that = this;
switch (_that) {
case __UiState():
return $default(_that.monthlyTotalLabel,_that.expenseCount,_that.localTapCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String monthlyTotalLabel,  int expenseCount,  int localTapCount)?  $default,) {final _that = this;
switch (_that) {
case __UiState() when $default != null:
return $default(_that.monthlyTotalLabel,_that.expenseCount,_that.localTapCount);case _:
  return null;

}
}

}

/// @nodoc


class __UiState implements _UiState {
  const __UiState({required this.monthlyTotalLabel, required this.expenseCount, required this.localTapCount});
  

@override final  String monthlyTotalLabel;
@override final  int expenseCount;
@override final  int localTapCount;

/// Create a copy of _UiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$_UiStateCopyWith<__UiState> get copyWith => __$_UiStateCopyWithImpl<__UiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is __UiState&&(identical(other.monthlyTotalLabel, monthlyTotalLabel) || other.monthlyTotalLabel == monthlyTotalLabel)&&(identical(other.expenseCount, expenseCount) || other.expenseCount == expenseCount)&&(identical(other.localTapCount, localTapCount) || other.localTapCount == localTapCount));
}


@override
int get hashCode => Object.hash(runtimeType,monthlyTotalLabel,expenseCount,localTapCount);

@override
String toString() {
  return '_UiState(monthlyTotalLabel: $monthlyTotalLabel, expenseCount: $expenseCount, localTapCount: $localTapCount)';
}


}

/// @nodoc
abstract mixin class _$_UiStateCopyWith<$Res> implements _$UiStateCopyWith<$Res> {
  factory _$_UiStateCopyWith(__UiState value, $Res Function(__UiState) _then) = __$_UiStateCopyWithImpl;
@override @useResult
$Res call({
 String monthlyTotalLabel, int expenseCount, int localTapCount
});




}
/// @nodoc
class __$_UiStateCopyWithImpl<$Res>
    implements _$_UiStateCopyWith<$Res> {
  __$_UiStateCopyWithImpl(this._self, this._then);

  final __UiState _self;
  final $Res Function(__UiState) _then;

/// Create a copy of _UiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monthlyTotalLabel = null,Object? expenseCount = null,Object? localTapCount = null,}) {
  return _then(__UiState(
monthlyTotalLabel: null == monthlyTotalLabel ? _self.monthlyTotalLabel : monthlyTotalLabel // ignore: cast_nullable_to_non_nullable
as String,expenseCount: null == expenseCount ? _self.expenseCount : expenseCount // ignore: cast_nullable_to_non_nullable
as int,localTapCount: null == localTapCount ? _self.localTapCount : localTapCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
