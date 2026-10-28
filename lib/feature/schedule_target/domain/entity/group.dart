import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/group_level.dart';

class Group extends Equatable {
  final String number;
  final String faculty;
  final GroupLevel level;
  final String language;

  const Group({required this.number, required this.faculty, required this.level, required this.language});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'number': number, 'faculty': faculty, 'level': level.number, 'language': language};
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      number: map['number'] as String,
      faculty: map['faculty'] as String,
      level: GroupLevel.fromInt(map['level'] as int),
      language: map['language'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Group.fromJson(String source) => Group.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [number, faculty, level, language];
}
