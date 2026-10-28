import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtu_time/core/error/error_handler.dart';
import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';
import 'package:gtu_time/feature/schedule/domain/repository/i_schedule_repository.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/schedule_target.dart';

part 'schedule_bloc.freezed.dart';

@freezed
sealed class ScheduleEvent with _$ScheduleEvent {
  const ScheduleEvent._();

  const factory ScheduleEvent.refresh({Completer<void>? completer}) = _RefreshEvent;
  const factory ScheduleEvent.changeTarget(ScheduleTarget target) = _ChangeTargetEvent;
}

@freezed
sealed class ScheduleState with _$ScheduleState {
  const ScheduleState._();

  const factory ScheduleState.progress({ScheduleResponse? schedule, DateTime? lastUpdate}) = _ProgressState;
  const factory ScheduleState.success({required ScheduleResponse schedule, DateTime? lastUpdate}) = _SuccessState;
  const factory ScheduleState.error({required IErrorHandler error, ScheduleResponse? schedule, DateTime? lastUpdate}) =
      _ErrorState;

  bool get isProgress => this is _ProgressState;
  bool get isError => this is _ErrorState;
  IErrorHandler? get error => this is _ErrorState ? (this as _ErrorState).error : null;
}

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc(this._repository) : super(ScheduleState.progress()) {
    on<ScheduleEvent>(
      (event, emit) =>
          event.map(refresh: (event) => _onRefresh(event, emit), changeTarget: (event) => _onChangeTarget(event, emit)),
    );
  }

  final IScheduleRepository _repository;
  late ScheduleTarget _target;

  Future<void> _onRefresh(_RefreshEvent event, Emitter<ScheduleState> emit) async {
    emit(ScheduleState.progress(schedule: state.schedule, lastUpdate: state.lastUpdate));
    try {
      final res = await _repository.updateSchedule(_target);
      emit(ScheduleState.success(schedule: res.$1, lastUpdate: res.$2));
    } on Object catch (e) {
      debugPrint(e.toString());
      emit(ScheduleState.error(error: e.toHandler(), schedule: state.schedule, lastUpdate: state.lastUpdate));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onChangeTarget(_ChangeTargetEvent event, Emitter<ScheduleState> emit) async {
    final newTarget = event.target;
    _target = newTarget;
    emit(ScheduleState.progress());
    try {
      final res = await _repository.fetchSchedule(_target);
      emit(ScheduleState.success(schedule: res.$1, lastUpdate: res.$2));
    } on Object catch (e) {
      emit(ScheduleState.error(error: e.toHandler(), schedule: state.schedule, lastUpdate: state.lastUpdate));
    }
  }
}
