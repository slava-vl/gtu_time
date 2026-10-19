import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtu_time/feature/group/domain/repository/i_selected_group_repository.dart';

part 'selected_group_bloc.freezed.dart';

@freezed
sealed class SelectedGroupEvent with _$SelectedGroupEvent {
  const SelectedGroupEvent._();

  const factory SelectedGroupEvent.change(String newValue) = _ChangeEvent;
  const factory SelectedGroupEvent.changeSubgroup(String newValue) = _ChangeSubgroupEvent;
}

class SelectedGroupState extends Equatable {
  final String? selectedGroup;
  final String? selectedSubgroup;
  const SelectedGroupState({this.selectedGroup, this.selectedSubgroup});

  @override
  List<Object?> get props => [selectedGroup, selectedSubgroup];
}

class SelectedGroupBloc extends Bloc<SelectedGroupEvent, SelectedGroupState> {
  final ISelectedGroupRepository _repository;
  SelectedGroupBloc(this._repository)
    : super(
        SelectedGroupState(selectedGroup: _repository.selectedGroup, selectedSubgroup: _repository.selectedSubgroup),
      ) {
    on<SelectedGroupEvent>(
      (event, emit) => event.map(
        change: (event) => _onChange(event, emit),
        changeSubgroup: (event) => _onChangeSubgroup(event, emit),
      ),
    );
  }

  Future<void> _onChange(_ChangeEvent event, Emitter<SelectedGroupState> emit) async {
    unawaited(_repository.changeSelectedGroup(event.newValue));
    unawaited(_repository.changeSelectedSubgroup(null));
    emit(SelectedGroupState(selectedGroup: event.newValue));
  }

  Future<void> _onChangeSubgroup(_ChangeSubgroupEvent event, Emitter<SelectedGroupState> emit) async {
    final newValue = event.newValue.isEmpty ? null : event.newValue;
    unawaited(_repository.changeSelectedSubgroup(newValue));
    emit(SelectedGroupState(selectedGroup: state.selectedGroup, selectedSubgroup: newValue));
  }
}
