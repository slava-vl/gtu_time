import 'package:gtu_time/core/services/hive/hive_registrar.g.dart';
import 'package:gtu_time/feature/schedule/domain/entity/day_schedule.dart';
import 'package:gtu_time/feature/schedule/domain/entity/lesson.dart';
import 'package:gtu_time/feature/schedule/domain/entity/lesson_entry.dart';
import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

@GenerateAdapters([
  AdapterSpec<ScheduleResponse>(),
  AdapterSpec<DaySchedule>(),
  AdapterSpec<Lesson>(),
  AdapterSpec<LessonEntry>(),
])
part 'hive_adapters.g.dart';

Future<void> initHive() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapters();
}
