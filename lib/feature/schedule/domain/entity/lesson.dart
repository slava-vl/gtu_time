import 'package:gtu_time/feature/schedule/domain/entity/lesson_entry.dart';

class Lesson {
  final String time;
  final int slots;
  final List<LessonEntry> entries;

  const Lesson({required this.time, required this.slots, required this.entries});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      time: json['time'] as String? ?? '',
      slots: json['slots'] as int? ?? 1,
      entries: (json['entries'] as List<dynamic>?)?.map((e) => LessonEntry.fromList(e as List<dynamic>)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() => {'time': time, 'slots': slots, 'entries': entries.map((e) => e.toList()).toList()};
}
