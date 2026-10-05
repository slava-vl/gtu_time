import 'package:dio/dio.dart';
import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'schedule_api.g.dart';

@RestApi()
@injectable
abstract class ScheduleApi {
  @factoryMethod
  factory ScheduleApi(Dio dio) = _ScheduleApi;

  @GET('schedule')
  Future<ScheduleResponse> getSchedule();
}
