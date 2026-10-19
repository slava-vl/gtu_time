import 'package:gtu_time/core/router/routes_enum.dart';
import 'package:gtu_time/core/services/initial_route/service/i_initial_route_service.dart';
import 'package:gtu_time/feature/group/domain/repository/i_selected_group_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IInitialRouteService)
class InitialRouteService implements IInitialRouteService {
  static String? _initialRoute;
  final ISelectedGroupRepository _groupRepository;

  const InitialRouteService(this._groupRepository);

  @override
  @PostConstruct(preResolve: true)
  Future<void> init() async => _initialRoute = await _getInitialRoute();

  Future<String> _getInitialRoute() async {
    final initialRoute = await _getInitialBySession();

    return initialRoute;
  }

  Future<String> _getInitialBySession() async {
    final isGroupSelected = _groupRepository.selectedGroup;
    if (isGroupSelected == null) {
      return CommonRoutes.chooseGroup.path;
    }

    return CommonRoutes.schedule.path;
  }

  @override
  String? get initialRoute => _initialRoute;
}
