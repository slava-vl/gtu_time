// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_control_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeControlState {

 CurrentTheme? get currentTheme;
/// Create a copy of ThemeControlState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeControlStateCopyWith<ThemeControlState> get copyWith => _$ThemeControlStateCopyWithImpl<ThemeControlState>(this as ThemeControlState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ThemeControlState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeControlState&&(identical(other.currentTheme, _this.currentTheme) || other.currentTheme == _this.currentTheme));
}


@override
int get hashCode {
  final _this = this as ThemeControlState;
  return Object.hash(runtimeType,_this.currentTheme);
}

@override
String toString() {
  final _this = this as ThemeControlState;
  return 'ThemeControlState(currentTheme: ${_this.currentTheme})';
}


}

/// @nodoc
abstract mixin class $ThemeControlStateCopyWith<$Res>  {
  factory $ThemeControlStateCopyWith(ThemeControlState value, $Res Function(ThemeControlState) _then) = _$ThemeControlStateCopyWithImpl;
@useResult
$Res call({
 CurrentTheme? currentTheme
});




}
/// @nodoc
class _$ThemeControlStateCopyWithImpl<$Res>
    implements $ThemeControlStateCopyWith<$Res> {
  _$ThemeControlStateCopyWithImpl(this._self, this._then);

  final ThemeControlState _self;
  final $Res Function(ThemeControlState) _then;

/// Create a copy of ThemeControlState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTheme = freezed,}) {
  return _then(ThemeControlState(
currentTheme: freezed == currentTheme ? _self.currentTheme : currentTheme // ignore: cast_nullable_to_non_nullable
as CurrentTheme?,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeControlState].
extension ThemeControlStatePatterns on ThemeControlState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeControlState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeControlState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeControlState value)  $default,){
final _that = this;
switch (_that) {
case _ThemeControlState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeControlState value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeControlState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CurrentTheme? currentTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeControlState() when $default != null:
return $default(_that.currentTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CurrentTheme? currentTheme)  $default,) {final _that = this;
switch (_that) {
case _ThemeControlState():
return $default(_that.currentTheme);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CurrentTheme? currentTheme)?  $default,) {final _that = this;
switch (_that) {
case _ThemeControlState() when $default != null:
return $default(_that.currentTheme);case _:
  return null;

}
}

}

/// @nodoc


class _ThemeControlState implements ThemeControlState {
  const _ThemeControlState({this.currentTheme});
  

@override final  CurrentTheme? currentTheme;

/// Create a copy of ThemeControlState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeControlStateCopyWith<_ThemeControlState> get copyWith => __$ThemeControlStateCopyWithImpl<_ThemeControlState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeControlState&&(identical(other.currentTheme, currentTheme) || other.currentTheme == currentTheme));
}


@override
int get hashCode {
    return Object.hash(runtimeType,currentTheme);
}

@override
String toString() {
    return 'ThemeControlState(currentTheme: $currentTheme)';
}


}

/// @nodoc
abstract mixin class _$ThemeControlStateCopyWith<$Res> implements $ThemeControlStateCopyWith<$Res> {
  factory _$ThemeControlStateCopyWith(_ThemeControlState value, $Res Function(_ThemeControlState) _then) = __$ThemeControlStateCopyWithImpl;
@override @useResult
$Res call({
 CurrentTheme? currentTheme
});




}
/// @nodoc
class __$ThemeControlStateCopyWithImpl<$Res>
    implements _$ThemeControlStateCopyWith<$Res> {
  __$ThemeControlStateCopyWithImpl(this._self, this._then);

  final _ThemeControlState _self;
  final $Res Function(_ThemeControlState) _then;

/// Create a copy of ThemeControlState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTheme = freezed,}) {
  return _then(_ThemeControlState(
currentTheme: freezed == currentTheme ? _self.currentTheme : currentTheme // ignore: cast_nullable_to_non_nullable
as CurrentTheme?,
  ));
}


}

