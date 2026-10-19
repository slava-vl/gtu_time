import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtu_time/core/services/service_locator/service_locator.dart';
import 'package:gtu_time/feature/schedule/bloc/schedule_bloc.dart';
import 'package:gtu_time/feature/schedule/domain/entity/day_schedule.dart';
import 'package:gtu_time/feature/schedule/domain/repository/i_schedule_repository.dart';
import 'package:nested/nested.dart';

class ScheduleMainScope extends SingleChildStatelessWidget {
  const ScheduleMainScope({super.key});

  static List<String> groupsOf(BuildContext context, {bool listen = false}) =>
      (listen ? context.watch<ScheduleBloc>() : context.read<ScheduleBloc>()).state.schedule?.groups.keys.toList() ??
      [];

  static List<DaySchedule>? scheduleOf(BuildContext context, {required String group, bool listen = false}) =>
      (listen ? context.watch<ScheduleBloc>() : context.read<ScheduleBloc>()).state.schedule?.groups[group];

  static List<String> subgroupsOf(BuildContext context, {required String group, bool listen = false}) {
    final schedule =
        (listen ? context.watch<ScheduleBloc>() : context.read<ScheduleBloc>()).state.schedule?.groups[group] ?? [];
    if (schedule.isEmpty) return [];
    final subgroups = <String>{};
    for (final item in schedule) {
      for (final e in item.lessons) {
        for (final entry in e.entries) {
          if (entry.subgroup != null) subgroups.add(entry.subgroup!);
        }
      }
    }
    return subgroups.toList();
  }

  static DateTime? lastUpdateOf(BuildContext context, {bool listen = false}) =>
      (listen ? context.watch<ScheduleBloc>() : context.read<ScheduleBloc>()).state.lastUpdate;

  static Future<void> refresh(BuildContext context) async {
    final completer = Completer<void>();
    context.read<ScheduleBloc>().add(ScheduleEvent.refresh(completer: completer));
    await completer.future;
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocProvider(
      create: (_) => ScheduleBloc(getIt<IScheduleRepository>())..add(const ScheduleEvent.init()),
      child: child ?? const SizedBox.shrink(),
    );
  }
}
