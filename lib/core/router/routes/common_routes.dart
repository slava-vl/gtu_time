part of '../app_router.dart';

final _commonRoutes = [
  GoRoute(parentNavigatorKey: rootNavigatorKey, path: CommonRoutes.schedule.path, builder: (_, _) => SchedulePage()),
  GoRoute(
    parentNavigatorKey: rootNavigatorKey,
    path: CommonRoutes.scheduleTarget.path,
    builder: (_, _) => ScheduleTargetScreen(),
  ),
];
