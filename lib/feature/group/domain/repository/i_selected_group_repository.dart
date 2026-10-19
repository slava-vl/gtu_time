abstract interface class ISelectedGroupRepository {
  String? get selectedGroup;
  String? get selectedSubgroup;

  Future<void> changeSelectedGroup(String newGroup);
  Future<void> changeSelectedSubgroup(String? newSubgroup);
}
