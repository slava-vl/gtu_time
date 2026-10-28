import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtu_time/core/services/service_locator/service_locator.dart';
import 'package:gtu_time/feature/schedule_target/bloc/groups_bloc.dart';
import 'package:gtu_time/feature/schedule_target/bloc/teachers_bloc.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/group.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/teacher.dart';
import 'package:gtu_time/feature/schedule_target/domain/repository/i_schedule_targets_repository.dart';

class ScheduleTargetsScope extends StatelessWidget {
  final Widget child;
  const ScheduleTargetsScope({required this.child, super.key});

  static List<Group> groupsOf(BuildContext context, {bool listen = false}) =>
      (listen ? context.watch<GroupsBloc>() : context.read<GroupsBloc>()).state.groups ?? [];

  static Future<void> refreshGroups(BuildContext context) async {
    final completer = Completer<void>();
    context.read<GroupsBloc>().add(GroupsEvent.load(completer: completer));
    await completer.future;
  }

  static List<Teacher> teachersOf(BuildContext context, {bool listen = false}) =>
      (listen ? context.watch<TeachersBloc>() : context.read<TeachersBloc>()).state.teachers ?? [];

  static Future<void> refreshTeachers(BuildContext context) async {
    final completer = Completer<void>();
    context.read<TeachersBloc>().add(TeachersEvent.load(completer: completer));
    await completer.future;
  }

  static void initGroups(BuildContext context) => context.read<GroupsBloc>().add(GroupsEvent.init());
  static void initTeachers(BuildContext context) => context.read<TeachersBloc>().add(TeachersEvent.init());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GroupsBloc(getIt<IScheduleTargetsRepository>())..add(GroupsEvent.init())),
        BlocProvider(create: (_) => TeachersBloc(getIt<IScheduleTargetsRepository>())),
      ],
      child: child,
    );
  }
}
