import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/extension/src/string_extension.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/router/routes_enum.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/core/ui_kit/ui_kit.dart';
import 'package:gtu_time/feature/group/domain/entity/group.dart';
import 'package:gtu_time/feature/group/presentation/selected_group_scope.dart';
import 'package:gtu_time/feature/schedule/bloc/schedule_bloc.dart';
import 'package:gtu_time/feature/schedule/domain/entity/day_schedule.dart';
import 'package:gtu_time/feature/schedule/domain/entity/lesson.dart';
import 'package:gtu_time/feature/schedule/presentation/components/choose_subgroup_bottom_sheet.dart';
import 'package:gtu_time/feature/schedule/presentation/components/lesson_widget.dart';
import 'package:gtu_time/feature/schedule/presentation/schedule_scope.dart';
import 'package:gtu_time/feature/settings/presentation/settings_bottom_sheet.dart';
import 'package:intl/intl.dart';

class SchedulePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final spacings = context.theme.spacings;
    final selectedGroup = SelectedGroupScope.groupOf(context, listen: true)!;
    return ScheduleScope(
      key: ValueKey(selectedGroup.number),
      group: selectedGroup.number,
      child: Material(
        child: Column(
          children: [
            // Фиксированная шапка: группа + настройки
            Padding(
              padding: EdgeInsets.fromLTRB(spacings.s16, MediaQuery.paddingOf(context).top, spacings.s16, spacings.s8),
              child: _GroupHeader(selectedGroup: selectedGroup),
            ),
            Expanded(child: const _Body()),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  static const _initialPageOffset = 1000;

  late final PageController _pageController;
  int selectedWeekDay = 1;

  @override
  void initState() {
    super.initState();
    selectedWeekDay = DateTime.now().weekday;
    _pageController = PageController(initialPage: _initialPageOffset + selectedWeekDay - 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectWeekDay(int weekDay) {
    setState(() => selectedWeekDay = weekDay);
    if (_pageController.hasClients) {
      _pageController.jumpToPage(_initialPageOffset + selectedWeekDay - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final spacings = context.theme.spacings;
    final selectedGroup = SelectedGroupScope.groupOf(context, listen: true);
    final selectedSubgroup = SelectedGroupScope.subgroupOf(context, listen: true);
    final subgroups = ScheduleScope.subgroupsOf(context, group: selectedGroup!, listen: true);
    final schedule = ScheduleScope.scheduleOf(context, group: selectedGroup, listen: true) ?? [];

    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverToBoxAdapter(
          child: Padding(
            padding: .only(left: spacings.s16, right: spacings.s20, bottom: spacings.s8),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Flexible(
                  child: Selector(
                    onTap: () async {
                      final res = await ChooseSubgroupBottomSheet.show(
                        context,
                        subgroups: subgroups,
                        initialSelectedValue: selectedSubgroup,
                      );
                      if (!context.mounted || res == null || res == selectedSubgroup) return;
                      SelectedGroupScope.changeSubgroup(context, newValue: res);
                    },
                    title: selectedSubgroup ?? context.l10n.subgroup_all,
                    isDisabled: subgroups.isEmpty,
                  ),
                ),
                Text(
                  DateFormat('dd MMMM yyy').format(DateTime.now()),
                  style: context.theme.textStyles.ag18.copyWith(color: context.theme.colorsPalette.text.secondary),
                ),
              ],
            ),
          ),
        ),
      ],
      body: Column(
        children: [
          _WeekDaysBar(schedule: schedule, selectedWeekDay: selectedWeekDay, onSelected: _selectWeekDay),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => selectedWeekDay = (index - _initialPageOffset) % 7 + 1);
              },
              itemBuilder: (context, index) {
                final itemIndex = (index - _initialPageOffset) % 7;
                final allLessons = schedule.length > itemIndex ? schedule.elementAt(itemIndex).lessons : <Lesson>[];
                final lessons = selectedSubgroup == null
                    ? allLessons
                    : allLessons
                          .where(
                            (item) => item.entries.any((e) => e.subgroup == null || e.subgroup == selectedSubgroup),
                          )
                          .toList();
                return _DayPage(
                  itemIndex: itemIndex,
                  lessons: lessons,
                  onBrowseAnotherDay: () => _selectWeekDay(selectedWeekDay + 1),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  final Group? selectedGroup;
  const _GroupHeader({required this.selectedGroup});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.theme.spacings.s12,
      children: [
        Expanded(
          child: InkWell(
            highlightColor: context.theme.colorsPalette.interactive.pressed,
            onTap: () => context.push(CommonRoutes.chooseGroup.path),
            borderRadius: context.theme.radiuses.s12.circular,
            child: Padding(
              padding: .all(context.theme.spacings.s4),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    spacing: context.theme.spacings.s8,
                    children: [
                      Flexible(
                        child: Text(
                          selectedGroup?.number ?? '-',
                          style: context.theme.textStyles.ag27.copyWith(
                            color: context.theme.colorsPalette.text.primary,
                          ),
                        ),
                      ),
                      Assets.icons.chevronRight20.svg(colorFilter: context.theme.colorsPalette.brand.primary.filter),
                    ],
                  ),
                  Text(
                    selectedGroup?.faculty ?? '-',
                    style: context.theme.textStyles.ag28.copyWith(color: context.theme.colorsPalette.text.secondary),
                  ),
                ],
              ),
            ),
          ),
        ),
        PrimaryButton(
          onTap: () => SettingsBottomSheet.show(context),
          outerPadding: .all(context.theme.spacings.s12),
          type: .secondary,
          leftIcon: Assets.icons.settings20.svg(colorFilter: context.theme.colorsPalette.text.primary.filter),
        ),
      ],
    );
  }
}

class _WeekDaysBar extends StatelessWidget {
  final List<DaySchedule> schedule;
  final int selectedWeekDay;
  final ValueChanged<int> onSelected;

  const _WeekDaysBar({required this.schedule, required this.selectedWeekDay, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final spacings = context.theme.spacings;

    return Padding(
      padding: .symmetric(horizontal: spacings.s20),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: .generate(7, (i) {
          final date = DateTime(1).add(Duration(days: i));
          final isSelected = date.weekday == selectedWeekDay;
          final isToday = DateTime.now().weekday == date.weekday;
          final hasLessons = schedule.length > i && schedule.elementAt(i).lessons.isNotEmpty;

          return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 44),
            child: Material(
              color: isSelected
                  ? context.theme.colorsPalette.brand.primary
                  : context.theme.colorsPalette.surfaces.glass,
              shape: RoundedRectangleBorder(
                borderRadius: spacings.s14.circular,
                side: BorderSide(
                  color: isSelected || isToday
                      ? context.theme.colorsPalette.brand.primary
                      : context.theme.colorsPalette.bordersAndLights.defaultColor,
                ),
              ),
              child: InkWell(
                borderRadius: spacings.s14.circular,
                onTap: () => onSelected(date.weekday),
                child: Padding(
                  padding: .symmetric(vertical: spacings.s10),
                  child: Center(
                    child: Column(
                      spacing: spacings.s2,
                      children: [
                        Text(
                          DateFormat.EEEEE().format(date),
                          style: context.theme.textStyles.ag29.copyWith(
                            color: isSelected
                                ? context.theme.colorsPalette.text.onPrimary
                                : context.theme.colorsPalette.text.primary,
                          ),
                        ),
                        Container(
                          width: spacings.s4,
                          height: spacings.s4,
                          decoration: hasLessons
                              ? BoxDecoration(
                                  color: isSelected
                                      ? context.theme.colorsPalette.text.onPrimary
                                      : context.theme.colorsPalette.text.tertiary,
                                  borderRadius: spacings.s4.circular,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _DayPage extends StatelessWidget {
  final int itemIndex;
  final List<Lesson> lessons;
  final VoidCallback onBrowseAnotherDay;

  const _DayPage({required this.itemIndex, required this.lessons, required this.onBrowseAnotherDay});

  @override
  Widget build(BuildContext context) {
    final spacings = context.theme.spacings;

    return RefreshIndicator(
      onRefresh: () => ScheduleScope.refresh(context),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacings.s16),
        child: Column(
          children: [
            SizedBox(height: spacings.s12),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          DateFormat.EEEE().format(DateTime(1).add(Duration(days: itemIndex))).capitalize(),
                          style: context.theme.textStyles.ag22.copyWith(
                            color: context.theme.colorsPalette.text.primary,
                          ),
                        ),
                      ),
                      if (context.watch<ScheduleBloc>().state.isProgress)
                        SizedBox.square(
                          dimension: spacings.s18,
                          child: CircularProgressIndicator(strokeWidth: 1, year2023: false),
                        ),
                    ],
                  ),
                ),

                Text(
                  context.l10n.classes_count(lessons.length),
                  style: context.theme.textStyles.ag18.copyWith(color: context.theme.colorsPalette.text.secondary),
                ),
                SizedBox(width: spacings.s4),
              ],
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CustomScrollView(
                    // Без явного controller: страница подхватывает общий скролл NestedScrollView
                    physics: const ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    slivers: [
                      SliverToBoxAdapter(child: SizedBox(height: spacings.s12)),
                      if (lessons.isNotEmpty)
                        SliverList.separated(
                          itemCount: lessons.length,
                          separatorBuilder: (_, _) => SizedBox(height: spacings.s8),
                          itemBuilder: (context, index) {
                            final lesson = lessons[index];
                            final lessonWidget = LessonWidget(
                              lesson: lesson,
                              weekday: itemIndex + 1,
                              key: ObjectKey(lesson),
                            );

                            if (index < lessons.length - 1) {
                              final diff = lesson.lessonEnd.difference(lessons[index + 1].lessonStart);
                              if (diff.inMinutes > 0) {
                                return Column(
                                  spacing: spacings.s8,
                                  children: [
                                    lessonWidget,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      spacing: spacings.s8,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: spacings.s2),
                                          child: Assets.icons.coffee14.svg(
                                            colorFilter: context.theme.colorsPalette.text.secondary.filter,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            context.formatFreePeriod(diff),
                                            style: context.theme.textStyles.ag28.copyWith(
                                              color: context.theme.colorsPalette.text.secondary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            }
                            return lessonWidget;
                          },
                        )
                      else
                        SliverToBoxAdapter(child: _EmptyDayCard(onBrowseAnotherDay: onBrowseAnotherDay)),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: spacings.s16,
                            right: spacings.s16,
                            left: spacings.s16,
                            bottom: spacings.s16 + MediaQuery.paddingOf(context).bottom,
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Builder(
                              builder: (context) {
                                final lastUpdateDate = ScheduleScope.lastUpdateOf(context, listen: true);
                                if (lastUpdateDate == null) return const SizedBox.shrink();
                                return Text(
                                  lastUpdateDate.isToday
                                      ? context.l10n.last_updated_today(DateFormat('HH:mm').format(lastUpdateDate))
                                      : context.l10n.last_updated(DateFormat('dd MMM yyyy').format(lastUpdateDate)),
                                  style: context.theme.textStyles.ag28.copyWith(
                                    color: context.theme.colorsPalette.text.secondary,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Градиенты сверху и снизу
                  Positioned.fill(
                    child: IgnorePointer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: double.infinity,
                            height: spacings.s12,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  context.theme.colorsPalette.background.base,
                                  context.theme.colorsPalette.background.base.withAlpha(0),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.paddingOf(context).bottom + spacings.s12,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  context.theme.colorsPalette.background.base,
                                  context.theme.colorsPalette.background.base.withAlpha(0),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyDayCard extends StatelessWidget {
  final VoidCallback onBrowseAnotherDay;
  const _EmptyDayCard({required this.onBrowseAnotherDay});

  @override
  Widget build(BuildContext context) {
    final spacings = context.theme.spacings;

    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorsPalette.surfaces.glassStrong,
        border: Border.all(color: context.theme.colorsPalette.bordersAndLights.defaultColor),
        borderRadius: context.theme.radiuses.s16.circular,
      ),
      padding: EdgeInsets.all(spacings.s24),
      child: Column(
        spacing: spacings.s16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: context.theme.colorsPalette.brand.selection,
              borderRadius: context.theme.radiuses.s18.circular,
            ),
            alignment: Alignment.center,
            child: Assets.icons.calendarCheck28.svg(colorFilter: context.theme.colorsPalette.brand.primary.filter),
          ),
          Text(
            context.l10n.day_without_classes_title,
            style: context.theme.textStyles.ag21.copyWith(color: context.theme.colorsPalette.text.primary),
          ),
          Text(
            context.l10n.day_without_classes_description,
            style: context.theme.textStyles.ag23.copyWith(color: context.theme.colorsPalette.text.primary),
          ),
          PrimaryButton(
            onTap: onBrowseAnotherDay,
            title: context.l10n.browse_another_day,
            alignment: Alignment.center,
            type: .secondary,
          ),
        ],
      ),
    );
  }
}
