import 'package:gtu_time/feature/schedule/domain/entity/day_schedule.dart';

class ScheduleResponse {
  final int week;
  final String source;
  final DateTime checkedAt;
  final String modifiedAt;
  final Map<String, List<DaySchedule>> groups;
  final Map<String, List<DaySchedule>> teachers;

  const ScheduleResponse({
    required this.week,
    required this.source,
    required this.checkedAt,
    required this.modifiedAt,
    required this.groups,
    required this.teachers,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) {
    final rawGroups = json['groups'] as Map<String, dynamic>? ?? {};
    final parsedGroups = rawGroups.map((groupId, daysList) {
      final list =
          (daysList as List<dynamic>?)?.map((e) => DaySchedule.fromJson(e as Map<String, dynamic>)).toList() ?? [];
      return MapEntry(groupId, list);
    });

    final rawTeachers = json['teachers'] as Map<String, dynamic>? ?? {};
    final parsedTeachers = rawTeachers.map((teacherId, data) {
      final daysList = (data as Map<String, dynamic>)['days'] as List<dynamic>?;
      final list = daysList?.map((e) => DaySchedule.fromJson(e as Map<String, dynamic>)).toList() ?? [];
      return MapEntry(teacherId, list);
    });

    return ScheduleResponse(
      week: json['week'] as int? ?? 0,
      source: json['source'] as String? ?? '',
      checkedAt: DateTime.tryParse(json['checkedAt'] as String? ?? '') ?? DateTime.now(),
      modifiedAt: json['modifiedAt'] as String? ?? '',
      groups: parsedGroups,
      teachers: parsedTeachers,
    );
  }

  Map<String, dynamic> toJson() => {
    'week': week,
    'source': source,
    'checkedAt': checkedAt.toIso8601String(),
    'modifiedAt': modifiedAt,
    'groups': groups.map((k, v) => MapEntry(k, v.map((e) => e.toJson()).toList())),
    'teachers': teachers.map((k, v) => MapEntry(k, v.map((e) => e.toJson()).toList())),
  };
}
