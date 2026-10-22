// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_group_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectedGroupEvent {

 Object get newValue;



@override
bool operator ==(Object other) {
  final _this = this as SelectedGroupEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedGroupEvent&&const DeepCollectionEquality().equals(other.newValue, _this.newValue));
}


@override
int get hashCode {
  final _this = this as SelectedGroupEvent;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.newValue));
}

@override
String toString() {
  final _this = this as SelectedGroupEvent;
  return 'SelectedGroupEvent(newValue: ${_this.newValue})';
}


}

/// @nodoc
class $SelectedGroupEventCopyWith<$Res>  {
$SelectedGroupEventCopyWith(SelectedGroupEvent _, $Res Function(SelectedGroupEvent) __);
}


/// Adds pattern-matching-related methods to [SelectedGroupEvent].
extension SelectedGroupEventPatterns on SelectedGroupEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ChangeEvent value)?  change,TResult Function( _ChangeSubgroupEvent value)?  changeSubgroup,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeEvent() when change != null:
return change(_that);case _ChangeSubgroupEvent() when changeSubgroup != null:
return changeSubgroup(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ChangeEvent value)  change,required TResult Function( _ChangeSubgroupEvent value)  changeSubgroup,}){
final _that = this;
switch (_that) {
case _ChangeEvent():
return change(_that);case _ChangeSubgroupEvent():
return changeSubgroup(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ChangeEvent value)?  change,TResult? Function( _ChangeSubgroupEvent value)?  changeSubgroup,}){
final _that = this;
switch (_that) {
case _ChangeEvent() when change != null:
return change(_that);case _ChangeSubgroupEvent() when changeSubgroup != null:
return changeSubgroup(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Group newValue)?  change,TResult Function( String newValue)?  changeSubgroup,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeEvent() when change != null:
return change(_that.newValue);case _ChangeSubgroupEvent() when changeSubgroup != null:
return changeSubgroup(_that.newValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Group newValue)  change,required TResult Function( String newValue)  changeSubgroup,}) {final _that = this;
switch (_that) {
case _ChangeEvent():
return change(_that.newValue);case _ChangeSubgroupEvent():
return changeSubgroup(_that.newValue);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Group newValue)?  change,TResult? Function( String newValue)?  changeSubgroup,}) {final _that = this;
switch (_that) {
case _ChangeEvent() when change != null:
return change(_that.newValue);case _ChangeSubgroupEvent() when changeSubgroup != null:
return changeSubgroup(_that.newValue);case _:
  return null;

}
}

}

/// @nodoc


class _ChangeEvent extends SelectedGroupEvent {
  const _ChangeEvent(this.newValue): super._();
  

@override final  Group newValue;

/// Create a copy of SelectedGroupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeEventCopyWith<_ChangeEvent> get copyWith => __$ChangeEventCopyWithImpl<_ChangeEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeEvent&&(identical(other.newValue, newValue) || other.newValue == newValue));
}


@override
int get hashCode {
    return Object.hash(runtimeType,newValue);
}

@override
String toString() {
    return 'SelectedGroupEvent.change(newValue: $newValue)';
}


}

/// @nodoc
abstract mixin class _$ChangeEventCopyWith<$Res> implements $SelectedGroupEventCopyWith<$Res> {
  factory _$ChangeEventCopyWith(_ChangeEvent value, $Res Function(_ChangeEvent) _then) = __$ChangeEventCopyWithImpl;
@useResult
$Res call({
 Group newValue
});




}
/// @nodoc
class __$ChangeEventCopyWithImpl<$Res>
    implements _$ChangeEventCopyWith<$Res> {
  __$ChangeEventCopyWithImpl(this._self, this._then);

  final _ChangeEvent _self;
  final $Res Function(_ChangeEvent) _then;

/// Create a copy of SelectedGroupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newValue = null,}) {
  return _then(_ChangeEvent(
null == newValue ? _self.newValue : newValue // ignore: cast_nullable_to_non_nullable
as Group,
  ));
}


}

/// @nodoc


class _ChangeSubgroupEvent extends SelectedGroupEvent {
  const _ChangeSubgroupEvent(this.newValue): super._();
  

@override final  String newValue;

/// Create a copy of SelectedGroupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeSubgroupEventCopyWith<_ChangeSubgroupEvent> get copyWith => __$ChangeSubgroupEventCopyWithImpl<_ChangeSubgroupEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeSubgroupEvent&&(identical(other.newValue, newValue) || other.newValue == newValue));
}


@override
int get hashCode {
    return Object.hash(runtimeType,newValue);
}

@override
String toString() {
    return 'SelectedGroupEvent.changeSubgroup(newValue: $newValue)';
}


}

/// @nodoc
abstract mixin class _$ChangeSubgroupEventCopyWith<$Res> implements $SelectedGroupEventCopyWith<$Res> {
  factory _$ChangeSubgroupEventCopyWith(_ChangeSubgroupEvent value, $Res Function(_ChangeSubgroupEvent) _then) = __$ChangeSubgroupEventCopyWithImpl;
@useResult
$Res call({
 String newValue
});




}
/// @nodoc
class __$ChangeSubgroupEventCopyWithImpl<$Res>
    implements _$ChangeSubgroupEventCopyWith<$Res> {
  __$ChangeSubgroupEventCopyWithImpl(this._self, this._then);

  final _ChangeSubgroupEvent _self;
  final $Res Function(_ChangeSubgroupEvent) _then;

/// Create a copy of SelectedGroupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newValue = null,}) {
  return _then(_ChangeSubgroupEvent(
null == newValue ? _self.newValue : newValue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
