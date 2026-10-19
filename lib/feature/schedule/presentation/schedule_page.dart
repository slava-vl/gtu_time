import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/extension/src/string_extension.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/router/routes_enum.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/core/ui_kit/ui_kit.dart';
import 'package:gtu_time/feature/group/presentation/selected_group_scope.dart';
import 'package:gtu_time/feature/schedule/domain/entity/lesson.dart';
import 'package:gtu_time/feature/schedule/presentation/components/choose_subgroup_bottom_sheet.dart';
import 'package:gtu_time/feature/schedule/presentation/components/lesson_widget.dart';
import 'package:gtu_time/feature/schedule/presentation/schedule_main_scope.dart';
import 'package:gtu_time/feature/settings/presentation/settings_bottom_sheet.dart';
import 'package:intl/intl.dart';

const double _maxAppbarHeight = 124;
const double _minAppbarHeight = 68;

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late final DraggableScrollableController _controller;
  late final ValueNotifier<double> _progressNotifier;

  late double _minSheetSize;
  late double _maxSheetSize;

  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController()..addListener(_handleScroll);
    _progressNotifier = ValueNotifier<double>(0);
  }

  @override
  void didChangeDependencies() {
    final deviceHeight = MediaQuery.sizeOf(context).height;
    final topPadding = MediaQuery.paddingOf(context).top;
    _minSheetSize = (deviceHeight - _maxAppbarHeight - topPadding) / deviceHeight;
    _maxSheetSize = (deviceHeight - _minAppbarHeight - topPadding) / deviceHeight;
    super.didChangeDependencies();
  }

  void _handleScroll() {
    final progress = (_controller.size - _minSheetSize) / (_maxSheetSize - _minSheetSize);

    if (progress != _progressNotifier.value) {
      _progressNotifier.value = progress;
    }
  }

  double get _collapsedHeaderOpacity => ((_progressNotifier.value - 0.2) * 3).clamp(0.0, 1.0);

  @override
  Widget build(BuildContext context) {
    final selectedGroup = SelectedGroupScope.groupOf(context, listen: true);
    final selectedSubgroup = SelectedGroupScope.subgroupOf(context, listen: true);

    final subgroups = ScheduleMainScope.subgroupsOf(context, group: selectedGroup ?? '', listen: true);

    return Material(
      child: Stack(
        fit: .expand,
        children: [
          Positioned(
            top: MediaQuery.paddingOf(context).top,
            right: context.theme.spacings.s16,
            left: context.theme.spacings.s16,
            height: 112,
            child: Column(
              spacing: context.theme.spacings.s8,
              children: [
                Row(
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
                                      selectedGroup ?? '-',
                                      style: context.theme.textStyles.ag27.copyWith(
                                        color: context.theme.colorsPalette.text.primary,
                                      ),
                                    ),
                                  ),
                                  Assets.icons.chevronRight20.svg(
                                    colorFilter: context.theme.colorsPalette.brand.primary.filter,
                                  ),
                                ],
                              ),
                              Text(
                                'Computer Science',
                                style: context.theme.textStyles.ag28.copyWith(
                                  color: context.theme.colorsPalette.text.secondary,
                                ),
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
                      leftIcon: Assets.icons.settings20.svg(
                        colorFilter: context.theme.colorsPalette.text.primary.filter,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: .only(right: context.theme.spacings.s4),
                  child: ValueListenableBuilder(
                    valueListenable: _progressNotifier,
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: 1 - _collapsedHeaderOpacity,
                        child: Column(
                          children: [
                            Row(
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
                                  DateTime.now().year.toString(),
                                  style: context.theme.textStyles.ag18.copyWith(
                                    color: context.theme.colorsPalette.text.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            controller: _controller,
            initialChildSize: _minSheetSize,
            minChildSize: _minSheetSize,
            maxChildSize: _maxSheetSize,
            snap: true,
            snapAnimationDuration: kThemeAnimationDuration,
            builder: (context, scrollController) => _Body(scrollController: scrollController),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final ScrollController scrollController;
  const new({required this.scrollController});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final PageController _pageController;
  static const _initialPageOffset = 1000;
  int selectedWeekDay = 1;
  @override
  void initState() {
    selectedWeekDay = DateTime.now().weekday;
    _pageController = PageController(initialPage: _initialPageOffset + selectedWeekDay - 1);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedGroup = SelectedGroupScope.groupOf(context, listen: true) ?? '';
    final selectedSubgroup = SelectedGroupScope.subgroupOf(context, listen: true);

    final schedule = ScheduleMainScope.scheduleOf(context, group: selectedGroup, listen: true) ?? [];

    return ColoredBox(
      color: context.theme.colorsPalette.background.base,
      child: Column(
        children: [
          Padding(
            padding: .symmetric(horizontal: context.theme.spacings.s20),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: List.generate(7, (i) {
                final date = DateTime(1).add(Duration(days: i));
                final isSelected = date.weekday == selectedWeekDay;
                final isToday = DateTime.now().weekday == date.weekday;
                final hasLessons = schedule.length > i && schedule.elementAt(i).lessons.isNotEmpty;

                return ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 44),
                  child: Material(
                    color: isSelected
                        ? context.theme.colorsPalette.brand.primary
                        : context.theme.colorsPalette.surfaces.glass,
                    shape: RoundedRectangleBorder(
                      borderRadius: context.theme.spacings.s14.circular,

                      side: BorderSide(
                        color: isSelected || isToday
                            ? context.theme.colorsPalette.brand.primary
                            : context.theme.colorsPalette.bordersAndLights.defaultColor,
                      ),
                    ),
                    child: InkWell(
                      borderRadius: context.theme.spacings.s14.circular,
                      onTap: () {
                        setState(() => selectedWeekDay = date.weekday);
                        if (_pageController.hasClients) {
                          _pageController.jumpToPage(_initialPageOffset + selectedWeekDay - 1);
                        }
                      },
                      child: Padding(
                        padding: .symmetric(vertical: context.theme.spacings.s10),
                        child: Center(
                          child: Column(
                            spacing: context.theme.spacings.s2,
                            children: [
                              Text(
                                DateFormat.E().format(date)[0].toUpperCase(),
                                style: context.theme.textStyles.ag29.copyWith(
                                  color: isSelected
                                      ? context.theme.colorsPalette.text.onPrimary
                                      : context.theme.colorsPalette.text.primary,
                                ),
                              ),
                              Container(
                                width: context.theme.spacings.s4,
                                height: context.theme.spacings.s4,
                                decoration: hasLessons
                                    ? BoxDecoration(
                                        color: isSelected
                                            ? context.theme.colorsPalette.text.onPrimary
                                            : context.theme.colorsPalette.text.tertiary,
                                        borderRadius: context.theme.spacings.s4.circular,
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
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedWeekDay = (index - _initialPageOffset) % 7 + 1;
                });
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
                return RefreshIndicator(
                  onRefresh: () => ScheduleMainScope.refresh(context),
                  child: Padding(
                    padding: .symmetric(horizontal: context.theme.spacings.s16),
                    child: Column(
                      children: [
                        SizedBox(height: context.theme.spacings.s12),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                DateFormat.EEEE().format(DateTime(1).add(Duration(days: itemIndex))).capitalize(),
                                style: context.theme.textStyles.ag22.copyWith(
                                  color: context.theme.colorsPalette.text.primary,
                                ),
                              ),
                            ),
                            Text(
                              context.l10n.classes_count(lessons.length),
                              style: context.theme.textStyles.ag18.copyWith(
                                color: context.theme.colorsPalette.text.secondary,
                              ),
                            ),
                            SizedBox(width: context.theme.spacings.s4),
                          ],
                        ),
                        Expanded(
                          child: Stack(
                            fit: .expand,
                            children: [
                              CustomScrollView(
                                physics: ClampingScrollPhysics(),
                                controller: widget.scrollController,
                                slivers: [
                                  SliverToBoxAdapter(child: SizedBox(height: context.theme.spacings.s12)),
                                  if (lessons.isNotEmpty)
                                    SliverList.separated(
                                      itemBuilder: (context, index) {
                                        final lesson = lessons[index];
                                        if (index < lessons.length - 1) {
                                          final differenceWithNextLesson = lesson.lessonEnd.difference(
                                            lessons[index + 1].lessonStart,
                                          );
                                          if (differenceWithNextLesson.inMinutes > 0) {
                                            return Column(
                                              spacing: context.theme.spacings.s8,
                                              children: [
                                                LessonWidget(
                                                  lesson: lesson,
                                                  weekday: itemIndex + 1,
                                                  key: ObjectKey(lesson),
                                                ),
                                                Row(
                                                  mainAxisAlignment: .center,
                                                  spacing: context.theme.spacings.s8,
                                                  children: [
                                                    Padding(
                                                      padding: .only(bottom: context.theme.spacings.s2),
                                                      child: Assets.icons.coffee14.svg(
                                                        colorFilter: context.theme.colorsPalette.text.secondary.filter,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        context.l10n.free_period(
                                                          differenceWithNextLesson.inMinutes ~/ 60,
                                                          differenceWithNextLesson.inMinutes % 60,
                                                        ),
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
                                        return LessonWidget(
                                          lesson: lesson,
                                          weekday: itemIndex + 1,
                                          key: ObjectKey(lesson),
                                        );
                                      },
                                      separatorBuilder: (context, index) => SizedBox(height: context.theme.spacings.s8),
                                      itemCount: lessons.length,
                                    )
                                  else
                                    SliverToBoxAdapter(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: context.theme.colorsPalette.surfaces.glassStrong,
                                          border: .all(
                                            color: context.theme.colorsPalette.bordersAndLights.defaultColor,
                                          ),
                                          borderRadius: context.theme.radiuses.s16.circular,
                                        ),
                                        padding: .all(context.theme.spacings.s24),
                                        child: Column(
                                          spacing: context.theme.spacings.s16,
                                          crossAxisAlignment: .start,
                                          children: [
                                            Container(
                                              width: 56,
                                              height: 56,
                                              decoration: BoxDecoration(
                                                color: context.theme.colorsPalette.brand.selection,
                                                borderRadius: context.theme.radiuses.s18.circular,
                                              ),
                                              alignment: .center,
                                              child: Assets.icons.calendarCheck28.svg(
                                                colorFilter: context.theme.colorsPalette.brand.primary.filter,
                                              ),
                                            ),
                                            Text(
                                              context.l10n.day_without_classes_title,
                                              style: context.theme.textStyles.ag21.copyWith(
                                                color: context.theme.colorsPalette.text.primary,
                                              ),
                                            ),
                                            Text(
                                              context.l10n.day_without_classes_description,
                                              style: context.theme.textStyles.ag23.copyWith(
                                                color: context.theme.colorsPalette.text.primary,
                                              ),
                                            ),
                                            PrimaryButton(
                                              onTap: () {
                                                setState(() => selectedWeekDay++);
                                                if (_pageController.hasClients) {
                                                  _pageController.jumpToPage(_initialPageOffset + selectedWeekDay - 1);
                                                }
                                              },
                                              title: context.l10n.browse_another_day,
                                              alignment: .center,
                                              type: .secondary,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                  SliverFillRemaining(
                                    hasScrollBody: false,
                                    child: Padding(
                                      padding: .only(
                                        top: context.theme.spacings.s16,
                                        right: context.theme.spacings.s16,
                                        left: context.theme.spacings.s16,
                                        bottom: context.theme.spacings.s16 + MediaQuery.paddingOf(context).bottom,
                                      ),
                                      child: Align(
                                        alignment: .bottomCenter,
                                        child: Builder(
                                          builder: (context) {
                                            final lastUpdateDate = ScheduleMainScope.lastUpdateOf(
                                              context,
                                              listen: true,
                                            );
                                            if (lastUpdateDate == null) return const SizedBox.shrink();
                                            return Text(
                                              lastUpdateDate.isToday
                                                  ? context.l10n.last_updated_today(
                                                      DateFormat('HH:mm').format(lastUpdateDate),
                                                    )
                                                  : context.l10n.last_updated(
                                                      DateFormat('dd MMM yyyy').format(lastUpdateDate),
                                                    ),
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
                              Positioned.fill(
                                child: Column(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: context.theme.spacings.s12,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: .topCenter,
                                          end: .bottomCenter,
                                          colors: [
                                            context.theme.colorsPalette.background.base,
                                            context.theme.colorsPalette.background.base.withAlpha(0),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: MediaQuery.paddingOf(context).bottom + context.theme.spacings.s12,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          end: .topCenter,
                                          begin: .bottomCenter,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
