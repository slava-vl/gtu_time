import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';

abstract interface class IScheduleRepository {
  Future<ScheduleResponse> fetchSchedule();
}
