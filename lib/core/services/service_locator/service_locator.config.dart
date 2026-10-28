// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:gtu_time/core/modules/dio_module.dart' as _i724;
import 'package:gtu_time/core/modules/third_party_module.dart' as _i375;
import 'package:gtu_time/core/router/app_router.dart' as _i69;
import 'package:gtu_time/core/services/initial_route/repository/initial_route_repository.dart'
    as _i64;
import 'package:gtu_time/core/services/initial_route/service/i_initial_route_service.dart'
    as _i828;
import 'package:gtu_time/core/services/initial_route/service/initial_route_service.dart'
    as _i1043;
import 'package:gtu_time/feature/localization_control/data/data_source/localization_control_datasource.dart'
    as _i1037;
import 'package:gtu_time/feature/localization_control/data/repository/localization_control_repository.dart'
    as _i134;
import 'package:gtu_time/feature/localization_control/domain/repository/i_localization_control_repository.dart'
    as _i377;
import 'package:gtu_time/feature/schedule/data/data_source/schedule_api.dart'
    as _i1059;
import 'package:gtu_time/feature/schedule/data/data_source/schedule_local_db.dart'
    as _i887;
import 'package:gtu_time/feature/schedule/data/repository/schedule_repository.dart'
    as _i114;
import 'package:gtu_time/feature/schedule/domain/repository/i_schedule_repository.dart'
    as _i854;
import 'package:gtu_time/feature/schedule_target/data/data_source/schedule_targets_api.dart'
    as _i794;
import 'package:gtu_time/feature/schedule_target/data/data_source/selected_targets_local_db.dart'
    as _i971;
import 'package:gtu_time/feature/schedule_target/data/repository/schedule_targets_repository.dart'
    as _i697;
import 'package:gtu_time/feature/schedule_target/data/repository/selected_targets_repository.dart'
    as _i233;
import 'package:gtu_time/feature/schedule_target/domain/repository/i_schedule_targets_repository.dart'
    as _i504;
import 'package:gtu_time/feature/schedule_target/domain/repository/i_selected_targets_repository.dart'
    as _i24;
import 'package:gtu_time/feature/theme_control/data/data_source/theme_control_datasource.dart'
    as _i358;
import 'package:gtu_time/feature/theme_control/data/repository/theme_control_repository.dart'
    as _i556;
import 'package:gtu_time/feature/theme_control/domain/repository/i_theme_control_repository.dart'
    as _i143;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyModule = _$ThirdPartyModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => thirdPartyModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.clearDio);
    gh.lazySingleton<_i971.ISelectedTargetsLocalDB>(
      () => _i971.SelectedTargetsLocalDB(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i1059.ScheduleApi>(() => _i1059.ScheduleApi(gh<_i361.Dio>()));
    gh.factory<_i794.ScheduleTargetsApi>(
      () => _i794.ScheduleTargetsApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i358.IThemeControlDatasource>(
      () => _i358.ThemeControlDatasource(
        sharedPrefsStorage: gh<_i460.SharedPreferences>(),
      ),
    );
    await gh.lazySingletonAsync<_i1037.ILocalizationControlDatasource>(
      () => _i1037.LocalizationControlDatasource.init(
        sharedPrefsStorage: gh<_i460.SharedPreferences>(),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i24.ISelectedTargetsRepository>(
      () =>
          _i233.SelectedTargetsRepository(gh<_i971.ISelectedTargetsLocalDB>()),
    );
    gh.factory<_i504.IScheduleTargetsRepository>(
      () => _i697.ScheduleTargetsRepository(gh<_i794.ScheduleTargetsApi>()),
    );
    gh.factory<_i887.IScheduleLocalDb>(
      () => _i887.ScheduleLocalDb(gh<_i460.SharedPreferences>()),
    );
    await gh.singletonAsync<_i828.IInitialRouteService>(() {
      final i = _i1043.InitialRouteService(
        gh<_i24.ISelectedTargetsRepository>(),
      );
      return i.init().then((_) => i);
    }, preResolve: true);
    gh.lazySingleton<_i377.ILocalizationControlRepository>(
      () => _i134.LocalizationControlRepository(
        datasource: gh<_i1037.ILocalizationControlDatasource>(),
      ),
    );
    gh.lazySingleton<_i143.IThemeControlRepository>(
      () => _i556.ThemeControlRepository(
        themeControlDatasource: gh<_i358.IThemeControlDatasource>(),
      ),
    );
    gh.singleton<_i69.AppRouter>(
      () => _i69.AppRouter(gh<_i828.IInitialRouteService>()),
    );
    gh.factory<_i64.IInitialRouteRepository>(
      () => _i64.InitialRouteRepository(
        initialrouteService: gh<_i828.IInitialRouteService>(),
      ),
    );
    gh.factory<_i854.IScheduleRepository>(
      () => _i114.ScheduleRepository(
        gh<_i1059.ScheduleApi>(),
        gh<_i887.IScheduleLocalDb>(),
      ),
    );
    return this;
  }
}

class _$ThirdPartyModule extends _i375.ThirdPartyModule {}

class _$DioModule extends _i724.DioModule {}
