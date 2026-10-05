part of 'schedule_bloc.dart';

sealed class ScheduleState extends Equatable {
  const ScheduleState();

  const factory ScheduleState.progress({ScheduleResponse? schedule}) = _ProgressState;
  const factory ScheduleState.success({required ScheduleResponse schedule}) = _SuccessState;

  ScheduleResponse? get schedule => switch (this) {
    final _ProgressState state => state.schedule,
    final _SuccessState state => state.schedule,
  };

  T map<T>({
    required T Function(ScheduleResponse? schedule) progress,
    required T Function(ScheduleResponse schedule) success,
  }) {
    if (this is _ProgressState) {
      return progress((this as _ProgressState).schedule);
    } else if (this is _SuccessState) {
      return success((this as _SuccessState).schedule);
    }
    throw Exception('Unhandled state: $this');
  }
}

class _ProgressState extends ScheduleState {
  @override
  final ScheduleResponse? schedule;
  const _ProgressState({this.schedule});

  @override
  List<Object?> get props => [schedule];
}

class _SuccessState extends ScheduleState {
  @override
  final ScheduleResponse schedule;
  const _SuccessState({required this.schedule});

  @override
  List<Object?> get props => [schedule];
}
