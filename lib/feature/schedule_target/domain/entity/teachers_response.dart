import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:gtu_time/feature/schedule_target/domain/entity/teacher.dart';

class TeachersResponse extends Equatable {
  final int semester;
  final int week;
  final String version;
  final List<Teacher> teachers;

  const TeachersResponse({required this.semester, required this.week, required this.version, required this.teachers});

  @override
  List<Object?> get props => [semester, week, version, teachers];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'semester': semester,
      'week': week,
      'version': version,
      'groups': teachers.map((x) => x.toMap()).toList(),
    };
  }

  factory TeachersResponse.fromMap(Map<String, dynamic> map) {
    final teachersJson = (map['teachers'] as List<dynamic>?) ?? [];
    final teachers = <Teacher>[];
    for (final item in teachersJson) {
      try {
        final group = Teacher.fromMap(item as Map<String, dynamic>);
        teachers.add(group);
      } on Object catch (e) {
        debugPrint(e.toString());
      }
    }
    return TeachersResponse(
      semester: map['semester'] as int,
      week: map['week'] as int,
      version: map['version'] as String,
      teachers: teachers,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeachersResponse.fromJson(String source) =>
      TeachersResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
