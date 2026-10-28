import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/schedule_target.dart';

abstract interface class IScheduleRepository {
  Future<(ScheduleResponse, DateTime)> fetchSchedule(ScheduleTarget target);
  Future<(ScheduleResponse, DateTime)> updateSchedule(ScheduleTarget target);

}
