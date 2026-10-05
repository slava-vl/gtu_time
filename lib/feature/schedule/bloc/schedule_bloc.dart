import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';
import 'package:gtu_time/feature/schedule/domain/repository/i_schedule_repository.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final IScheduleRepository _repository;
  ScheduleBloc(this._repository) : super(ScheduleState.progress()) {
    on<ScheduleEvent>(
      (event, emit) => switch (event) {
        final _InitEvent event => _onInit(event, emit),
      },
    );
  }

  Future<void> _onInit(_InitEvent event, Emitter<ScheduleState> emit) async {
    emit(ScheduleState.progress());
    try {
      final res = await _repository.fetchSchedule();
      emit(ScheduleState.success(schedule: res));
    } catch (e) {
      emit(ScheduleState.progress());
    }
  }
}
