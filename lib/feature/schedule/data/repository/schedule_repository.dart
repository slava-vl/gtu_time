import 'package:gtu_time/feature/schedule/data/data_source/schedule_api.dart';
import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';
import 'package:gtu_time/feature/schedule/domain/repository/i_schedule_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IScheduleRepository)
final class ScheduleRepository implements IScheduleRepository {
  final ScheduleApi _api;

  const ScheduleRepository(this._api);

  @override
  Future<ScheduleResponse> fetchSchedule() => _api.getSchedule();
}
