import 'package:flutter/foundation.dart' show immutable;
import 'package:gtu_time/core/services/initial_route/service/i_initial_route_service.dart';
import 'package:injectable/injectable.dart';

@immutable
abstract interface class IInitialRouteRepository {
  Future<String?> fetchRedirectRoute();
}

@immutable
@Injectable(as: IInitialRouteRepository)
class InitialRouteRepository implements IInitialRouteRepository {
  final IInitialRouteService _initialrouteService;
  const InitialRouteRepository({required this._initialrouteService});

  @override
  Future<String?> fetchRedirectRoute() async {
    await _initialrouteService.init();
    return _initialrouteService.initialRoute;
  }
}
