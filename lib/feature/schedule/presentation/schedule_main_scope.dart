import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtu_time/core/services/service_locator/service_locator.dart';
import 'package:gtu_time/feature/schedule/bloc/schedule_bloc.dart';
import 'package:gtu_time/feature/schedule/domain/repository/i_schedule_repository.dart';
import 'package:nested/nested.dart';

class ScheduleMainScope extends SingleChildStatelessWidget {
  const ScheduleMainScope({super.key});

  static List<String> groupsOf(BuildContext context) =>
      context.read<ScheduleBloc>().state.schedule?.groups.keys.toList() ?? [];

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocProvider(
      create: (_) => ScheduleBloc(getIt<IScheduleRepository>())..add(const ScheduleEvent.init()),
      child: child ?? const SizedBox.shrink(),
    );
  }
}
