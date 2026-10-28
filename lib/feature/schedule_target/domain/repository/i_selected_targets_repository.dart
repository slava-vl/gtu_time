import 'package:gtu_time/feature/schedule_target/domain/entity/schedule_target.dart';

abstract interface class ISelectedTargetsRepository {
  List<ScheduleTarget> get targets;
  Future<void> saveTargets(List<ScheduleTarget> targets);

  int? get selectedIndex;
  Future<void> saveSelectedIndex(int? index);
}
