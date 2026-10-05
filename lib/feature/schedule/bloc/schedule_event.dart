part of 'schedule_bloc.dart';

sealed class ScheduleEvent {
  const ScheduleEvent();

  const factory ScheduleEvent.init() = _InitEvent;
}

class _InitEvent extends ScheduleEvent {
  const _InitEvent();
}
