import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtu_time/feature/schedule/bloc/schedule_bloc.dart';
import 'package:gtu_time/feature/schedule/presentation/schedule_main_scope.dart';
import 'package:nested/nested.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Nested(children: const [ScheduleMainScope()], child: _MaterialApp());
  }
}

class _MaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocBuilder<ScheduleBloc, ScheduleState>(
          builder: (context, state) => state.map(
            progress: (_) => Center(child: Text('Hello World!')),
            success: (schedule) => Center(child: Text(schedule.toJson().toString())),
          ),
        ),
      ),
    );
  }
}
