import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';

enum ScheduleTargetType {
  group,
  teacher;

  String localize(BuildContext context) => switch (this) {
    .group => context.l10n.group_label,
    .teacher => context.l10n.teacher_label,
  };

  String searchTitle(BuildContext context) => switch (this) {
    .group => context.l10n.find_your_study_group,
    .teacher => context.l10n.find_teacher,
  };

  String searchDescription(BuildContext context) => switch (this) {
    .group => context.l10n.choose_your_group_description,
    .teacher => context.l10n.choose_teacher_description,
  };

  String searchHint(BuildContext context) => switch (this) {
    .group => context.l10n.search_by_group_or_program,
    .teacher => context.l10n.search_by_name_or_program,
  };
  String itemsListTitle(BuildContext context) => switch (this) {
    .group => context.l10n.available_groups,
    .teacher => context.l10n.available_teachers,
  }.toUpperCase();
}
