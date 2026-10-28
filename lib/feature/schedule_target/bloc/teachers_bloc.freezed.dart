// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teachers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeachersEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TeachersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TeachersEvent()';
}


}

/// @nodoc
class $TeachersEventCopyWith<$Res>  {
$TeachersEventCopyWith(TeachersEvent _, $Res Function(TeachersEvent) __);
}


/// Adds pattern-matching-related methods to [TeachersEvent].
extension TeachersEventPatterns on TeachersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitEvent value)?  init,TResult Function( _LoadEvent value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitEvent() when init != null:
return init(_that);case _LoadEvent() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitEvent value)  init,required TResult Function( _LoadEvent value)  load,}){
final _that = this;
switch (_that) {
case _InitEvent():
return init(_that);case _LoadEvent():
return load(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitEvent value)?  init,TResult? Function( _LoadEvent value)?  load,}){
final _that = this;
switch (_that) {
case _InitEvent() when init != null:
return init(_that);case _LoadEvent() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( Completer<void>? completer)?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitEvent() when init != null:
return init();case _LoadEvent() when load != null:
return load(_that.completer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( Completer<void>? completer)  load,}) {final _that = this;
switch (_that) {
case _InitEvent():
return init();case _LoadEvent():
return load(_that.completer);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( Completer<void>? completer)?  load,}) {final _that = this;
switch (_that) {
case _InitEvent() when init != null:
return init();case _LoadEvent() when load != null:
return load(_that.completer);case _:
  return null;

}
}

}

/// @nodoc


class _InitEvent implements TeachersEvent {
  const _InitEvent();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TeachersEvent.init()';
}


}




/// @nodoc


class _LoadEvent implements TeachersEvent {
  const _LoadEvent({this.completer});
  

 final  Completer<void>? completer;

/// Create a copy of TeachersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadEventCopyWith<_LoadEvent> get copyWith => __$LoadEventCopyWithImpl<_LoadEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadEvent&&(identical(other.completer, completer) || other.completer == completer));
}


@override
int get hashCode {
    return Object.hash(runtimeType,completer);
}

@override
String toString() {
    return 'TeachersEvent.load(completer: $completer)';
}


}

/// @nodoc
abstract mixin class _$LoadEventCopyWith<$Res> implements $TeachersEventCopyWith<$Res> {
  factory _$LoadEventCopyWith(_LoadEvent value, $Res Function(_LoadEvent) _then) = __$LoadEventCopyWithImpl;
@useResult
$Res call({
 Completer<void>? completer
});




}
/// @nodoc
class __$LoadEventCopyWithImpl<$Res>
    implements _$LoadEventCopyWith<$Res> {
  __$LoadEventCopyWithImpl(this._self, this._then);

  final _LoadEvent _self;
  final $Res Function(_LoadEvent) _then;

/// Create a copy of TeachersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? completer = freezed,}) {
  return _then(_LoadEvent(
completer: freezed == completer ? _self.completer : completer // ignore: cast_nullable_to_non_nullable
as Completer<void>?,
  ));
}


}

/// @nodoc
mixin _$TeachersState {

 List<Teacher>? get teachers;
/// Create a copy of TeachersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeachersStateCopyWith<TeachersState> get copyWith => _$TeachersStateCopyWithImpl<TeachersState>(this as TeachersState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TeachersState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeachersState&&const DeepCollectionEquality().equals(other.teachers, _this.teachers));
}


@override
int get hashCode {
  final _this = this as TeachersState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.teachers));
}

@override
String toString() {
  final _this = this as TeachersState;
  return 'TeachersState(teachers: ${_this.teachers})';
}


}

