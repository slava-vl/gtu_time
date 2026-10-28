// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_targets_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectedTargetsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedTargetsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SelectedTargetsEvent()';
}


}

/// @nodoc
class $SelectedTargetsEventCopyWith<$Res>  {
$SelectedTargetsEventCopyWith(SelectedTargetsEvent _, $Res Function(SelectedTargetsEvent) __);
}


/// Adds pattern-matching-related methods to [SelectedTargetsEvent].
extension SelectedTargetsEventPatterns on SelectedTargetsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AddTeacherEvent value)?  addTeacher,TResult Function( _AddGroupEvent value)?  addGroup,TResult Function( _ChangeSubgroupEvent value)?  changeSubgroup,TResult Function( _RemoveTargetEvent value)?  removeTarget,TResult Function( _ChangeIndexEvent value)?  changeIndex,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddTeacherEvent() when addTeacher != null:
return addTeacher(_that);case _AddGroupEvent() when addGroup != null:
return addGroup(_that);case _ChangeSubgroupEvent() when changeSubgroup != null:
return changeSubgroup(_that);case _RemoveTargetEvent() when removeTarget != null:
return removeTarget(_that);case _ChangeIndexEvent() when changeIndex != null:
return changeIndex(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AddTeacherEvent value)  addTeacher,required TResult Function( _AddGroupEvent value)  addGroup,required TResult Function( _ChangeSubgroupEvent value)  changeSubgroup,required TResult Function( _RemoveTargetEvent value)  removeTarget,required TResult Function( _ChangeIndexEvent value)  changeIndex,}){
final _that = this;
switch (_that) {
case _AddTeacherEvent():
return addTeacher(_that);case _AddGroupEvent():
return addGroup(_that);case _ChangeSubgroupEvent():
return changeSubgroup(_that);case _RemoveTargetEvent():
return removeTarget(_that);case _ChangeIndexEvent():
return changeIndex(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AddTeacherEvent value)?  addTeacher,TResult? Function( _AddGroupEvent value)?  addGroup,TResult? Function( _ChangeSubgroupEvent value)?  changeSubgroup,TResult? Function( _RemoveTargetEvent value)?  removeTarget,TResult? Function( _ChangeIndexEvent value)?  changeIndex,}){
final _that = this;
switch (_that) {
case _AddTeacherEvent() when addTeacher != null:
return addTeacher(_that);case _AddGroupEvent() when addGroup != null:
return addGroup(_that);case _ChangeSubgroupEvent() when changeSubgroup != null:
return changeSubgroup(_that);case _RemoveTargetEvent() when removeTarget != null:
return removeTarget(_that);case _ChangeIndexEvent() when changeIndex != null:
return changeIndex(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Teacher teacher)?  addTeacher,TResult Function( Group group)?  addGroup,TResult Function( String? subgroup)?  changeSubgroup,TResult Function( ScheduleTarget target)?  removeTarget,TResult Function( int index)?  changeIndex,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddTeacherEvent() when addTeacher != null:
return addTeacher(_that.teacher);case _AddGroupEvent() when addGroup != null:
return addGroup(_that.group);case _ChangeSubgroupEvent() when changeSubgroup != null:
return changeSubgroup(_that.subgroup);case _RemoveTargetEvent() when removeTarget != null:
return removeTarget(_that.target);case _ChangeIndexEvent() when changeIndex != null:
return changeIndex(_that.index);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Teacher teacher)  addTeacher,required TResult Function( Group group)  addGroup,required TResult Function( String? subgroup)  changeSubgroup,required TResult Function( ScheduleTarget target)  removeTarget,required TResult Function( int index)  changeIndex,}) {final _that = this;
switch (_that) {
case _AddTeacherEvent():
return addTeacher(_that.teacher);case _AddGroupEvent():
return addGroup(_that.group);case _ChangeSubgroupEvent():
return changeSubgroup(_that.subgroup);case _RemoveTargetEvent():
return removeTarget(_that.target);case _ChangeIndexEvent():
return changeIndex(_that.index);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Teacher teacher)?  addTeacher,TResult? Function( Group group)?  addGroup,TResult? Function( String? subgroup)?  changeSubgroup,TResult? Function( ScheduleTarget target)?  removeTarget,TResult? Function( int index)?  changeIndex,}) {final _that = this;
switch (_that) {
case _AddTeacherEvent() when addTeacher != null:
return addTeacher(_that.teacher);case _AddGroupEvent() when addGroup != null:
return addGroup(_that.group);case _ChangeSubgroupEvent() when changeSubgroup != null:
return changeSubgroup(_that.subgroup);case _RemoveTargetEvent() when removeTarget != null:
return removeTarget(_that.target);case _ChangeIndexEvent() when changeIndex != null:
return changeIndex(_that.index);case _:
  return null;

}
}

}

