import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gtu_time/feature/localization_control/presentation/localization_scope.dart';

class Teacher extends Equatable {
  final String id;
  final Map<String, List<String>> name;
  final List<String> programs;

  const Teacher({required this.id, required this.name, required this.programs});

  @override
  List<Object?> get props => [id, name, programs];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'programs': programs};
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      id: map['id'] as String,
      name: (map['name'] as Map<String, dynamic>).map((key, value) => MapEntry(key, List<String>.from(value as List))),
      programs: List<String>.from(map['programs'] as List),
    );
  }

  String localizedNameOf(BuildContext context) {
    return name.containsKey(LocalizationScope.localeEntityOf(context).systLangCode)
        ? name[LocalizationScope.localeEntityOf(context).systLangCode]!.join(' ')
        : name.entries.first.value.join();
  }

  String toJson() => json.encode(toMap());

  factory Teacher.fromJson(String source) => Teacher.fromMap(json.decode(source) as Map<String, dynamic>);
}
