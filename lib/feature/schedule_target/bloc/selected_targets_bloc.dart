import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:gtu_time/feature/schedule_target/domain/entity/group.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/schedule_target.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/schedule_target_type.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/teacher.dart';
import 'package:gtu_time/feature/schedule_target/domain/repository/i_selected_targets_repository.dart';

part 'selected_targets_bloc.freezed.dart';

@freezed
sealed class SelectedTargetsEvent with _$SelectedTargetsEvent {
  const SelectedTargetsEvent._();

  const factory SelectedTargetsEvent.addTeacher(Teacher teacher) = _AddTeacherEvent;
  const factory SelectedTargetsEvent.addGroup(Group group) = _AddGroupEvent;
  const factory SelectedTargetsEvent.changeSubgroup(String? subgroup) = _ChangeSubgroupEvent;
  const factory SelectedTargetsEvent.removeTarget(ScheduleTarget target) = _RemoveTargetEvent;
  const factory SelectedTargetsEvent.changeIndex(int index) = _ChangeIndexEvent;
}

class SelectedTargetsState extends Equatable {
  final List<ScheduleTarget> targets;
  final int? selectedIndex;

  const SelectedTargetsState({required this.targets, required this.selectedIndex});

  ScheduleTarget? get selectedTarget => selectedIndex == null || targets.isEmpty ? null : targets[selectedIndex!];

  @override
  List<Object?> get props => [targets, selectedIndex];

  SelectedTargetsState copyWith({List<ScheduleTarget>? targets, int? selectedIndex}) =>
      SelectedTargetsState(targets: targets ?? this.targets, selectedIndex: selectedIndex ?? this.selectedIndex);
}

class SelectedTargetsBloc extends Bloc<SelectedTargetsEvent, SelectedTargetsState> {
  final ISelectedTargetsRepository _repository;

  SelectedTargetsBloc(this._repository)
    : super(SelectedTargetsState(targets: _repository.targets, selectedIndex: _repository.selectedIndex)) {
    on<SelectedTargetsEvent>(
      (event, emit) => event.map(
        addGroup: (event) => _onAddGroup(event, emit),
        changeSubgroup: (event) => _onChangeSubgroup(event, emit),
        addTeacher: (event) => _onAddTeacher(event, emit),
        removeTarget: (event) => _onRemoveTarget(event, emit),
        changeIndex: (event) => _onChangeIndex(event, emit),
      ),
    );
  }

  void _onAddGroup(_AddGroupEvent event, Emitter<SelectedTargetsState> emit) {
    final newTargets = List<ScheduleTarget>.from(state.targets)
      ..insert(0, ScheduleTarget(type: ScheduleTargetType.group, group: event.group));

    _repository.saveTargets(newTargets);
    emit(state.copyWith(targets: newTargets));
    add(SelectedTargetsEvent.changeIndex(0));
  }

  void _onChangeSubgroup(_ChangeSubgroupEvent event, Emitter<SelectedTargetsState> emit) {
    final newTargets = state.targets.map((target) {
      if (target == state.selectedTarget) {
        return ScheduleTarget(
          type: target.type,
          group: target.group,
          teacher: target.teacher,
          subgroup: event.subgroup,
        );
      }
      return target;
    }).toList();

    _repository.saveTargets(newTargets);
    emit(state.copyWith(targets: newTargets));
  }

  void _onAddTeacher(_AddTeacherEvent event, Emitter<SelectedTargetsState> emit) {
    final newTargets = List<ScheduleTarget>.from(state.targets)
      ..insert(0, ScheduleTarget(type: ScheduleTargetType.teacher, teacher: event.teacher));

    _repository.saveTargets(newTargets);
    emit(state.copyWith(targets: newTargets));
    add(SelectedTargetsEvent.changeIndex(0));
  }

  void _onRemoveTarget(_RemoveTargetEvent event, Emitter<SelectedTargetsState> emit) {
    final indexToRemove = state.targets.indexOf(event.target);
    final newTargets = List<ScheduleTarget>.from(state.targets)..remove(event.target);

    var newIndex = state.selectedIndex;

    if (newTargets.isEmpty) {
      newIndex = null;
    } else if (indexToRemove != -1 && newIndex != null) {
      if (indexToRemove < newIndex) {
        newIndex = newIndex - 1;
      } else if (indexToRemove == newIndex) {
        if (newIndex >= newTargets.length) {
          newIndex = newTargets.length - 1;
        }
      }
    }

    _repository
      ..saveTargets(newTargets)
      ..saveSelectedIndex(newIndex);

    emit(state.copyWith(targets: newTargets, selectedIndex: newIndex));
  }

  void _onChangeIndex(_ChangeIndexEvent event, Emitter<SelectedTargetsState> emit) {
    _repository.saveSelectedIndex(event.index);
    emit(state.copyWith(selectedIndex: event.index));
  }
}