/// @nodoc


class _AddTeacherEvent extends SelectedTargetsEvent {
  const _AddTeacherEvent(this.teacher): super._();
  

 final  Teacher teacher;

/// Create a copy of SelectedTargetsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTeacherEventCopyWith<_AddTeacherEvent> get copyWith => __$AddTeacherEventCopyWithImpl<_AddTeacherEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTeacherEvent&&(identical(other.teacher, teacher) || other.teacher == teacher));
}


@override
int get hashCode {
    return Object.hash(runtimeType,teacher);
}

@override
String toString() {
    return 'SelectedTargetsEvent.addTeacher(teacher: $teacher)';
}


}

/// @nodoc
abstract mixin class _$AddTeacherEventCopyWith<$Res> implements $SelectedTargetsEventCopyWith<$Res> {
  factory _$AddTeacherEventCopyWith(_AddTeacherEvent value, $Res Function(_AddTeacherEvent) _then) = __$AddTeacherEventCopyWithImpl;
@useResult
$Res call({
 Teacher teacher
});




}
/// @nodoc
class __$AddTeacherEventCopyWithImpl<$Res>
    implements _$AddTeacherEventCopyWith<$Res> {
  __$AddTeacherEventCopyWithImpl(this._self, this._then);

  final _AddTeacherEvent _self;
  final $Res Function(_AddTeacherEvent) _then;

/// Create a copy of SelectedTargetsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? teacher = null,}) {
  return _then(_AddTeacherEvent(
null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as Teacher,
  ));
}


}

/// @nodoc


class _AddGroupEvent extends SelectedTargetsEvent {
  const _AddGroupEvent(this.group): super._();
  

 final  Group group;

/// Create a copy of SelectedTargetsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddGroupEventCopyWith<_AddGroupEvent> get copyWith => __$AddGroupEventCopyWithImpl<_AddGroupEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddGroupEvent&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode {
    return Object.hash(runtimeType,group);
}

@override
String toString() {
    return 'SelectedTargetsEvent.addGroup(group: $group)';
}


}

/// @nodoc
abstract mixin class _$AddGroupEventCopyWith<$Res> implements $SelectedTargetsEventCopyWith<$Res> {
  factory _$AddGroupEventCopyWith(_AddGroupEvent value, $Res Function(_AddGroupEvent) _then) = __$AddGroupEventCopyWithImpl;
@useResult
$Res call({
 Group group
});




}
/// @nodoc
class __$AddGroupEventCopyWithImpl<$Res>
    implements _$AddGroupEventCopyWith<$Res> {
  __$AddGroupEventCopyWithImpl(this._self, this._then);

  final _AddGroupEvent _self;
  final $Res Function(_AddGroupEvent) _then;

/// Create a copy of SelectedTargetsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? group = null,}) {
  return _then(_AddGroupEvent(
null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as Group,
  ));
}


}

/// @nodoc


class _ChangeSubgroupEvent extends SelectedTargetsEvent {
  const _ChangeSubgroupEvent(this.subgroup): super._();
  

 final  String? subgroup;

/// Create a copy of SelectedTargetsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeSubgroupEventCopyWith<_ChangeSubgroupEvent> get copyWith => __$ChangeSubgroupEventCopyWithImpl<_ChangeSubgroupEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeSubgroupEvent&&(identical(other.subgroup, subgroup) || other.subgroup == subgroup));
}


