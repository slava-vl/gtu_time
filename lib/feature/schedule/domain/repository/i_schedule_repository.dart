import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';

abstract interface class IScheduleRepository {
  Future<void> init();
  Future<void> updateSchedule();

  Stream<ScheduleResponse?> get scheduleStream;
  Stream<DateTime?> get lastUpdateStream;

  ScheduleResponse? get schedule;
  DateTime? get lastUpdate;
}
