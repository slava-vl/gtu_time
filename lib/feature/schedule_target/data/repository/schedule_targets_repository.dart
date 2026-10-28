import 'package:gtu_time/feature/schedule_target/data/data_source/schedule_targets_api.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/group.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/teacher.dart';
import 'package:gtu_time/feature/schedule_target/domain/repository/i_schedule_targets_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IScheduleTargetsRepository)
final class ScheduleTargetsRepository implements IScheduleTargetsRepository {
  final ScheduleTargetsApi _api;
  const ScheduleTargetsRepository(this._api);

  @override
  Future<List<Group>> fetchGroups() async {
    final resp = await _api.getGroups(1, 0);
    return resp.groups;
  }

  @override
  Future<List<Teacher>> fetchTeachers() async {
    final resp = await _api.getTeachers(1, 0);
    return resp.teachers;
  }
}
