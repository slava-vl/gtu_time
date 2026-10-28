// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScheduleEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScheduleEvent()';
}


}

/// @nodoc
class $ScheduleEventCopyWith<$Res>  {
$ScheduleEventCopyWith(ScheduleEvent _, $Res Function(ScheduleEvent) __);
}


/// Adds pattern-matching-related methods to [ScheduleEvent].
extension ScheduleEventPatterns on ScheduleEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RefreshEvent value)?  refresh,TResult Function( _ChangeTargetEvent value)?  changeTarget,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshEvent() when refresh != null:
return refresh(_that);case _ChangeTargetEvent() when changeTarget != null:
return changeTarget(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RefreshEvent value)  refresh,required TResult Function( _ChangeTargetEvent value)  changeTarget,}){
final _that = this;
switch (_that) {
case _RefreshEvent():
return refresh(_that);case _ChangeTargetEvent():
return changeTarget(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RefreshEvent value)?  refresh,TResult? Function( _ChangeTargetEvent value)?  changeTarget,}){
final _that = this;
switch (_that) {
case _RefreshEvent() when refresh != null:
return refresh(_that);case _ChangeTargetEvent() when changeTarget != null:
return changeTarget(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Completer<void>? completer)?  refresh,TResult Function( ScheduleTarget target)?  changeTarget,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshEvent() when refresh != null:
return refresh(_that.completer);case _ChangeTargetEvent() when changeTarget != null:
return changeTarget(_that.target);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Completer<void>? completer)  refresh,required TResult Function( ScheduleTarget target)  changeTarget,}) {final _that = this;
switch (_that) {
case _RefreshEvent():
return refresh(_that.completer);case _ChangeTargetEvent():
return changeTarget(_that.target);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Completer<void>? completer)?  refresh,TResult? Function( ScheduleTarget target)?  changeTarget,}) {final _that = this;
switch (_that) {
case _RefreshEvent() when refresh != null:
return refresh(_that.completer);case _ChangeTargetEvent() when changeTarget != null:
return changeTarget(_that.target);case _:
  return null;

}
}

}

/// @nodoc


class _RefreshEvent extends ScheduleEvent {
  const _RefreshEvent({this.completer}): super._();
  

 final  Completer<void>? completer;

/// Create a copy of ScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshEventCopyWith<_RefreshEvent> get copyWith => __$RefreshEventCopyWithImpl<_RefreshEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshEvent&&(identical(other.completer, completer) || other.completer == completer));
}


@override
int get hashCode {
    return Object.hash(runtimeType,completer);
}

@override
String toString() {
    return 'ScheduleEvent.refresh(completer: $completer)';
}


}

/// @nodoc
abstract mixin class _$RefreshEventCopyWith<$Res> implements $ScheduleEventCopyWith<$Res> {
  factory _$RefreshEventCopyWith(_RefreshEvent value, $Res Function(_RefreshEvent) _then) = __$RefreshEventCopyWithImpl;
@useResult
$Res call({
 Completer<void>? completer
});




}
/// @nodoc
class __$RefreshEventCopyWithImpl<$Res>
    implements _$RefreshEventCopyWith<$Res> {
  __$RefreshEventCopyWithImpl(this._self, this._then);

  final _RefreshEvent _self;
  final $Res Function(_RefreshEvent) _then;

/// Create a copy of ScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? completer = freezed,}) {
  return _then(_RefreshEvent(
completer: freezed == completer ? _self.completer : completer // ignore: cast_nullable_to_non_nullable
as Completer<void>?,
  ));
}


}

/// @nodoc


class _ChangeTargetEvent extends ScheduleEvent {
  const _ChangeTargetEvent(this.target): super._();
  

 final  ScheduleTarget target;

/// Create a copy of ScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeTargetEventCopyWith<_ChangeTargetEvent> get copyWith => __$ChangeTargetEventCopyWithImpl<_ChangeTargetEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeTargetEvent&&(identical(other.target, target) || other.target == target));
}


@override
int get hashCode {
    return Object.hash(runtimeType,target);
}

@override
String toString() {
    return 'ScheduleEvent.changeTarget(target: $target)';
}


}

