import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtu_time/core/services/service_locator/service_locator.dart';
import 'package:gtu_time/feature/group/bloc/selected_group_bloc.dart';
import 'package:gtu_time/feature/group/domain/repository/i_selected_group_repository.dart';
import 'package:nested/nested.dart';

class SelectedGroupScope extends SingleChildStatelessWidget {
  const SelectedGroupScope({super.key});

  static String? groupOf(BuildContext context, {bool listen = false}) =>
      (listen ? context.watch<SelectedGroupBloc>() : context.read<SelectedGroupBloc>()).state.selectedGroup;

  static String? subgroupOf(BuildContext context, {bool listen = false}) =>
      (listen ? context.watch<SelectedGroupBloc>() : context.read<SelectedGroupBloc>()).state.selectedSubgroup;

  static void change(BuildContext context, {required String newValue}) =>
      context.read<SelectedGroupBloc>().add(SelectedGroupEvent.change(newValue));

  static void changeSubgroup(BuildContext context, {required String newValue}) =>
      context.read<SelectedGroupBloc>().add(SelectedGroupEvent.changeSubgroup(newValue));

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocProvider(
      create: (_) => SelectedGroupBloc(getIt<ISelectedGroupRepository>()),
      child: child ?? SizedBox.shrink(),
    );
  }
}
