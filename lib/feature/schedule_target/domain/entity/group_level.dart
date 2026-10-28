import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';

enum GroupLevel {
  bachelor(0),
  master(1),
  doctor(2),
  vocational(3),
  preparatoryCourse(4);

  final int number;
  const GroupLevel(this.number);

  factory GroupLevel.fromInt(int number) => GroupLevel.values.firstWhereOrNull((e) => e.number == number) ?? .bachelor;

  String localize(BuildContext context) => switch (this) {
    .bachelor => context.l10n.degree_bachelor,
    .master => context.l10n.degree_master,
    .doctor => context.l10n.degree_doctor,
    .vocational => context.l10n.degree_vocational,
    .preparatoryCourse => context.l10n.degree_preparatory_course,
  };
}
