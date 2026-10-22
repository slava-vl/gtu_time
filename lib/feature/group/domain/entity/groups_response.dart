import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:gtu_time/feature/group/domain/entity/group.dart';

class GroupsResponse extends Equatable {
  final int semester;
  final int week;
  final String version;
  final List<Group> groups;

  const GroupsResponse({required this.semester, required this.week, required this.version, required this.groups});

  @override
  List<Object?> get props => [semester, week, version, groups];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'semester': semester,
      'week': week,
      'version': version,
      'groups': groups.map((x) => x.toMap()).toList(),
    };
  }

  factory GroupsResponse.fromMap(Map<String, dynamic> map) {
    final groupsJson = (map['groups'] as List<dynamic>?) ?? [];
    final groups = <Group>[];
    for (final item in groupsJson) {
      try {
        final group = Group.fromMap(item as Map<String, dynamic>);
        groups.add(group);
      } on Object catch (e) {
        debugPrint(e.toString());
      }
    }
    return GroupsResponse(
      semester: map['semester'] as int,
      week: map['week'] as int,
      version: map['version'] as String,
      groups: groups,
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupsResponse.fromJson(String source) => GroupsResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
