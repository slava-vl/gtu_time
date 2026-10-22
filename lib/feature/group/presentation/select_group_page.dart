import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/error/components/error_card.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/router/routes_enum.dart';
import 'package:gtu_time/core/ui_kit/ui_kit.dart';
import 'package:gtu_time/feature/group/bloc/groups_bloc.dart';
import 'package:gtu_time/feature/group/domain/entity/group.dart';
import 'package:gtu_time/feature/group/presentation/components/group_tile.dart';
import 'package:gtu_time/feature/group/presentation/components/no_groups_found_card.dart';
import 'package:gtu_time/feature/group/presentation/components/top_bar.dart';
import 'package:gtu_time/feature/group/presentation/groups_scope.dart';
import 'package:gtu_time/feature/group/presentation/selected_group_scope.dart';

const double _searchHeaderHeight = 64;

class SelectGroupPage extends StatelessWidget {
  const SelectGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupsScope(
      child: Material(
        child: Column(
          children: [
            // Фиксированная шапка
            Padding(
              padding: EdgeInsets.fromLTRB(
                context.theme.spacings.s16,
                MediaQuery.paddingOf(context).top+context.theme.spacings.s2,
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
  late final TextEditingController _searchController = TextEditingController();
  Group? selectedGroup;

  @override
  void initState() {
    selectedGroup = SelectedGroupScope.groupOf(context);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (selectedGroup == null) return;
    if (selectedGroup != SelectedGroupScope.groupOf(context)) {
      SelectedGroupScope.change(context, newValue: selectedGroup!);
    }
    if (context.canPop()) {
      context.pop();
    } else {
      context.replace(CommonRoutes.schedule.path);
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
              final searchGroups = GroupsScope.groupsOf(context, listen: true)
                  .where((e) => query.isEmpty || (e.number.trim() + e.faculty.trim()).toLowerCase().contains(query))
                  .toList();

              return BlocBuilder<GroupsBloc, GroupsState>(
                builder: (context, state) {
                  final hideSearch = state.groups == null && state.error != null;

                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      RefreshIndicator(
                        onRefresh: () => GroupsScope.refresh(context),
                        child: CustomScrollView(
                          physics: const ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          slivers: [
                            // Блок, который скрывается при скролле
                            SliverPadding(
                              padding: EdgeInsets.symmetric(horizontal: spacings.s16),
                              sliver: SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: spacings.s16),
                                  child: Column(
                                    spacing: spacings.s8,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        context.l10n.find_your_study_group,
                                        style: context.theme.textStyles.ag34.copyWith(
                                          color: context.theme.colorsPalette.text.primary,
                                        ),
                                      ),
                                      Text(
                                        context.l10n.choose_your_group_description,
                                        style: context.theme.textStyles.ag23.copyWith(
                                          color: context.theme.colorsPalette.text.secondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Закреплённый поиск
                            if (!hideSearch)
                              SliverPersistentHeader(
                                pinned: true,
                                delegate: _PinnedHeaderDelegate(
                                  height: _searchHeaderHeight,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: spacings.s16, vertical: spacings.s8),
                                    child: _SearchField(controller: _searchController, state: state),
                                  ),
                                ),
                              ),

                            // Заголовок списка + счётчик
                            if (state.groups != null && searchGroups.isNotEmpty)
                              SliverPadding(
                                padding: EdgeInsets.fromLTRB(spacings.s16, spacings.s8, spacings.s16, spacings.s8),
                                sliver: SliverToBoxAdapter(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          query.isEmpty ? context.l10n.available_groups : context.l10n.search_results,
                                          style: context.theme.textStyles.ag24.copyWith(
                                            color: context.theme.colorsPalette.text.secondary,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        context.l10n.groups_count(searchGroups.length),
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
                              sliver: _buildContent(context, state, searchGroups),
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
                    context.l10n.group_selected_hint(selectedGroup?.number ?? ''),
                    style: context.theme.textStyles.ag28.copyWith(color: context.theme.colorsPalette.text.secondary),
                  ),
                ),
                crossFadeState: selectedGroup == null ? CrossFadeState.showFirst : CrossFadeState.showSecond,
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
                  crossFadeState: selectedGroup == null ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: kThemeAnimationDuration,
                ),
                alignment: Alignment.center,
                isDisabled: selectedGroup == null,
              ),
              SizedBox(height: MediaQuery.paddingOf(context).bottom),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context, GroupsState state, List<Group> searchGroups) {
    final spacings = context.theme.spacings;

    if (state.groups != null) {
      if (searchGroups.isEmpty) {
        return SliverToBoxAdapter(child: NoGroupsFoundCard(searchController: _searchController));
      }
      return SliverList.separated(
        itemCount: searchGroups.length,
        separatorBuilder: (_, _) => SizedBox(height: spacings.s16),
        itemBuilder: (_, index) {
          final group = searchGroups[index];
          final groupCard = GroupTile.value(
            group: group,
            isSelected: selectedGroup == group,
            onTap: () => setState(() => selectedGroup = group),
          );
          if (index == 0 && state.error != null) {
            return Column(
              spacing: spacings.s16,
              children: [
                ErrorCard(
                  error: state.error!,
                  actionsBuilder: (context) => [
                    PrimaryButton(
                      alignment: .center,
                      title: context.l10n.try_again,
                      onTap: () => GroupsScope.refresh(context),
                    ),
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
      return SliverList.separated(
        itemCount: 6,
        separatorBuilder: (_, _) => SizedBox(height: spacings.s16),
        itemBuilder: (_, _) => GroupTile.loading(),
      );
    }

    return SliverToBoxAdapter(
      child: state.error == null
          ? PrimaryButton(
              onTap: () => GroupsScope.refresh(context),
              title: context.l10n.try_again,
              alignment: Alignment.center,
            )
          : ErrorCard(
              error: state.error!,
              actionsBuilder: (context) => [
                PrimaryButton(
                  alignment: .center,
                  title: context.l10n.try_again,
                  onTap: () => GroupsScope.refresh(context),
                ),
              ],
            ),
    );
  }
}

class _SearchField extends StatelessWidget {
  final TextEditingController controller;
  final GroupsState state;
  const _SearchField({required this.controller, required this.state});

  @override
  Widget build(BuildContext context) {
    final spacings = context.theme.spacings;

    if (state.groups == null && state.isProgress) {
      return SizedBox.expand(
        child: Row(
          spacing: spacings.s4,
          children: [
            SizedBox.square(dimension: spacings.s20, child: CircularProgressIndicator(strokeWidth: 1, year2023: false)),
            Expanded(
              child: Text(
                context.l10n.loading_study_groups,
                style: context.theme.textStyles.ag23.copyWith(color: context.theme.colorsPalette.text.secondary),
              ),
            ),
          ],
        ),
      );
    }

    return PrimaryInput(
      hintText: context.l10n.search_by_group_or_program,
      controller: controller,
      prefixWidget: SizedBox.square(
        dimension: spacings.s18,
        child: state.isProgress
            ? CircularProgressIndicator(strokeWidth: 1, year2023: false)
            : Assets.icons.search18.svg(colorFilter: context.theme.colorsPalette.text.secondary.filter),
      ),
      suffixWidget: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, _) {
          return value.text.trim().isEmpty
              ? const SizedBox.shrink()
              : GestureDetector(
                  onTap: controller.clear,
                  child: Assets.icons.circleX18.svg(colorFilter: context.theme.colorsPalette.text.secondary.filter),
                );
        },
      ),
    );
  }
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
