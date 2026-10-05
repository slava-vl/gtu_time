import 'package:gtu_time/feature/schedule/domain/entity/lesson.dart';

class DaySchedule {
  final String label;
  final List<Lesson> lessons;

  const DaySchedule({required this.label, required this.lessons});

  factory DaySchedule.fromJson(Map<String, dynamic> json) {
    return DaySchedule(
      label: json['label'] as String? ?? '',
      lessons:
          (json['lessons'] as List<dynamic>?)?.map((e) => Lesson.fromJson(e as Map<String, dynamic>)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() => {'label': label, 'lessons': lessons.map((e) => e.toJson()).toList()};
}
