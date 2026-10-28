import 'package:gtu_time/core/router/routes_enum.dart';
import 'package:gtu_time/core/services/initial_route/service/i_initial_route_service.dart';
import 'package:gtu_time/feature/schedule_target/domain/repository/i_selected_targets_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IInitialRouteService)
class InitialRouteService implements IInitialRouteService {
  static String? _initialRoute;
  final ISelectedTargetsRepository _targetsRepository;

  const InitialRouteService(this._targetsRepository);

  @override
  @PostConstruct(preResolve: true)
  Future<void> init() async => _initialRoute = await _getInitialRoute();

  Future<String> _getInitialRoute() async {
    final initialRoute = await _getInitialBySession();

    return initialRoute;
  }

  Future<String> _getInitialBySession() async {
    if (_targetsRepository.targets.isEmpty) {
      return CommonRoutes.scheduleTarget.path;
    }

    return CommonRoutes.schedule.path;
  }

  @override
  String? get initialRoute => _initialRoute;
}
