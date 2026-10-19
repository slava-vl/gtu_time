// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_control_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocalizationControlEvent implements DiagnosticableTreeMixin {

 LocaleEntity get locale;
/// Create a copy of LocalizationControlEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizationControlEventCopyWith<LocalizationControlEvent> get copyWith => _$LocalizationControlEventCopyWithImpl<LocalizationControlEvent>(this as LocalizationControlEvent, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as LocalizationControlEvent;
  properties
    ..add(DiagnosticsProperty('type', 'LocalizationControlEvent'))
    ..add(DiagnosticsProperty('locale', _this.locale));
}

@override
bool operator ==(Object other) {
  final _this = this as LocalizationControlEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizationControlEvent&&(identical(other.locale, _this.locale) || other.locale == _this.locale));
}


@override
int get hashCode {
  final _this = this as LocalizationControlEvent;
  return Object.hash(runtimeType,_this.locale);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as LocalizationControlEvent;
  return 'LocalizationControlEvent(locale: ${_this.locale})';
}


}

/// @nodoc
abstract mixin class $LocalizationControlEventCopyWith<$Res>  {
  factory $LocalizationControlEventCopyWith(LocalizationControlEvent value, $Res Function(LocalizationControlEvent) _then) = _$LocalizationControlEventCopyWithImpl;
@useResult
$Res call({
 LocaleEntity locale
});




}
/// @nodoc
class _$LocalizationControlEventCopyWithImpl<$Res>
    implements $LocalizationControlEventCopyWith<$Res> {
  _$LocalizationControlEventCopyWithImpl(this._self, this._then);

  final LocalizationControlEvent _self;
  final $Res Function(LocalizationControlEvent) _then;

/// Create a copy of LocalizationControlEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = null,}) {
  return _then(LocalizationControlEvent.changeLocalization(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as LocaleEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalizationControlEvent].
extension LocalizationControlEventPatterns on LocalizationControlEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ChangeLocalizationEvent value)?  changeLocalization,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeLocalizationEvent() when changeLocalization != null:
return changeLocalization(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ChangeLocalizationEvent value)  changeLocalization,}){
final _that = this;
switch (_that) {
case _ChangeLocalizationEvent():
return changeLocalization(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ChangeLocalizationEvent value)?  changeLocalization,}){
final _that = this;
switch (_that) {
case _ChangeLocalizationEvent() when changeLocalization != null:
return changeLocalization(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LocaleEntity locale)?  changeLocalization,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeLocalizationEvent() when changeLocalization != null:
return changeLocalization(_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LocaleEntity locale)  changeLocalization,}) {final _that = this;
switch (_that) {
case _ChangeLocalizationEvent():
return changeLocalization(_that.locale);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LocaleEntity locale)?  changeLocalization,}) {final _that = this;
switch (_that) {
case _ChangeLocalizationEvent() when changeLocalization != null:
return changeLocalization(_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class _ChangeLocalizationEvent with DiagnosticableTreeMixin implements LocalizationControlEvent {
  const _ChangeLocalizationEvent({required this.locale});
  

@override final  LocaleEntity locale;

/// Create a copy of LocalizationControlEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeLocalizationEventCopyWith<_ChangeLocalizationEvent> get copyWith => __$ChangeLocalizationEventCopyWithImpl<_ChangeLocalizationEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'LocalizationControlEvent.changeLocalization'))
    ..add(DiagnosticsProperty('locale', locale));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeLocalizationEvent&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode {
    return Object.hash(runtimeType,locale);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'LocalizationControlEvent.changeLocalization(locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$ChangeLocalizationEventCopyWith<$Res> implements $LocalizationControlEventCopyWith<$Res> {
  factory _$ChangeLocalizationEventCopyWith(_ChangeLocalizationEvent value, $Res Function(_ChangeLocalizationEvent) _then) = __$ChangeLocalizationEventCopyWithImpl;
@override @useResult
$Res call({
 LocaleEntity locale
});




}
/// @nodoc
class __$ChangeLocalizationEventCopyWithImpl<$Res>
    implements _$ChangeLocalizationEventCopyWith<$Res> {
  __$ChangeLocalizationEventCopyWithImpl(this._self, this._then);

  final _ChangeLocalizationEvent _self;
  final $Res Function(_ChangeLocalizationEvent) _then;

/// Create a copy of LocalizationControlEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(_ChangeLocalizationEvent(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as LocaleEntity,
  ));
}


}

/// @nodoc
mixin _$LocalizationControlState implements DiagnosticableTreeMixin {

 LocaleEntity get currentLocalization;
/// Create a copy of LocalizationControlState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizationControlStateCopyWith<LocalizationControlState> get copyWith => _$LocalizationControlStateCopyWithImpl<LocalizationControlState>(this as LocalizationControlState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as LocalizationControlState;
  properties
    ..add(DiagnosticsProperty('type', 'LocalizationControlState'))
    ..add(DiagnosticsProperty('currentLocalization', _this.currentLocalization));
}

@override
bool operator ==(Object other) {
  final _this = this as LocalizationControlState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizationControlState&&(identical(other.currentLocalization, _this.currentLocalization) || other.currentLocalization == _this.currentLocalization));
}


