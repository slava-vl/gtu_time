import 'package:dio/dio.dart';
import 'package:gtu_time/feature/group/domain/entity/groups_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'groups_api.g.dart';

@RestApi()
@injectable
abstract class GroupsApi {
  @factoryMethod
  factory GroupsApi(Dio dio) = _GroupsApi;

  @GET('groups?semester={semester}&week={week}')
  Future<GroupsResponse> getGroups(@Path() int semester, @Path() int week);
}