/// @nodoc
abstract mixin class _$ChangeTargetEventCopyWith<$Res> implements $ScheduleEventCopyWith<$Res> {
  factory _$ChangeTargetEventCopyWith(_ChangeTargetEvent value, $Res Function(_ChangeTargetEvent) _then) = __$ChangeTargetEventCopyWithImpl;
@useResult
$Res call({
 ScheduleTarget target
});




}
/// @nodoc
class __$ChangeTargetEventCopyWithImpl<$Res>
    implements _$ChangeTargetEventCopyWith<$Res> {
  __$ChangeTargetEventCopyWithImpl(this._self, this._then);

  final _ChangeTargetEvent _self;
  final $Res Function(_ChangeTargetEvent) _then;

/// Create a copy of ScheduleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? target = null,}) {
  return _then(_ChangeTargetEvent(
null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as ScheduleTarget,
  ));
}


}

/// @nodoc
mixin _$ScheduleState {

 ScheduleResponse? get schedule; DateTime? get lastUpdate;
/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleStateCopyWith<ScheduleState> get copyWith => _$ScheduleStateCopyWithImpl<ScheduleState>(this as ScheduleState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ScheduleState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleState&&(identical(other.schedule, _this.schedule) || other.schedule == _this.schedule)&&(identical(other.lastUpdate, _this.lastUpdate) || other.lastUpdate == _this.lastUpdate));
}


@override
int get hashCode {
  final _this = this as ScheduleState;
  return Object.hash(runtimeType,_this.schedule,_this.lastUpdate);
}

@override
String toString() {
  final _this = this as ScheduleState;
  return 'ScheduleState(schedule: ${_this.schedule}, lastUpdate: ${_this.lastUpdate})';
}


}

/// @nodoc
abstract mixin class $ScheduleStateCopyWith<$Res>  {
  factory $ScheduleStateCopyWith(ScheduleState value, $Res Function(ScheduleState) _then) = _$ScheduleStateCopyWithImpl;
@useResult
$Res call({
 ScheduleResponse schedule, DateTime? lastUpdate
});




}
/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._self, this._then);

  final ScheduleState _self;
  final $Res Function(ScheduleState) _then;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schedule = null,Object? lastUpdate = freezed,}) {
  return _then(_self.copyWith(
schedule: null == schedule ? _self.schedule! : schedule // ignore: cast_nullable_to_non_nullable
as ScheduleResponse,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleState].
extension ScheduleStatePatterns on ScheduleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ProgressState value)?  progress,TResult Function( _SuccessState value)?  success,TResult Function( _ErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressState() when progress != null:
return progress(_that);case _SuccessState() when success != null:
return success(_that);case _ErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ProgressState value)  progress,required TResult Function( _SuccessState value)  success,required TResult Function( _ErrorState value)  error,}){
final _that = this;
switch (_that) {
case _ProgressState():
return progress(_that);case _SuccessState():
return success(_that);case _ErrorState():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ProgressState value)?  progress,TResult? Function( _SuccessState value)?  success,TResult? Function( _ErrorState value)?  error,}){
final _that = this;
switch (_that) {
case _ProgressState() when progress != null:
return progress(_that);case _SuccessState() when success != null:
return success(_that);case _ErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ScheduleResponse? schedule,  DateTime? lastUpdate)?  progress,TResult Function( ScheduleResponse schedule,  DateTime? lastUpdate)?  success,TResult Function( IErrorHandler error,  ScheduleResponse? schedule,  DateTime? lastUpdate)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressState() when progress != null:
return progress(_that.schedule,_that.lastUpdate);case _SuccessState() when success != null:
return success(_that.schedule,_that.lastUpdate);case _ErrorState() when error != null:
return error(_that.error,_that.schedule,_that.lastUpdate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ScheduleResponse? schedule,  DateTime? lastUpdate)  progress,required TResult Function( ScheduleResponse schedule,  DateTime? lastUpdate)  success,required TResult Function( IErrorHandler error,  ScheduleResponse? schedule,  DateTime? lastUpdate)  error,}) {final _that = this;
switch (_that) {
case _ProgressState():
return progress(_that.schedule,_that.lastUpdate);case _SuccessState():
return success(_that.schedule,_that.lastUpdate);case _ErrorState():
return error(_that.error,_that.schedule,_that.lastUpdate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ScheduleResponse? schedule,  DateTime? lastUpdate)?  progress,TResult? Function( ScheduleResponse schedule,  DateTime? lastUpdate)?  success,TResult? Function( IErrorHandler error,  ScheduleResponse? schedule,  DateTime? lastUpdate)?  error,}) {final _that = this;
switch (_that) {
case _ProgressState() when progress != null:
return progress(_that.schedule,_that.lastUpdate);case _SuccessState() when success != null:
return success(_that.schedule,_that.lastUpdate);case _ErrorState() when error != null:
return error(_that.error,_that.schedule,_that.lastUpdate);case _:
  return null;

}
}

}

