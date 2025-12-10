// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UiState {

 List<Expense> get expenses;
/// Create a copy of _UiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UiStateCopyWith<_UiState> get copyWith => __$UiStateCopyWithImpl<_UiState>(this as _UiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UiState&&const DeepCollectionEquality().equals(other.expenses, expenses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(expenses));

@override
String toString() {
  return '_UiState(expenses: $expenses)';
}


}

/// @nodoc
abstract mixin class _$UiStateCopyWith<$Res>  {
  factory _$UiStateCopyWith(_UiState value, $Res Function(_UiState) _then) = __$UiStateCopyWithImpl;
@useResult
$Res call({
 List<Expense> expenses
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
@pragma('vm:prefer-inline') @override $Res call({Object? expenses = null,}) {
  return _then(_self.copyWith(
expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<Expense>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Expense> expenses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case __UiState() when $default != null:
return $default(_that.expenses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Expense> expenses)  $default,) {final _that = this;
switch (_that) {
case __UiState():
return $default(_that.expenses);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Expense> expenses)?  $default,) {final _that = this;
switch (_that) {
case __UiState() when $default != null:
return $default(_that.expenses);case _:
  return null;

}
}

}

/// @nodoc


class __UiState implements _UiState {
  const __UiState({required final  List<Expense> expenses}): _expenses = expenses;
  

 final  List<Expense> _expenses;
@override List<Expense> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}


/// Create a copy of _UiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$_UiStateCopyWith<__UiState> get copyWith => __$_UiStateCopyWithImpl<__UiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is __UiState&&const DeepCollectionEquality().equals(other._expenses, _expenses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_expenses));

@override
String toString() {
  return '_UiState(expenses: $expenses)';
}


}

/// @nodoc
abstract mixin class _$_UiStateCopyWith<$Res> implements _$UiStateCopyWith<$Res> {
  factory _$_UiStateCopyWith(__UiState value, $Res Function(__UiState) _then) = __$_UiStateCopyWithImpl;
@override @useResult
$Res call({
 List<Expense> expenses
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
@override @pragma('vm:prefer-inline') $Res call({Object? expenses = null,}) {
  return _then(__UiState(
expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<Expense>,
  ));
}


}

// dart format on
