import 'package:gtu_time/feature/group/data/data_source/groups_api.dart';
import 'package:gtu_time/feature/group/domain/entity/group.dart';
import 'package:gtu_time/feature/group/domain/repository/i_groups_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IGroupsRepository)
final class GroupsRepository implements IGroupsRepository {
  final GroupsApi _api;
  const GroupsRepository(this._api);
  @override
  Future<List<Group>> fetchGroups() async {
    final resp = await _api.getGroups(1, 0);
    return resp.groups;
  }
}
