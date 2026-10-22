import 'package:gtu_time/feature/group/domain/entity/group.dart';

abstract interface class IGroupsRepository {
  Future<List<Group>> fetchGroups();
}
