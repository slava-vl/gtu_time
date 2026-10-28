import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtu_time/core/error/error_handler.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/group.dart';
import 'package:gtu_time/feature/schedule_target/domain/repository/i_schedule_targets_repository.dart';

part 'groups_bloc.freezed.dart';

@freezed
sealed class GroupsEvent with _$GroupsEvent {
  const factory GroupsEvent.init() = _InitEvent;
  const factory GroupsEvent.load({Completer<void>? completer}) = _LoadEvent;
}

@freezed
sealed class GroupsState with _$GroupsState {
  const GroupsState._();

  const factory GroupsState.progress({List<Group>? groups}) = _Progress;
  const factory GroupsState.success({required List<Group> groups}) = _Success;
  const factory GroupsState.error({required IErrorHandler error, List<Group>? groups}) = _Error;

  bool get isProgress => this is _Progress;
  bool get isError => this is _Error;
  IErrorHandler? get error => this is _Error ? (this as _Error).error : null;
}

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final IScheduleTargetsRepository _repository;
  GroupsBloc(this._repository) : super(GroupsState.progress()) {
    on<GroupsEvent>(
      (event, emit) => event.map(init: (event) => _onInit(event, emit), load: (event) => _onLoad(event, emit)),
    );
  }

  bool _isInited = false;

  void _onInit(_InitEvent event, Emitter<GroupsState> emit) {
    if (_isInited) return;
    _isInited = true;
    add(GroupsEvent.load());
  }

  Future<void> _onLoad(_LoadEvent event, Emitter<GroupsState> emit) async {
    emit(GroupsState.progress(groups: state.groups));
    try {
      final groups = await _repository.fetchGroups();
      emit(GroupsState.success(groups: groups));
      event.completer?.complete();
    } on Object catch (e) {
      emit(GroupsState.error(groups: state.groups, error: e.toHandler()));
    }
  }
}
