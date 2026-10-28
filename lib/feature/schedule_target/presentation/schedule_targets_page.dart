import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/error/components/error_card.dart';
import 'package:gtu_time/core/error/error_handler.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/router/routes_enum.dart';
import 'package:gtu_time/core/ui_kit/ui_kit.dart';
import 'package:gtu_time/feature/schedule_target/bloc/groups_bloc.dart';
import 'package:gtu_time/feature/schedule_target/bloc/teachers_bloc.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/group.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/schedule_target_type.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/teacher.dart';
import 'package:gtu_time/feature/schedule_target/presentation/components/no_groups_found_card.dart';
import 'package:gtu_time/feature/schedule_target/presentation/components/no_teachers_found_card.dart';
import 'package:gtu_time/feature/schedule_target/presentation/components/search_target_tile.dart';
import 'package:gtu_time/feature/schedule_target/presentation/components/top_bar.dart';
import 'package:gtu_time/feature/schedule_target/presentation/schedule_targets_scope.dart';
import 'package:gtu_time/feature/schedule_target/presentation/selected_targets_scope.dart';

const double _searchHeaderHeight = 64;

class ScheduleTargetScreen extends StatelessWidget {
  const ScheduleTargetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScheduleTargetsScope(
      child: Material(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                context.theme.spacings.s16,
                MediaQuery.paddingOf(context).top + context.theme.spacings.s2,
                context.theme.spacings.s16,
                context.theme.spacings.s16,
              ),
              child: TopBar(),
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
  late final _searchController = TextEditingController();
  ScheduleTargetType _targetType = .group;
  Group? _selectedGroup;
  Teacher? _selectedTeacher;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (_selectedGroup == null && _targetType == .group) return;
    if (_selectedTeacher == null && _targetType == .teacher) return;

    final currentTargets = SelectedTargetsScope.targetsOf(context);
    if (_targetType == .group && !currentTargets.any((e) => e.group == _selectedGroup)) {
      SelectedTargetsScope.addGroup(context, group: _selectedGroup!);
    } else if (_targetType == .teacher && !currentTargets.any((e) => e.teacher == _selectedTeacher)) {
      SelectedTargetsScope.addTeacher(context, teacher: _selectedTeacher!);
    }
    if (context.canPop()) {
      context.pop();
    } else {
      context.replace(CommonRoutes.schedule.path);
    }
  }

  Future<void> _onRefresh() => _targetType == .group
      ? ScheduleTargetsScope.refreshGroups(context)
      : ScheduleTargetsScope.refreshTeachers(context);