/// @nodoc
abstract mixin class $TeachersStateCopyWith<$Res>  {
  factory $TeachersStateCopyWith(TeachersState value, $Res Function(TeachersState) _then) = _$TeachersStateCopyWithImpl;
@useResult
$Res call({
 List<Teacher> teachers
});




}
/// @nodoc
class _$TeachersStateCopyWithImpl<$Res>
    implements $TeachersStateCopyWith<$Res> {
  _$TeachersStateCopyWithImpl(this._self, this._then);

  final TeachersState _self;
  final $Res Function(TeachersState) _then;

/// Create a copy of TeachersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teachers = null,}) {
  return _then(_self.copyWith(
teachers: null == teachers ? _self.teachers! : teachers // ignore: cast_nullable_to_non_nullable
as List<Teacher>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeachersState].
extension TeachersStatePatterns on TeachersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Progress value)?  progress,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Progress() when progress != null:
return progress(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Progress value)  progress,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Progress():
return progress(_that);case _Success():
return success(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Progress value)?  progress,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Progress() when progress != null:
return progress(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Teacher>? teachers)?  progress,TResult Function( List<Teacher> teachers)?  success,TResult Function( IErrorHandler error,  List<Teacher>? teachers)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Progress() when progress != null:
return progress(_that.teachers);case _Success() when success != null:
return success(_that.teachers);case _Error() when error != null:
return error(_that.error,_that.teachers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Teacher>? teachers)  progress,required TResult Function( List<Teacher> teachers)  success,required TResult Function( IErrorHandler error,  List<Teacher>? teachers)  error,}) {final _that = this;
switch (_that) {
case _Progress():
return progress(_that.teachers);case _Success():
return success(_that.teachers);case _Error():
return error(_that.error,_that.teachers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Teacher>? teachers)?  progress,TResult? Function( List<Teacher> teachers)?  success,TResult? Function( IErrorHandler error,  List<Teacher>? teachers)?  error,}) {final _that = this;
switch (_that) {
case _Progress() when progress != null:
return progress(_that.teachers);case _Success() when success != null:
return success(_that.teachers);case _Error() when error != null:
return error(_that.error,_that.teachers);case _:
  return null;

}
}

}

/// @nodoc


class _Progress extends TeachersState {
  const _Progress({ List<Teacher>? teachers}): _teachers = teachers,super._();
  

 final  List<Teacher>? _teachers;
@override List<Teacher>? get teachers {
  final value = _teachers;
  if (value == null) return null;
  if (_teachers is EqualUnmodifiableListView) return _teachers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TeachersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressCopyWith<_Progress> get copyWith => __$ProgressCopyWithImpl<_Progress>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Progress&&const DeepCollectionEquality().equals(other.teachers, _teachers));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_teachers));
}

@override
String toString() {
    return 'TeachersState.progress(teachers: $teachers)';
}


}

/// @nodoc
abstract mixin class _$ProgressCopyWith<$Res> implements $TeachersStateCopyWith<$Res> {
  factory _$ProgressCopyWith(_Progress value, $Res Function(_Progress) _then) = __$ProgressCopyWithImpl;
@override @useResult
$Res call({
 List<Teacher>? teachers
});




}
/// @nodoc
class __$ProgressCopyWithImpl<$Res>
    implements _$ProgressCopyWith<$Res> {
  __$ProgressCopyWithImpl(this._self, this._then);

  final _Progress _self;
  final $Res Function(_Progress) _then;

/// Create a copy of TeachersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teachers = freezed,}) {
  return _then(_Progress(
teachers: freezed == teachers ? _self._teachers : teachers // ignore: cast_nullable_to_non_nullable
as List<Teacher>?,
  ));
}


}

/// @nodoc


class _Success extends TeachersState {
  const _Success({required  List<Teacher> teachers}): _teachers = teachers,super._();
  

 final  List<Teacher> _teachers;
@override List<Teacher> get teachers {
  if (_teachers is EqualUnmodifiableListView) return _teachers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teachers);
}


/// Create a copy of TeachersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other.teachers, _teachers));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_teachers));
}

@override
String toString() {
    return 'TeachersState.success(teachers: $teachers)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $TeachersStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@override @useResult
$Res call({
 List<Teacher> teachers
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of TeachersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teachers = null,}) {
  return _then(_Success(
teachers: null == teachers ? _self._teachers : teachers // ignore: cast_nullable_to_non_nullable
as List<Teacher>,
  ));
}


}

/// @nodoc


class _Error extends TeachersState {
  const _Error({required this.error,  List<Teacher>? teachers}): _teachers = teachers,super._();
  

 final  IErrorHandler error;
 final  List<Teacher>? _teachers;
@override List<Teacher>? get teachers {
  final value = _teachers;
  if (value == null) return null;
  if (_teachers is EqualUnmodifiableListView) return _teachers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TeachersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.teachers, _teachers));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error,const DeepCollectionEquality().hash(_teachers));
}

@override
String toString() {
    return 'TeachersState.error(error: $error, teachers: $teachers)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $TeachersStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 IErrorHandler error, List<Teacher>? teachers
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of TeachersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? teachers = freezed,}) {
  return _then(_Error(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as IErrorHandler,teachers: freezed == teachers ? _self._teachers : teachers // ignore: cast_nullable_to_non_nullable
as List<Teacher>?,
  ));
}


}

// dart format on