@override
int get hashCode {
    return Object.hash(runtimeType,subgroup);
}

@override
String toString() {
    return 'SelectedTargetsEvent.changeSubgroup(subgroup: $subgroup)';
}


}

/// @nodoc
abstract mixin class _$ChangeSubgroupEventCopyWith<$Res> implements $SelectedTargetsEventCopyWith<$Res> {
  factory _$ChangeSubgroupEventCopyWith(_ChangeSubgroupEvent value, $Res Function(_ChangeSubgroupEvent) _then) = __$ChangeSubgroupEventCopyWithImpl;
@useResult
$Res call({
 String? subgroup
});




}
/// @nodoc
class __$ChangeSubgroupEventCopyWithImpl<$Res>
    implements _$ChangeSubgroupEventCopyWith<$Res> {
  __$ChangeSubgroupEventCopyWithImpl(this._self, this._then);

  final _ChangeSubgroupEvent _self;
  final $Res Function(_ChangeSubgroupEvent) _then;

/// Create a copy of SelectedTargetsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subgroup = freezed,}) {
  return _then(_ChangeSubgroupEvent(
freezed == subgroup ? _self.subgroup : subgroup // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _RemoveTargetEvent extends SelectedTargetsEvent {
  const _RemoveTargetEvent(this.target): super._();
  

 final  ScheduleTarget target;

/// Create a copy of SelectedTargetsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveTargetEventCopyWith<_RemoveTargetEvent> get copyWith => __$RemoveTargetEventCopyWithImpl<_RemoveTargetEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveTargetEvent&&(identical(other.target, target) || other.target == target));
}


@override
int get hashCode {
    return Object.hash(runtimeType,target);
}

@override
String toString() {
    return 'SelectedTargetsEvent.removeTarget(target: $target)';
}


}

/// @nodoc
abstract mixin class _$RemoveTargetEventCopyWith<$Res> implements $SelectedTargetsEventCopyWith<$Res> {
  factory _$RemoveTargetEventCopyWith(_RemoveTargetEvent value, $Res Function(_RemoveTargetEvent) _then) = __$RemoveTargetEventCopyWithImpl;
@useResult
$Res call({
 ScheduleTarget target
});




}
/// @nodoc
class __$RemoveTargetEventCopyWithImpl<$Res>
    implements _$RemoveTargetEventCopyWith<$Res> {
  __$RemoveTargetEventCopyWithImpl(this._self, this._then);

  final _RemoveTargetEvent _self;
  final $Res Function(_RemoveTargetEvent) _then;

/// Create a copy of SelectedTargetsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? target = null,}) {
  return _then(_RemoveTargetEvent(
null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as ScheduleTarget,
  ));
}


}

/// @nodoc


class _ChangeIndexEvent extends SelectedTargetsEvent {
  const _ChangeIndexEvent(this.index): super._();
  

 final  int index;

/// Create a copy of SelectedTargetsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeIndexEventCopyWith<_ChangeIndexEvent> get copyWith => __$ChangeIndexEventCopyWithImpl<_ChangeIndexEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeIndexEvent&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode {
    return Object.hash(runtimeType,index);
}

@override
String toString() {
    return 'SelectedTargetsEvent.changeIndex(index: $index)';
}


}

/// @nodoc
abstract mixin class _$ChangeIndexEventCopyWith<$Res> implements $SelectedTargetsEventCopyWith<$Res> {
  factory _$ChangeIndexEventCopyWith(_ChangeIndexEvent value, $Res Function(_ChangeIndexEvent) _then) = __$ChangeIndexEventCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$ChangeIndexEventCopyWithImpl<$Res>
    implements _$ChangeIndexEventCopyWith<$Res> {
  __$ChangeIndexEventCopyWithImpl(this._self, this._then);

  final _ChangeIndexEvent _self;
  final $Res Function(_ChangeIndexEvent) _then;

/// Create a copy of SelectedTargetsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_ChangeIndexEvent(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
