import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/error/components/error_card.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/services/service_locator/service_locator.dart';
import 'package:gtu_time/core/ui_kit/ui_kit.dart';
import 'package:gtu_time/feature/group/domain/entity/group.dart';
import 'package:gtu_time/feature/schedule/bloc/schedule_bloc.dart';
import 'package:gtu_time/feature/schedule/data/data_source/schedule_api.dart';
import 'package:gtu_time/feature/schedule/data/data_source/schedule_local_db.dart';
import 'package:gtu_time/feature/schedule/data/repository/schedule_repository.dart';
import 'package:gtu_time/feature/schedule/domain/entity/day_schedule.dart';

class ScheduleScope extends StatelessWidget {
  final Widget child;
  final String group;
  const ScheduleScope({required this.child, required this.group, super.key});

  static List<String> groupsOf(BuildContext context, {bool listen = false}) =>
      (listen ? context.watch<ScheduleBloc>() : context.read<ScheduleBloc>()).state.schedule?.groups.keys.toList() ??
      [];

  static List<DaySchedule>? scheduleOf(BuildContext context, {required Group group, bool listen = false}) =>
      (listen ? context.watch<ScheduleBloc>() : context.read<ScheduleBloc>()).state.schedule?.groups[group.number];

  static List<String> subgroupsOf(BuildContext context, {required Group group, bool listen = false}) {
    final schedule =
        (listen ? context.watch<ScheduleBloc>() : context.read<ScheduleBloc>()).state.schedule?.groups[group.number] ?? [];
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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ScheduleBloc(ScheduleRepository(getIt<ScheduleApi>(), getIt<IScheduleLocalDb>(), group))
            ..add(const ScheduleEvent.init()),
      child: _Listener(child: child),
    );
  }
}

class _Listener extends StatelessWidget {
  final Widget child;
  const _Listener({required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScheduleBloc, ScheduleState>(
      listener: (context, state) => state.whenOrNull<void>(
        error: (error, schedule, lastUpdate) {
          if (schedule != null) {
            ErrorCard.show(
              context,
              error: error,
              actionsBuilder: (ctx) => [
                PrimaryButton(
                  alignment: .center,
                  title: context.l10n.try_again,
                  onTap: () {
                    ScheduleScope.refresh(context);
                    ctx.pop();
                  },
                ),
                PrimaryButton(type: .text, alignment: .center, title: context.l10n.close, onTap: ctx.pop),
              ],
            );
          }
        },
      ),
      child: child,
    );
  }
}
