import 'package:dio/dio.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/groups_response.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/teachers_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'schedule_targets_api.g.dart';

@RestApi()
@injectable
abstract class ScheduleTargetsApi {
  @factoryMethod
  factory ScheduleTargetsApi(Dio dio) = _ScheduleTargetsApi;

  @GET('groups?semester={semester}&week={week}')
  Future<GroupsResponse> getGroups(@Path() int semester, @Path() int week);

  @GET('teachers?semester={semester}&week={week}')
  Future<TeachersResponse> getTeachers(@Path() int semester, @Path() int week);
}
