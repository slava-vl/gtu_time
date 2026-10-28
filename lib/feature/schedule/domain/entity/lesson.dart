import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gtu_time/feature/schedule/domain/entity/lesson_entry.dart';

class Lesson extends Equatable {
  final String time;
  final int slots;
  final List<LessonEntry> entries;

  const Lesson({required this.time, required this.slots, required this.entries});

  TimeOfDay get lessonStart {
    final startH = int.tryParse(time.split(':').first) ?? 0;
    final startM = int.tryParse(time.split(':').last) ?? 0;

    return TimeOfDay(hour: startH, minute: startM);
  }

  TimeOfDay get lessonEnd {
    final startH = int.tryParse(time.split(':').first) ?? 0;
    final startM = int.tryParse(time.split(':').last) ?? 0;

    return TimeOfDay(hour: startH + slots, minute: startM);
  }

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      time: json['time'] as String? ?? '',
      slots: json['slots'] as int? ?? 1,
      entries:
          (json['entries'] as List<dynamic>?)
              ?.map(
                (e) => LessonEntry.fromList(
                  e is List<dynamic> ? e : (e as Map<String, dynamic>)['lines'] as List<dynamic>,
                ),
              )
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {'time': time, 'slots': slots, 'entries': entries.map((e) => e.toList()).toList()};

  @override
  List<Object?> get props => [time, slots, entries];
}