@override
int get hashCode {
  final _this = this as LocalizationControlState;
  return Object.hash(runtimeType,_this.currentLocalization);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as LocalizationControlState;
  return 'LocalizationControlState(currentLocalization: ${_this.currentLocalization})';
}


}

/// @nodoc
abstract mixin class $LocalizationControlStateCopyWith<$Res>  {
  factory $LocalizationControlStateCopyWith(LocalizationControlState value, $Res Function(LocalizationControlState) _then) = _$LocalizationControlStateCopyWithImpl;
@useResult
$Res call({
 LocaleEntity currentLocalization
});




}
/// @nodoc
class _$LocalizationControlStateCopyWithImpl<$Res>
    implements $LocalizationControlStateCopyWith<$Res> {
  _$LocalizationControlStateCopyWithImpl(this._self, this._then);

  final LocalizationControlState _self;
  final $Res Function(LocalizationControlState) _then;

/// Create a copy of LocalizationControlState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentLocalization = null,}) {
  return _then(LocalizationControlState(
currentLocalization: null == currentLocalization ? _self.currentLocalization : currentLocalization // ignore: cast_nullable_to_non_nullable
as LocaleEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalizationControlState].
extension LocalizationControlStatePatterns on LocalizationControlState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalizationControlState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalizationControlState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalizationControlState value)  $default,){
final _that = this;
switch (_that) {
case _LocalizationControlState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalizationControlState value)?  $default,){
final _that = this;
switch (_that) {
case _LocalizationControlState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LocaleEntity currentLocalization)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalizationControlState() when $default != null:
return $default(_that.currentLocalization);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LocaleEntity currentLocalization)  $default,) {final _that = this;
switch (_that) {
case _LocalizationControlState():
return $default(_that.currentLocalization);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LocaleEntity currentLocalization)?  $default,) {final _that = this;
switch (_that) {
case _LocalizationControlState() when $default != null:
return $default(_that.currentLocalization);case _:
  return null;

}
}

}

/// @nodoc


class _LocalizationControlState with DiagnosticableTreeMixin implements LocalizationControlState {
  const _LocalizationControlState({required this.currentLocalization});
  

@override final  LocaleEntity currentLocalization;

/// Create a copy of LocalizationControlState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizationControlStateCopyWith<_LocalizationControlState> get copyWith => __$LocalizationControlStateCopyWithImpl<_LocalizationControlState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'LocalizationControlState'))
    ..add(DiagnosticsProperty('currentLocalization', currentLocalization));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizationControlState&&(identical(other.currentLocalization, currentLocalization) || other.currentLocalization == currentLocalization));
}


@override
int get hashCode {
    return Object.hash(runtimeType,currentLocalization);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'LocalizationControlState(currentLocalization: $currentLocalization)';
}


}

/// @nodoc
abstract mixin class _$LocalizationControlStateCopyWith<$Res> implements $LocalizationControlStateCopyWith<$Res> {
  factory _$LocalizationControlStateCopyWith(_LocalizationControlState value, $Res Function(_LocalizationControlState) _then) = __$LocalizationControlStateCopyWithImpl;
@override @useResult
$Res call({
 LocaleEntity currentLocalization
});




}
/// @nodoc
class __$LocalizationControlStateCopyWithImpl<$Res>
    implements _$LocalizationControlStateCopyWith<$Res> {
  __$LocalizationControlStateCopyWithImpl(this._self, this._then);

  final _LocalizationControlState _self;
  final $Res Function(_LocalizationControlState) _then;

/// Create a copy of LocalizationControlState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentLocalization = null,}) {
  return _then(_LocalizationControlState(
currentLocalization: null == currentLocalization ? _self.currentLocalization : currentLocalization // ignore: cast_nullable_to_non_nullable
as LocaleEntity,
  ));
}


}

// dart format on
