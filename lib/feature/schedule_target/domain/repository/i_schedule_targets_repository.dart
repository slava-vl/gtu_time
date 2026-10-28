import 'package:gtu_time/feature/schedule_target/domain/entity/group.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/teacher.dart';

abstract interface class IScheduleTargetsRepository {
  Future<List<Group>> fetchGroups();
  Future<List<Teacher>> fetchTeachers();
}
