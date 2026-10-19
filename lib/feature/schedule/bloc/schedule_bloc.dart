import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtu_time/core/error/error_handler.dart';
import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';
import 'package:gtu_time/feature/schedule/domain/repository/i_schedule_repository.dart';

part 'schedule_bloc.freezed.dart';

@freezed
sealed class ScheduleEvent with _$ScheduleEvent {
  const ScheduleEvent._();

  const factory ScheduleEvent.init() = _InitEvent;
  const factory ScheduleEvent.refresh({Completer<void>? completer}) = _RefreshEvent;

  const factory ScheduleEvent.updateSchedule(ScheduleResponse schedule) = _UpdateScheduleEvent;
  const factory ScheduleEvent.updateLastUpdate(DateTime lastUpdate) = _UpdateLastUpdateEvent;
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
  ScheduleBloc(this._repository)
    : super(ScheduleState.progress(schedule: _repository.schedule, lastUpdate: _repository.lastUpdate)) {
    on<ScheduleEvent>(
      (event, emit) => event.map(
        init: (event) => _onInit(event, emit),
        refresh: (event) => _onRefresh(event, emit),
        updateSchedule: (event) => emit(state.copyWith(schedule: event.schedule)),
        updateLastUpdate: (event) => emit(state.copyWith(lastUpdate: event.lastUpdate)),
      ),
    );

    _scheduleSubscription = _repository.scheduleStream.listen(
      (schedule) => schedule == null ? null : add(ScheduleEvent.updateSchedule(schedule)),
    );
    _lastUpdateSubscription = _repository.lastUpdateStream.listen(
      (lastUpdate) => lastUpdate == null ? null : add(ScheduleEvent.updateLastUpdate(lastUpdate)),
    );
  }

  final IScheduleRepository _repository;
  late final StreamSubscription<ScheduleResponse?> _scheduleSubscription;
  late final StreamSubscription<DateTime?> _lastUpdateSubscription;

  Future<void> _onInit(_InitEvent event, Emitter<ScheduleState> emit) async {
    if (state.schedule == null || state.lastUpdate == null) {
      add(ScheduleEvent.refresh());
    } else {
      emit(ScheduleState.success(schedule: state.schedule!, lastUpdate: state.lastUpdate));
    }
  }

  Future<void> _onRefresh(_RefreshEvent event, Emitter<ScheduleState> emit) async {
    emit(ScheduleState.progress(schedule: state.schedule, lastUpdate: state.lastUpdate));
    try {
      await _repository.updateSchedule();
      emit(ScheduleState.success(schedule: _repository.schedule!, lastUpdate: _repository.lastUpdate));
    } on Object catch (e) {
      debugPrint(e.toString());
      emit(ScheduleState.error(error: e.toHandler(), schedule: state.schedule, lastUpdate: state.lastUpdate));
    } finally {
      event.completer?.complete();
    }
  }

  @override
  Future<void> close() {
    _scheduleSubscription.cancel();
    _lastUpdateSubscription.cancel();
    return super.close();
  }
}
