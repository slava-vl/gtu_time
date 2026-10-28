import 'package:gtu_time/feature/schedule_target/data/data_source/selected_targets_local_db.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/schedule_target.dart';
import 'package:gtu_time/feature/schedule_target/domain/repository/i_selected_targets_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ISelectedTargetsRepository)
final class SelectedTargetsRepository implements ISelectedTargetsRepository {
  final ISelectedTargetsLocalDB _localDB;
  const SelectedTargetsRepository(this._localDB);

  @override
  List<ScheduleTarget> get targets => _localDB.read();

  @override
  Future<void> saveTargets(List<ScheduleTarget> targets) => _localDB.save(targets);

  @override
  int? get selectedIndex => _localDB.readIndex();

  @override
  Future<void> saveSelectedIndex(int? index) => _localDB.saveIndex(index);
}
