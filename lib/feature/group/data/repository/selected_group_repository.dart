import 'package:gtu_time/feature/group/data/data_source/selected_group_local_db.dart';
import 'package:gtu_time/feature/group/domain/entity/group.dart';
import 'package:gtu_time/feature/group/domain/repository/i_selected_group_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ISelectedGroupRepository)
final class SelectedGroupRepository implements ISelectedGroupRepository {
  final ISelectedGroupLocalDB _localDB;
  const SelectedGroupRepository(this._localDB);

  @override
  Future<void> changeSelectedGroup(Group newGroup) => _localDB.change(newGroup);
  @override
  Future<void> changeSelectedSubgroup(String? newSubgroup) => _localDB.changeSub(newSubgroup);

  @override
  Group? get selectedGroup => _localDB.read();

  @override
  String? get selectedSubgroup => _localDB.readSub();
}
