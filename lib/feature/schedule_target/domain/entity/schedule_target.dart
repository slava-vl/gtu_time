import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:gtu_time/feature/schedule_target/domain/entity/group.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/schedule_target_type.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/teacher.dart';

class ScheduleTarget extends Equatable {
  final ScheduleTargetType type;
  final Group? group;
  final String? subgroup;
  final Teacher? teacher;

  const ScheduleTarget({required this.type, this.group, this.subgroup, this.teacher});

  @override
  List<Object?> get props => [type, group, subgroup, teacher];

  String? title(BuildContext context) => group?.number ?? teacher?.localizedNameOf(context);
  String? subtitle(BuildContext context) => group?.faculty ?? teacher?.programs.join(', ');
  String get key => group?.number ?? teacher?.id ?? 'EmptyKey';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.name,
      'group': group?.toMap(),
      'subgroup': subgroup,
      'teacher': teacher?.toMap(),
    };
  }

  factory ScheduleTarget.fromMap(Map<String, dynamic> map) {
    return ScheduleTarget(
      type: ScheduleTargetType.values.firstWhereOrNull((e) => e.name == map['type']) ?? ScheduleTargetType.values.first,
      group: map['group'] != null ? Group.fromMap(map['group'] as Map<String, dynamic>) : null,
      subgroup: map['subgroup'] != null ? map['subgroup'] as String : null,
      teacher: map['teacher'] != null ? Teacher.fromMap(map['teacher'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleTarget.fromJson(String source) => ScheduleTarget.fromMap(json.decode(source) as Map<String, dynamic>);

  ScheduleTarget copyWith({ScheduleTargetType? type, Group? group, String? subgroup, Teacher? teacher}) {
    return ScheduleTarget(
      type: type ?? this.type,
      group: group ?? this.group,
      subgroup: subgroup ?? this.subgroup,
      teacher: teacher ?? this.teacher,
    );
  }
}
