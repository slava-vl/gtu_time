// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'groups_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GroupsEvent {

 Completer<void>? get completer;
/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupsEventCopyWith<GroupsEvent> get copyWith => _$GroupsEventCopyWithImpl<GroupsEvent>(this as GroupsEvent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GroupsEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupsEvent&&(identical(other.completer, _this.completer) || other.completer == _this.completer));
}


@override
int get hashCode {
  final _this = this as GroupsEvent;
  return Object.hash(runtimeType,_this.completer);
}

@override
String toString() {
  final _this = this as GroupsEvent;
  return 'GroupsEvent(completer: ${_this.completer})';
}


}

/// @nodoc
abstract mixin class $GroupsEventCopyWith<$Res>  {
  factory $GroupsEventCopyWith(GroupsEvent value, $Res Function(GroupsEvent) _then) = _$GroupsEventCopyWithImpl;
@useResult
$Res call({
 Completer<void>? completer
});




}
/// @nodoc
class _$GroupsEventCopyWithImpl<$Res>
    implements $GroupsEventCopyWith<$Res> {
  _$GroupsEventCopyWithImpl(this._self, this._then);

  final GroupsEvent _self;
  final $Res Function(GroupsEvent) _then;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completer = freezed,}) {
  return _then(GroupsEvent.load(
completer: freezed == completer ? _self.completer : completer // ignore: cast_nullable_to_non_nullable
as Completer<void>?,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupsEvent].
extension GroupsEventPatterns on GroupsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadEvent value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadEvent() when load != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadEvent value)  load,}){
final _that = this;
switch (_that) {
case _LoadEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadEvent value)?  load,}){
final _that = this;
switch (_that) {
case _LoadEvent() when load != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Completer<void>? completer)?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadEvent() when load != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Completer<void>? completer)  load,}) {final _that = this;
switch (_that) {
case _LoadEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Completer<void>? completer)?  load,}) {final _that = this;
switch (_that) {
case _LoadEvent() when load != null:
return load(_that.completer);case _:
  return null;

}
}

}

/// @nodoc


class _LoadEvent implements GroupsEvent {
  const _LoadEvent({this.completer});
  

@override final  Completer<void>? completer;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'GroupsEvent.load(completer: $completer)';
}


}

/// @nodoc
abstract mixin class _$LoadEventCopyWith<$Res> implements $GroupsEventCopyWith<$Res> {
  factory _$LoadEventCopyWith(_LoadEvent value, $Res Function(_LoadEvent) _then) = __$LoadEventCopyWithImpl;
@override @useResult
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

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completer = freezed,}) {
  return _then(_LoadEvent(
completer: freezed == completer ? _self.completer : completer // ignore: cast_nullable_to_non_nullable
as Completer<void>?,
  ));
}


}

/// @nodoc
mixin _$GroupsState {

 List<Group>? get groups;
/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupsStateCopyWith<GroupsState> get copyWith => _$GroupsStateCopyWithImpl<GroupsState>(this as GroupsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GroupsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupsState&&const DeepCollectionEquality().equals(other.groups, _this.groups));
}


@override
int get hashCode {
  final _this = this as GroupsState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.groups));
}

@override
String toString() {
  final _this = this as GroupsState;
  return 'GroupsState(groups: ${_this.groups})';
}


}

/// @nodoc
abstract mixin class $GroupsStateCopyWith<$Res>  {
  factory $GroupsStateCopyWith(GroupsState value, $Res Function(GroupsState) _then) = _$GroupsStateCopyWithImpl;
@useResult
$Res call({
 List<Group> groups
});




}
/// @nodoc
class _$GroupsStateCopyWithImpl<$Res>
    implements $GroupsStateCopyWith<$Res> {
  _$GroupsStateCopyWithImpl(this._self, this._then);

  final GroupsState _self;
  final $Res Function(GroupsState) _then;

/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groups = null,}) {
  return _then(_self.copyWith(
groups: null == groups ? _self.groups! : groups // ignore: cast_nullable_to_non_nullable
as List<Group>,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupsState].
extension GroupsStatePatterns on GroupsState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Group>? groups)?  progress,TResult Function( List<Group> groups)?  success,TResult Function( IErrorHandler error,  List<Group>? groups)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Progress() when progress != null:
return progress(_that.groups);case _Success() when success != null:
return success(_that.groups);case _Error() when error != null:
return error(_that.error,_that.groups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Group>? groups)  progress,required TResult Function( List<Group> groups)  success,required TResult Function( IErrorHandler error,  List<Group>? groups)  error,}) {final _that = this;
switch (_that) {
case _Progress():
return progress(_that.groups);case _Success():
return success(_that.groups);case _Error():
return error(_that.error,_that.groups);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Group>? groups)?  progress,TResult? Function( List<Group> groups)?  success,TResult? Function( IErrorHandler error,  List<Group>? groups)?  error,}) {final _that = this;
switch (_that) {
case _Progress() when progress != null:
return progress(_that.groups);case _Success() when success != null:
return success(_that.groups);case _Error() when error != null:
return error(_that.error,_that.groups);case _:
  return null;

}
}

}

/// @nodoc


class _Progress extends GroupsState {
  const _Progress({ List<Group>? groups}): _groups = groups,super._();
  

 final  List<Group>? _groups;
@override List<Group>? get groups {
  final value = _groups;
  if (value == null) return null;
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressCopyWith<_Progress> get copyWith => __$ProgressCopyWithImpl<_Progress>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Progress&&const DeepCollectionEquality().equals(other.groups, _groups));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_groups));
}

@override
String toString() {
    return 'GroupsState.progress(groups: $groups)';
}


}

/// @nodoc
abstract mixin class _$ProgressCopyWith<$Res> implements $GroupsStateCopyWith<$Res> {
  factory _$ProgressCopyWith(_Progress value, $Res Function(_Progress) _then) = __$ProgressCopyWithImpl;
@override @useResult
$Res call({
 List<Group>? groups
});




}
/// @nodoc
class __$ProgressCopyWithImpl<$Res>
    implements _$ProgressCopyWith<$Res> {
  __$ProgressCopyWithImpl(this._self, this._then);

  final _Progress _self;
  final $Res Function(_Progress) _then;

/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groups = freezed,}) {
  return _then(_Progress(
groups: freezed == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<Group>?,
  ));
}


}

/// @nodoc


class _Success extends GroupsState {
  const _Success({required  List<Group> groups}): _groups = groups,super._();
  

 final  List<Group> _groups;
@override List<Group> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}


/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other.groups, _groups));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_groups));
}

@override
String toString() {
    return 'GroupsState.success(groups: $groups)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $GroupsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@override @useResult
$Res call({
 List<Group> groups
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groups = null,}) {
  return _then(_Success(
groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<Group>,
  ));
}


}

/// @nodoc


class _Error extends GroupsState {
  const _Error({required this.error,  List<Group>? groups}): _groups = groups,super._();
  

 final  IErrorHandler error;
 final  List<Group>? _groups;
@override List<Group>? get groups {
  final value = _groups;
  if (value == null) return null;
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.groups, _groups));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error,const DeepCollectionEquality().hash(_groups));
}

@override
String toString() {
    return 'GroupsState.error(error: $error, groups: $groups)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $GroupsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 IErrorHandler error, List<Group>? groups
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? groups = freezed,}) {
  return _then(_Error(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as IErrorHandler,groups: freezed == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<Group>?,
  ));
}


}

// dart format on