/// @nodoc
mixin _$ThemeControlEvent {

 CurrentTheme? get themeMode;
/// Create a copy of ThemeControlEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeControlEventCopyWith<ThemeControlEvent> get copyWith => _$ThemeControlEventCopyWithImpl<ThemeControlEvent>(this as ThemeControlEvent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ThemeControlEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeControlEvent&&(identical(other.themeMode, _this.themeMode) || other.themeMode == _this.themeMode));
}


@override
int get hashCode {
  final _this = this as ThemeControlEvent;
  return Object.hash(runtimeType,_this.themeMode);
}

@override
String toString() {
  final _this = this as ThemeControlEvent;
  return 'ThemeControlEvent(themeMode: ${_this.themeMode})';
}


}

/// @nodoc
abstract mixin class $ThemeControlEventCopyWith<$Res>  {
  factory $ThemeControlEventCopyWith(ThemeControlEvent value, $Res Function(ThemeControlEvent) _then) = _$ThemeControlEventCopyWithImpl;
@useResult
$Res call({
 CurrentTheme? themeMode
});




}
/// @nodoc
class _$ThemeControlEventCopyWithImpl<$Res>
    implements $ThemeControlEventCopyWith<$Res> {
  _$ThemeControlEventCopyWithImpl(this._self, this._then);

  final ThemeControlEvent _self;
  final $Res Function(ThemeControlEvent) _then;

/// Create a copy of ThemeControlEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = freezed,}) {
  return _then(ThemeControlEvent.changeTheme(
freezed == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as CurrentTheme?,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeControlEvent].
extension ThemeControlEventPatterns on ThemeControlEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ChangeThemeEvent value)?  changeTheme,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeThemeEvent() when changeTheme != null:
return changeTheme(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ChangeThemeEvent value)  changeTheme,}){
final _that = this;
switch (_that) {
case _ChangeThemeEvent():
return changeTheme(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ChangeThemeEvent value)?  changeTheme,}){
final _that = this;
switch (_that) {
case _ChangeThemeEvent() when changeTheme != null:
return changeTheme(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CurrentTheme? themeMode)?  changeTheme,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeThemeEvent() when changeTheme != null:
return changeTheme(_that.themeMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CurrentTheme? themeMode)  changeTheme,}) {final _that = this;
switch (_that) {
case _ChangeThemeEvent():
return changeTheme(_that.themeMode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CurrentTheme? themeMode)?  changeTheme,}) {final _that = this;
switch (_that) {
case _ChangeThemeEvent() when changeTheme != null:
return changeTheme(_that.themeMode);case _:
  return null;

}
}

}

/// @nodoc


class _ChangeThemeEvent implements ThemeControlEvent {
  const _ChangeThemeEvent(this.themeMode);
  

@override final  CurrentTheme? themeMode;

/// Create a copy of ThemeControlEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeThemeEventCopyWith<_ChangeThemeEvent> get copyWith => __$ChangeThemeEventCopyWithImpl<_ChangeThemeEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeThemeEvent&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode {
    return Object.hash(runtimeType,themeMode);
}

@override
String toString() {
    return 'ThemeControlEvent.changeTheme(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$ChangeThemeEventCopyWith<$Res> implements $ThemeControlEventCopyWith<$Res> {
  factory _$ChangeThemeEventCopyWith(_ChangeThemeEvent value, $Res Function(_ChangeThemeEvent) _then) = __$ChangeThemeEventCopyWithImpl;
@override @useResult
$Res call({
 CurrentTheme? themeMode
});




}
/// @nodoc
class __$ChangeThemeEventCopyWithImpl<$Res>
    implements _$ChangeThemeEventCopyWith<$Res> {
  __$ChangeThemeEventCopyWithImpl(this._self, this._then);

  final _ChangeThemeEvent _self;
  final $Res Function(_ChangeThemeEvent) _then;

/// Create a copy of ThemeControlEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = freezed,}) {
  return _then(_ChangeThemeEvent(
freezed == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as CurrentTheme?,
  ));
}


}

// dart format on