  void _changeTargetType(ScheduleTargetType target) {
    setState(() => _targetType = target);
    if (target == .group) {
      ScheduleTargetsScope.initGroups(context);
    } else {
      ScheduleTargetsScope.initTeachers(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final spacings = context.theme.spacings;

    return Column(
      children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: _searchController,
            builder: (context, _, _) {
              final query = _searchController.text.trim().toLowerCase();
              final searchGroups = _targetType != .group
                  ? <Group>[]
                  : ScheduleTargetsScope.groupsOf(context, listen: true)
                        .where(
                          (e) => query.isEmpty || (e.number.trim() + e.faculty.trim()).toLowerCase().contains(query),
                        )
                        .toList();
              final searchTeachers = _targetType != .teacher
                  ? <Teacher>[]
                  : ScheduleTargetsScope.teachersOf(context, listen: true)
                        .where(
                          (e) =>
                              query.isEmpty ||
                              e.name.values.any((l) => l.join().toLowerCase().contains(query.toLowerCase())) ||
                              e.programs.join().toLowerCase().contains(query.toLowerCase()),
                        )
                        .toList();

              return Stack(
                fit: StackFit.expand,
                children: [
                  RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: CustomScrollView(
                      physics: const ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      slivers: [
                        // Блок, который скрывается при скролле
                        SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: spacings.s16),
                          sliver: SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PrimaryTabBar<ScheduleTargetType>(
                                  onTap: _changeTargetType,
                                  items: ScheduleTargetType.values
                                      .map(
                                        (e) => PrimaryTabBarItem(
                                          value: e,
                                          title: e.localize(context),
                                          isSelected: _targetType == e,
                                        ),
                                      )
                                      .toList(),
                                ),
                                Padding(
                                  padding: .symmetric(vertical: spacings.s4),
                                  child: AnimatedSize(
                                    duration: kThemeAnimationDuration,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _targetType.searchTitle(context),
                                          style: context.theme.textStyles.ag34.copyWith(
                                            color: context.theme.colorsPalette.text.primary,
                                          ),
                                        ),
                                        Text(
                                          _targetType.searchDescription(context),
                                          style: context.theme.textStyles.ag23.copyWith(
                                            color: context.theme.colorsPalette.text.secondary,
                                          ),
                                        ),
                                        SizedBox(width: double.infinity),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Закреплённый поиск
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: _PinnedHeaderDelegate(
                            height: _searchHeaderHeight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: spacings.s16, vertical: spacings.s8),
                              child: PrimaryInput(
                                hintText: _targetType.searchHint(context),
                                controller: _searchController,
                                prefixWidget: SizedBox.square(
                                  dimension: spacings.s18,
                                  child: Assets.icons.search18.svg(
                                    colorFilter: context.theme.colorsPalette.text.secondary.filter,
                                  ),
                                ),
                                suffixWidget: ValueListenableBuilder(
                                  valueListenable: _searchController,
                                  builder: (context, value, _) {
                                    return value.text.trim().isEmpty
                                        ? const SizedBox.shrink()
                                        : GestureDetector(
                                            onTap: _searchController.clear,
                                            child: Assets.icons.circleX18.svg(
                                              colorFilter: context.theme.colorsPalette.text.secondary.filter,
                                            ),
                                          );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Заголовок списка + счётчик
                        SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: spacings.s16, vertical: spacings.s8),
                          sliver: SliverToBoxAdapter(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    query.isEmpty ? _targetType.itemsListTitle(context) : context.l10n.search_results,
                                    style: context.theme.textStyles.ag24.copyWith(
                                      color: context.theme.colorsPalette.text.secondary,
                                    ),
                                  ),
                                ),
                                if (searchGroups.isNotEmpty)
                                  Text(
                                    context.l10n.groups_count(searchGroups.length),
                                    style: context.theme.textStyles.ag28.copyWith(
                                      color: context.theme.colorsPalette.text.secondary,
                                    ),
                                  )
                                else if (searchTeachers.isNotEmpty)
                                  Text(
                                    context.l10n.teachers_count(searchTeachers.length),
                                    style: context.theme.textStyles.ag28.copyWith(
                                      color: context.theme.colorsPalette.text.secondary,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),

                        // Контент
                        SliverPadding(
                          padding: EdgeInsets.fromLTRB(spacings.s16, spacings.s8, spacings.s16, spacings.s24),
                          sliver: _buildContent(context, searchGroups, searchTeachers),
                        ),
                      ],
                    ),
                  ),

                  // Градиент снизу
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: IgnorePointer(
                      child: Container(
                        height: spacings.s12,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              context.theme.colorsPalette.background.base.withAlpha(0),
                              context.theme.colorsPalette.background.base,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacings.s16),
          child: Column(
            children: [
              AnimatedCrossFade(
                firstChild: const SizedBox(width: double.infinity),
                secondChild: Padding(
                  padding: EdgeInsets.only(bottom: spacings.s10),
                  child: Text(
                    _targetType == .group
                        ? context.l10n.group_selected_hint(_selectedGroup?.number ?? '')
                        : _selectedTeacher?.localizedNameOf(context) ?? '',
                    style: context.theme.textStyles.ag28.copyWith(color: context.theme.colorsPalette.text.secondary),
                    textAlign: .center,
                  ),
                ),
                crossFadeState:
                    _selectedGroup == null && _targetType == .group ||
                        _selectedTeacher == null && _targetType == .teacher
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: kThemeAnimationDuration,
              ),
              PrimaryButton(
                onTap: _onContinue,
                title: context.l10n.continue_button,
                leftIcon: AnimatedCrossFade(
                  firstChild: const SizedBox(height: 18),
                  secondChild: Assets.icons.arrowRight18.svg(
                    colorFilter: context.theme.colorsPalette.background.elevated.filter,
                  ),
                  crossFadeState:
                      _selectedGroup == null && _targetType == .group ||
                          _selectedTeacher == null && _targetType == .teacher
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: kThemeAnimationDuration,
                ),
                alignment: Alignment.center,
                isDisabled:
                    _selectedGroup == null && _targetType == .group ||
                    _selectedTeacher == null && _targetType == .teacher,
              ),
              SizedBox(height: MediaQuery.paddingOf(context).bottom),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context, List<Group> searchGroups, List<Teacher> searchTeachers) {
    final spacings = context.theme.spacings;

    if (_targetType == .group) {
      final state = context.watch<GroupsBloc>().state;
      if (state.groups != null) {
        if (searchGroups.isEmpty) {
          return SliverToBoxAdapter(child: NoGroupsFoundCard(searchController: _searchController));
        }
        return SliverList.separated(
          itemCount: searchGroups.length,
          separatorBuilder: (_, _) => SizedBox(height: spacings.s16),
          itemBuilder: (_, index) {
            final group = searchGroups[index];
            final groupCard = SearchTargetTile.group(
              group: group,
              isSelected: _selectedGroup == group,
              onTap: () => setState(() => _selectedGroup = group),
            );
            if (index == 0 && state.error != null) {
              return Column(
                spacing: spacings.s16,
                children: [
                  ErrorCard(
                    error: state.error!,
                    actionsBuilder: (context) => [
                      PrimaryButton(alignment: .center, title: context.l10n.try_again, onTap: _onRefresh),
                    ],
                  ),
                  groupCard,
                ],
              );
            }
            return groupCard;
          },
        );
      }

      if (state.isProgress) {
        return _buildProgressList();
      }

      return _buildErrorTile(state.error);
    }

    final state = context.watch<TeachersBloc>().state;
    if (state.teachers != null) {
      if (searchTeachers.isEmpty) {
        return SliverToBoxAdapter(child: NoTeachersFoundCard(searchController: _searchController));
      }
      return SliverList.separated(
        itemCount: searchTeachers.length,
        separatorBuilder: (_, _) => SizedBox(height: spacings.s16),
        itemBuilder: (_, index) {
          final teacher = searchTeachers[index];
          final teacherCard = SearchTargetTile.teacher(
            teacher: teacher,
            isSelected: _selectedTeacher == teacher,
            onTap: () => setState(() => _selectedTeacher = teacher),
          );
          if (index == 0 && state.error != null) {
            return Column(
              spacing: spacings.s16,
              children: [
                ErrorCard(
                  error: state.error!,
                  actionsBuilder: (context) => [
                    PrimaryButton(alignment: .center, title: context.l10n.try_again, onTap: _onRefresh),
                  ],
                ),
                teacherCard,
              ],
            );
          }
          return teacherCard;
        },
      );
    }
    if (state.isProgress) {
      return _buildProgressList();
    }

    return _buildErrorTile(state.error);
  }

  SliverToBoxAdapter _buildErrorTile(IErrorHandler? error) => SliverToBoxAdapter(
    child: error == null
        ? PrimaryButton(onTap: _onRefresh, title: context.l10n.try_again, alignment: Alignment.center)
        : ErrorCard(
            error: error,
            actionsBuilder: (context) => [
              PrimaryButton(alignment: .center, title: context.l10n.try_again, onTap: _onRefresh),
            ],
          ),
  );

  SliverList _buildProgressList() => SliverList.separated(
    itemCount: 6,
    separatorBuilder: (_, _) => SizedBox(height: context.theme.spacings.s16),
    itemBuilder: (_, _) => SearchTargetTile.loading(),
  );
}

class _PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  _PinnedHeaderDelegate({required this.height, required this.child});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(color: context.theme.colorsPalette.background.base, child: child);
  }

  @override
  bool shouldRebuild(covariant _PinnedHeaderDelegate oldDelegate) => true;
}
