import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtu_time/core/services/service_locator/service_locator.dart';
import 'package:gtu_time/feature/group/bloc/groups_bloc.dart';
import 'package:gtu_time/feature/group/domain/entity/group.dart';
import 'package:gtu_time/feature/group/domain/repository/i_groups_repository.dart';

class GroupsScope extends StatelessWidget {
  final Widget child;
  const GroupsScope({required this.child, super.key});

  static List<Group> groupsOf(BuildContext context, {bool listen = false}) =>
      (listen ? context.watch<GroupsBloc>() : context.read<GroupsBloc>()).state.groups ?? [];

  static Future<void> refresh(BuildContext context) async {
    final completer = Completer<void>();
    context.read<GroupsBloc>().add(GroupsEvent.load(completer: completer));
    await completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => GroupsBloc(getIt<IGroupsRepository>())..add(GroupsEvent.load()), child: child);
  }
}
