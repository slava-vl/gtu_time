import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/error/components/error_card.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/router/routes_enum.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/core/ui_kit/ui_kit.dart';
import 'package:gtu_time/feature/group/presentation/components/group_tile.dart';
import 'package:gtu_time/feature/group/presentation/components/no_groups_found_card.dart';
import 'package:gtu_time/feature/group/presentation/selected_group_scope.dart';
import 'package:gtu_time/feature/schedule/bloc/schedule_bloc.dart';
import 'package:gtu_time/feature/schedule/presentation/schedule_main_scope.dart';

const double _maxAppbarHeight = 176;
const double _minAppbarHeight = 72;

class SelectGroupPage extends StatefulWidget {
  const SelectGroupPage({super.key});

  @override
  State<SelectGroupPage> createState() => _SelectGroupPageState();
}

class _SelectGroupPageState extends State<SelectGroupPage> {
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
    return Material(
      child: Stack(
        fit: .expand,
        children: [
          Positioned(
            top: MediaQuery.paddingOf(context).top + context.theme.spacings.s16,
            right: context.theme.spacings.s16,
            left: context.theme.spacings.s16,
            height: 160,
            child: Column(
              spacing: context.theme.spacings.s16,
              children: [
                Row(
                  spacing: context.theme.spacings.s12,
                  children: [
                    if (context.canPop())
                      InkResponse(
                        onTap: context.pop,
                        child: Icon(Icons.arrow_back_ios_new_rounded, color: context.theme.colorsPalette.text.primary),
                      ),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: context.theme.colorsPalette.brand.primary,
                        borderRadius: context.theme.radiuses.s16.circular,
                      ),
                      alignment: .center,
                      child: Text(
                        'GTU',
                        style: context.theme.textStyles.ag16.copyWith(
                          color: context.theme.colorsPalette.text.onPrimary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            context.l10n.gtu_timetable,
                            style: context.theme.textStyles.ag17.copyWith(
                              color: context.theme.colorsPalette.text.primary,
                            ),
                          ),
                          Text(
                            context.l10n.your_academic_day_in_focus,
                            style: context.theme.textStyles.ag18.copyWith(
                              color: context.theme.colorsPalette.text.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: _progressNotifier,
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: 1 - _collapsedHeaderOpacity,
                      child: Column(
                        spacing: context.theme.spacings.s8,
                        crossAxisAlignment: .start,
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
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: DraggableScrollableSheet(
              controller: _controller,
              initialChildSize: _minSheetSize,
              minChildSize: _minSheetSize,
              maxChildSize: _maxSheetSize,
              snap: true,
              snapAnimationDuration: kThemeAnimationDuration,
              builder: (context, scrollController) => _Body(scrollController: scrollController),
            ),
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
  late final _searchController = TextEditingController();
  String? selectedGroup;

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: context.theme.spacings.s16, vertical: context.theme.spacings.s16),
      child: ValueListenableBuilder(
        valueListenable: _searchController,
        builder: (context, value, child) {
          final searchGroups = ScheduleMainScope.groupsOf(context, listen: true)
              .where(
                (e) =>
                    _searchController.text.trim().isEmpty ||
                    e.trim().toLowerCase().contains(_searchController.text.trim().toLowerCase()),
              )
              .toList();
          return Column(
            children: [
              BlocBuilder<ScheduleBloc, ScheduleState>(
                builder: (context, state) {
                  if (state.schedule == null && state.isProgress) {
                    return Row(
                      spacing: context.theme.spacings.s4,
                      children: [
                        SizedBox.square(
                          dimension: context.theme.spacings.s20,
                          child: CircularProgressIndicator(strokeWidth: 1, year2023: false),
                        ),
                        Expanded(
                          child: Text(
                            context.l10n.loading_study_groups,
                            style: context.theme.textStyles.ag23.copyWith(
                              color: context.theme.colorsPalette.text.secondary,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  if (state.schedule == null && state.error != null) return const SizedBox.shrink();
                  return PrimaryInput(
                    hintText: context.l10n.search_by_group_or_program,
                    controller: _searchController,
                    prefixWidget: SizedBox.square(
                      dimension: context.theme.spacings.s18,
                      child: state.isProgress
                          ? CircularProgressIndicator(strokeWidth: 1, year2023: false)
                          : Assets.icons.search18.svg(colorFilter: context.theme.colorsPalette.text.secondary.filter),
                    ),
                    suffixWidget: ValueListenableBuilder(
                      valueListenable: _searchController,
                      builder: (context, value, child) {
                        return value.text.trim().isEmpty
                            ? SizedBox.shrink()
                            : GestureDetector(
                                onTap: _searchController.clear,
                                child: Assets.icons.circleX18.svg(
                                  colorFilter: context.theme.colorsPalette.text.secondary.filter,
                                ),
                              );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: context.theme.spacings.s16),
              if (searchGroups.isNotEmpty)
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _searchController.text.trim().isEmpty
                            ? context.l10n.available_groups
                            : context.l10n.search_results,
                        style: context.theme.textStyles.ag24.copyWith(
                          color: context.theme.colorsPalette.text.secondary,
                        ),
                      ),
                    ),
                    Text(
                      context.l10n.groups_count(searchGroups.length),
                      style: context.theme.textStyles.ag28.copyWith(color: context.theme.colorsPalette.text.secondary),
                    ),
                  ],
                ),
              SizedBox(height: context.theme.spacings.s8),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => ScheduleMainScope.refresh(context),
                  child: Stack(
                    fit: .expand,
                    children: [
                      Positioned.fill(
                        child: CustomScrollView(
                          physics: ClampingScrollPhysics(),
                          controller: widget.scrollController,
                          slivers: [
                            BlocBuilder<ScheduleBloc, ScheduleState>(
                              builder: (context, state) {
                                if (state.schedule != null) {
                                  if (searchGroups.isEmpty) {
                                    return SliverToBoxAdapter(
                                      child: NoGroupsFoundCard(searchController: _searchController),
                                    );
                                  }
                                  return SliverList.separated(
                                    itemBuilder: (_, index) {
                                      final group = searchGroups[index];
                                      final groupCard = GroupTile.value(
                                        group: group,
                                        isSelected: selectedGroup == group,
                                        onTap: () => setState(() => selectedGroup = group),
                                      );
                                      if (index == 0 && state.error != null) {
                                        return Column(
                                          spacing: context.theme.spacings.s16,
                                          children: [
                                            ErrorCard(
                                              error: state.error!,
                                              onTap: () => ScheduleMainScope.refresh(context),
                                            ),
                                            groupCard,
                                          ],
                                        );
                                      }
                                      return groupCard;
                                    },
                                    separatorBuilder: (_, _) => SizedBox(height: context.theme.spacings.s16),
                                    itemCount: searchGroups.length,
                                  );
                                }
                                if (state.isProgress) {
                                  return SliverList.separated(
                                    itemBuilder: (_, index) => GroupTile.loading(),
                                    separatorBuilder: (_, _) => SizedBox(height: context.theme.spacings.s16),
                                    itemCount: 6,
                                  );
                                }
                                return SliverToBoxAdapter(
                                  child: state.error == null
                                      ? PrimaryButton(
                                          onTap: () => ScheduleMainScope.refresh(context),
                                          title: context.l10n.try_again,
                                          alignment: .center,
                                        )
                                      : ErrorCard(error: state.error!, onTap: () => ScheduleMainScope.refresh(context)),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: context.theme.spacings.s12,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                context.theme.colorsPalette.background.base.withAlpha(0),
                                context.theme.colorsPalette.background.base,
                              ],
                              begin: .topCenter,
                              end: .bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox(width: .infinity),
                secondChild: Padding(
                  padding: .only(bottom: context.theme.spacings.s10),
                  child: Text(
                    context.l10n.group_selected_hint(selectedGroup ?? ''),
                    style: context.theme.textStyles.ag28.copyWith(color: context.theme.colorsPalette.text.secondary),
                  ),
                ),
                crossFadeState: selectedGroup == null ? .showFirst : .showSecond,
                duration: kThemeAnimationDuration,
              ),
              PrimaryButton(
                onTap: () {
                  if (selectedGroup == null) return;
                  if (selectedGroup != SelectedGroupScope.groupOf(context)) {
                    SelectedGroupScope.change(context, newValue: selectedGroup!);
                  }
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.replace(CommonRoutes.schedule.path);
                  }
                },
                title: context.l10n.continue_button,
                leftIcon: AnimatedCrossFade(
                  firstChild: SizedBox(height: 18),
                  secondChild: Assets.icons.arrowRight18.svg(
                    colorFilter: context.theme.colorsPalette.background.elevated.filter,
                  ),
                  crossFadeState: selectedGroup == null ? .showFirst : .showSecond,
                  duration: kThemeAnimationDuration,
                ),
                alignment: Alignment.center,
                isDisabled: selectedGroup == null,
              ),
              SizedBox(height: MediaQuery.paddingOf(context).bottom),
            ],
          );
        },
      ),
    );
  }
}
