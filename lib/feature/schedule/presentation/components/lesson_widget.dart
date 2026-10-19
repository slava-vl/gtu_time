import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/feature/group/presentation/selected_group_scope.dart';
import 'package:gtu_time/feature/schedule/domain/entity/lesson.dart';

class LessonWidget extends StatefulWidget {
  final Lesson lesson;
  final int weekday;
  const LessonWidget({required this.lesson, required this.weekday, super.key});

  @override
  State<LessonWidget> createState() => _LessonWidgetState();
}

class _LessonWidgetState extends State<LessonWidget> {
  late final DateTime start;
  late final DateTime end;
  late final int lessonDuration;

  int difference = 0;
  bool isInProgress = false;
  Timer? _timer;
  @override
  void initState() {
    final currentWeekStart = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).dateOnly;
    start = currentWeekStart.add(
      Duration(
        days: widget.weekday - 1,
        hours: int.tryParse(widget.lesson.time.split(':').first) ?? 0,
        minutes: int.tryParse(widget.lesson.time.split(':').last) ?? 0,
      ),
    );
    end = start.add(Duration(hours: widget.lesson.slots));
    lessonDuration = 60 * widget.lesson.slots;
    _checkIsInProgress();
    if (isInProgress) {
      _timer = Timer.periodic(Duration(seconds: 1), (_) => _checkIsInProgress());
    } else {
      if (start.dateOnly == DateTime.now().dateOnly && start.isAfter(DateTime.now())) {
        _timer = Timer(Duration(seconds: start.difference(DateTime.now()).inSeconds), () {
          _timer?.cancel();
          _timer = Timer.periodic(Duration(seconds: 1), (_) => _checkIsInProgress());
        });
      }
    }
    super.initState();
  }

  void _checkIsInProgress() {
    isInProgress = DateTime.now().betweenOrEqualTo(start, end);
    if (!isInProgress) {
      _timer?.cancel();
    } else {
      difference = DateTime.now().difference(start).inMinutes.clamp(0, lessonDuration);
    }
    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedSubgroup = SelectedGroupScope.subgroupOf(context, listen: true);

    return Row(
      crossAxisAlignment: .start,
      spacing: context.theme.spacings.s10,
      children: [
        SizedBox(
          width: 44,
          child: Padding(
            padding: .only(top: context.theme.spacings.s10),
            child: Column(
              crossAxisAlignment: .start,
              spacing: context.theme.spacings.s2,
              children: [
                Text(
                  '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}',
                  style: context.theme.textStyles.ag30.copyWith(
                    color: isInProgress
                        ? context.theme.colorsPalette.brand.primary
                        : context.theme.colorsPalette.text.primary,
                  ),
                ),
                Text(
                  '${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}',
                  style: context.theme.textStyles.ag18.copyWith(color: context.theme.colorsPalette.text.secondary),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: isInProgress
                  ? context.theme.colorsPalette.surfaces.tertiary
                  : context.theme.colorsPalette.surfaces.glassStrong,
              border: Border.all(
                color: isInProgress
                    ? context.theme.colorsPalette.brand.primary
                    : context.theme.colorsPalette.bordersAndLights.defaultColor,
              ),
              borderRadius: context.theme.radiuses.s16.circular,
            ),
            padding: .symmetric(horizontal: context.theme.spacings.s12, vertical: context.theme.spacings.s10),
            child: Column(
              crossAxisAlignment: .start,
              spacing: context.theme.spacings.s4,
              children: widget.lesson.entries
                  .where(
                    (item) => selectedSubgroup == null || item.subgroup == selectedSubgroup || item.subgroup == null,
                  )
                  .map(
                    (item) => Column(
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          crossAxisAlignment: .start,
                          spacing: context.theme.spacings.s8,
                          children: [
                            Expanded(
                              child: Text(
                                item.subject,
                                style: context.theme.textStyles.ag22.copyWith(
                                  color: context.theme.colorsPalette.text.primary,
                                ),
                              ),
                            ),
                            if (isInProgress)
                              Container(
                                decoration: BoxDecoration(
                                  color: context.theme.colorsPalette.brand.selection,
                                  borderRadius: context.theme.radiuses.s8.circular,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: context.theme.spacings.s4,
                                  horizontal: context.theme.spacings.s8,
                                ),
                                child: Row(
                                  spacing: context.theme.spacings.s4,
                                  children: [
                                    Assets.icons.radio11.svg(
                                      colorFilter: context.theme.colorsPalette.status.current.filter,
                                    ),
                                    Text(
                                      context.l10n.now_status,
                                      style: context.theme.textStyles.ag26.copyWith(
                                        color: context.theme.colorsPalette.status.current,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        Text(
                          context.l10n.room_and_building(item.room.split('-').last, item.room.split('-').first),
                          style: context.theme.textStyles.ag18.copyWith(
                            color: context.theme.colorsPalette.text.secondary,
                          ),
                        ),
                        Text(
                          item.lecturer,
                          style: context.theme.textStyles.ag18.copyWith(
                            color: context.theme.colorsPalette.text.secondary,
                          ),
                        ),
                        if (item.subgroup != null)
                          Text(
                            context.l10n.subgroup_label(item.subgroup ?? ''),
                            style: context.theme.textStyles.ag18.copyWith(
                              color: context.theme.colorsPalette.text.secondary,
                            ),
                          ),
                        if (!isInProgress && end.isBefore(DateTime.now()))
                          Row(
                            spacing: context.theme.spacings.s4,
                            children: [
                              Assets.icons.check11.svg(
                                colorFilter: context.theme.colorsPalette.status.completed.filter,
                              ),
                              Text(
                                context.l10n.completed_status,
                                style: context.theme.textStyles.ag18.copyWith(
                                  color: context.theme.colorsPalette.status.completed,
                                ),
                              ),
                            ],
                          ),
                        if (isInProgress) ...[
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  context.l10n.percent_elapsed((difference / lessonDuration * 100).toInt()),
                                  style: context.theme.textStyles.ag31.copyWith(
                                    color: context.theme.colorsPalette.brand.primary,
                                  ),
                                ),
                              ),
                              Text(
                                context.l10n.min_remaining(lessonDuration - difference),
                                style: context.theme.textStyles.ag18.copyWith(
                                  color: context.theme.colorsPalette.brand.primary,
                                ),
                              ),
                            ],
                          ),
                          LinearProgressIndicator(
                            value: difference / lessonDuration,
                            borderRadius: context.theme.radiuses.s999.circular,
                          ),
                        ],
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
