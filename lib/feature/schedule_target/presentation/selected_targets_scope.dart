import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtu_time/core/services/service_locator/service_locator.dart';
import 'package:gtu_time/feature/schedule_target/bloc/selected_targets_bloc.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/group.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/schedule_target.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/teacher.dart';
import 'package:gtu_time/feature/schedule_target/domain/repository/i_selected_targets_repository.dart';
import 'package:nested/nested.dart';

class SelectedTargetsScope extends SingleChildStatelessWidget {
  const SelectedTargetsScope({super.key});

  static ScheduleTarget? targetOf(BuildContext context, {bool listen = false}) =>
      (listen ? context.watch<SelectedTargetsBloc>() : context.read<SelectedTargetsBloc>()).state.selectedTarget;

  static List<ScheduleTarget> targetsOf(BuildContext context, {bool listen = false}) =>
      (listen ? context.watch<SelectedTargetsBloc>() : context.read<SelectedTargetsBloc>()).state.targets;

  static int? selectedIndexOf(BuildContext context, {bool listen = false}) =>
      (listen ? context.watch<SelectedTargetsBloc>() : context.read<SelectedTargetsBloc>()).state.selectedIndex;

  static void addGroup(BuildContext context, {required Group group}) =>
      context.read<SelectedTargetsBloc>().add(SelectedTargetsEvent.addGroup(group));

  static void addTeacher(BuildContext context, {required Teacher teacher}) =>
      context.read<SelectedTargetsBloc>().add(SelectedTargetsEvent.addTeacher(teacher));

  static void changeIndex(BuildContext context, {required int index}) =>
      context.read<SelectedTargetsBloc>().add(SelectedTargetsEvent.changeIndex(index));

  static void changeSubgroup(BuildContext context, {String? subgroup}) =>
      context.read<SelectedTargetsBloc>().add(SelectedTargetsEvent.changeSubgroup(subgroup));

  static void removeTarget(BuildContext context, {required ScheduleTarget target}) =>
      context.read<SelectedTargetsBloc>().add(SelectedTargetsEvent.removeTarget(target));

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocProvider(
      create: (_) => SelectedTargetsBloc(getIt<ISelectedTargetsRepository>()),
      child: child ?? SizedBox.shrink(),
    );
  }
}
