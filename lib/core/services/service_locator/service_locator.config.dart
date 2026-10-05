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
import 'package:gtu_time/feature/schedule/data/data_source/schedule_api.dart'
    as _i1059;
import 'package:gtu_time/feature/schedule/data/repository/schedule_repository.dart'
    as _i114;
import 'package:gtu_time/feature/schedule/domain/repository/i_schedule_repository.dart'
    as _i854;
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
    gh.factory<_i1059.ScheduleApi>(() => _i1059.ScheduleApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i854.IScheduleRepository>(
      () => _i114.ScheduleRepository(gh<_i1059.ScheduleApi>()),
    );
    return this;
  }
}

class _$ThirdPartyModule extends _i375.ThirdPartyModule {}

class _$DioModule extends _i724.DioModule {}
