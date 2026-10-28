import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtu_time/core/error/error_handler.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/teacher.dart';
import 'package:gtu_time/feature/schedule_target/domain/repository/i_schedule_targets_repository.dart';

part 'teachers_bloc.freezed.dart';

@freezed
sealed class TeachersEvent with _$TeachersEvent {
  const factory TeachersEvent.init() = _InitEvent;
  const factory TeachersEvent.load({Completer<void>? completer}) = _LoadEvent;
}

@freezed
sealed class TeachersState with _$TeachersState {
  const TeachersState._();

  const factory TeachersState.progress({List<Teacher>? teachers}) = _Progress;
  const factory TeachersState.success({required List<Teacher> teachers}) = _Success;
  const factory TeachersState.error({required IErrorHandler error, List<Teacher>? teachers}) = _Error;

  bool get isProgress => this is _Progress;
  bool get isError => this is _Error;
  IErrorHandler? get error => this is _Error ? (this as _Error).error : null;
}

class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  final IScheduleTargetsRepository _repository;
  TeachersBloc(this._repository) : super(TeachersState.progress()) {
    on<TeachersEvent>(
      (event, emit) => event.map(init: (event) => _onInit(event, emit), load: (event) => _onLoad(event, emit)),
    );
  }

  bool _isInited = false;

  void _onInit(_InitEvent event, Emitter<TeachersState> emit) {
    if (_isInited) return;
    _isInited = true;
    add(TeachersEvent.load());
  }

  Future<void> _onLoad(_LoadEvent event, Emitter<TeachersState> emit) async {
    emit(TeachersState.progress(teachers: state.teachers));
    try {
      final teachers = await _repository.fetchTeachers();
      emit(TeachersState.success(teachers: teachers));
      event.completer?.complete();
    } on Object catch (e) {
      emit(TeachersState.error(teachers: state.teachers, error: e.toHandler()));
    }
  }
}
