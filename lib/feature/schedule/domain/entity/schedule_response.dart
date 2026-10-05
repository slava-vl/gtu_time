import 'package:gtu_time/feature/schedule/domain/entity/day_schedule.dart';

class ScheduleResponse {
  final int week;
  final String source;
  final DateTime checkedAt;
  final String modifiedAt;
  final Map<String, List<DaySchedule>> groups;

  const ScheduleResponse({
    required this.week,
    required this.source,
    required this.checkedAt,
    required this.modifiedAt,
    required this.groups,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) {
    final rawGroups = json['groups'] as Map<String, dynamic>? ?? {};

    final parsedGroups = rawGroups.map((groupId, daysList) {
      final list =
          (daysList as List<dynamic>?)?.map((e) => DaySchedule.fromJson(e as Map<String, dynamic>)).toList() ?? [];
      return MapEntry(groupId, list);
    });

    return ScheduleResponse(
      week: json['week'] as int? ?? 0,
      source: json['source'] as String? ?? '',
      checkedAt: DateTime.tryParse(json['checkedAt'] as String? ?? '') ?? DateTime.now(),
      modifiedAt: json['modifiedAt'] as String? ?? '',
      groups: parsedGroups,
    );
  }

  Map<String, dynamic> toJson() => {
    'week': week,
    'source': source,
    'checkedAt': checkedAt.toIso8601String(),
    'modifiedAt': modifiedAt,
    'groups': groups.map((k, v) => MapEntry(k, v.map((e) => e.toJson()).toList())),
  };
}
