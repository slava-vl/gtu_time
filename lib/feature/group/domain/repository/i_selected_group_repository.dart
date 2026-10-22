import 'package:gtu_time/feature/group/domain/entity/group.dart';

abstract interface class ISelectedGroupRepository {
  Group? get selectedGroup;
  String? get selectedSubgroup;

  Future<void> changeSelectedGroup(Group newGroup);
  Future<void> changeSelectedSubgroup(String? newSubgroup);
}
