import 'package:flutter/material.dart';
import 'package:gtu_time/core/services/hive/hive_adapters.dart';
import 'package:gtu_time/core/services/service_locator/service_locator.dart';
import 'package:gtu_time/feature/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initHive();
  await configureDependencies();

  runApp(const App());
}
