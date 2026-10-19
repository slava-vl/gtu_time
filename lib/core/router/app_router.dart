import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/router/routes_enum.dart';
import 'package:gtu_time/core/services/initial_route/service/i_initial_route_service.dart';
import 'package:gtu_time/feature/group/presentation/select_group_page.dart';
import 'package:gtu_time/feature/schedule/presentation/schedule_page.dart';
import 'package:injectable/injectable.dart';

part 'routes/common_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'RootRoutesNavigatorKey');
final RouteObserver<ModalRoute<void>> _routeObserver = RouteObserver<ModalRoute<void>>();

@singleton
class AppRouter {
  final IInitialRouteService _initialRouteService;

  AppRouter(this._initialRouteService);

  GoRouter get router => _router;

  GoRouter get _router => GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    observers: [_routeObserver],
    initialLocation: _initialRouteService.initialRoute,
    routes: [..._commonRoutes],
    errorBuilder: (_, state) => Placeholder(key: state.pageKey),
  );
}