/// @nodoc


class _ProgressState extends ScheduleState {
  const _ProgressState({this.schedule, this.lastUpdate}): super._();
  

@override final  ScheduleResponse? schedule;
@override final  DateTime? lastUpdate;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressStateCopyWith<_ProgressState> get copyWith => __$ProgressStateCopyWithImpl<_ProgressState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressState&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,schedule,lastUpdate);
}

@override
String toString() {
    return 'ScheduleState.progress(schedule: $schedule, lastUpdate: $lastUpdate)';
}


}

/// @nodoc
abstract mixin class _$ProgressStateCopyWith<$Res> implements $ScheduleStateCopyWith<$Res> {
  factory _$ProgressStateCopyWith(_ProgressState value, $Res Function(_ProgressState) _then) = __$ProgressStateCopyWithImpl;
@override @useResult
$Res call({
 ScheduleResponse? schedule, DateTime? lastUpdate
});




}
/// @nodoc
class __$ProgressStateCopyWithImpl<$Res>
    implements _$ProgressStateCopyWith<$Res> {
  __$ProgressStateCopyWithImpl(this._self, this._then);

  final _ProgressState _self;
  final $Res Function(_ProgressState) _then;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schedule = freezed,Object? lastUpdate = freezed,}) {
  return _then(_ProgressState(
schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as ScheduleResponse?,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class _SuccessState extends ScheduleState {
  const _SuccessState({required this.schedule, this.lastUpdate}): super._();
  

@override final  ScheduleResponse schedule;
@override final  DateTime? lastUpdate;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessStateCopyWith<_SuccessState> get copyWith => __$SuccessStateCopyWithImpl<_SuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessState&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,schedule,lastUpdate);
}

@override
String toString() {
    return 'ScheduleState.success(schedule: $schedule, lastUpdate: $lastUpdate)';
}


}

/// @nodoc
abstract mixin class _$SuccessStateCopyWith<$Res> implements $ScheduleStateCopyWith<$Res> {
  factory _$SuccessStateCopyWith(_SuccessState value, $Res Function(_SuccessState) _then) = __$SuccessStateCopyWithImpl;
@override @useResult
$Res call({
 ScheduleResponse schedule, DateTime? lastUpdate
});




}
/// @nodoc
class __$SuccessStateCopyWithImpl<$Res>
    implements _$SuccessStateCopyWith<$Res> {
  __$SuccessStateCopyWithImpl(this._self, this._then);

  final _SuccessState _self;
  final $Res Function(_SuccessState) _then;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schedule = null,Object? lastUpdate = freezed,}) {
  return _then(_SuccessState(
schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as ScheduleResponse,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class _ErrorState extends ScheduleState {
  const _ErrorState({required this.error, this.schedule, this.lastUpdate}): super._();
  

 final  IErrorHandler error;
@override final  ScheduleResponse? schedule;
@override final  DateTime? lastUpdate;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorStateCopyWith<_ErrorState> get copyWith => __$ErrorStateCopyWithImpl<_ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorState&&(identical(other.error, error) || other.error == error)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error,schedule,lastUpdate);
}

@override
String toString() {
    return 'ScheduleState.error(error: $error, schedule: $schedule, lastUpdate: $lastUpdate)';
}


}

/// @nodoc
abstract mixin class _$ErrorStateCopyWith<$Res> implements $ScheduleStateCopyWith<$Res> {
  factory _$ErrorStateCopyWith(_ErrorState value, $Res Function(_ErrorState) _then) = __$ErrorStateCopyWithImpl;
@override @useResult
$Res call({
 IErrorHandler error, ScheduleResponse? schedule, DateTime? lastUpdate
});




}
/// @nodoc
class __$ErrorStateCopyWithImpl<$Res>
    implements _$ErrorStateCopyWith<$Res> {
  __$ErrorStateCopyWithImpl(this._self, this._then);

  final _ErrorState _self;
  final $Res Function(_ErrorState) _then;

/// Create a copy of ScheduleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? schedule = freezed,Object? lastUpdate = freezed,}) {
  return _then(_ErrorState(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as IErrorHandler,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as ScheduleResponse?,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
