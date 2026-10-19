import 'package:flutter/material.dart';
import 'package:gtu_time/feature/localization_control/data/data_source/localization_control_datasource.dart';
import 'package:gtu_time/feature/localization_control/domain/repository/i_localization_control_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@immutable
@LazySingleton(as: ILocalizationControlRepository)
class LocalizationControlRepository implements ILocalizationControlRepository {
  LocalizationControlRepository({required ILocalizationControlDatasource datasource})
    : _datasource = datasource,
      _localeSubject = BehaviorSubject.seeded(datasource.lastInitializedLocale);

  final ILocalizationControlDatasource _datasource;
  final BehaviorSubject<String> _localeSubject;

  @override
  Stream<String> get localeChanges => _localeSubject.stream;

  @override
  String? getLocale() => _datasource.getLocale();

  @override
  Future<void> saveLocale(String locale) async {
    await _datasource.saveLocale(locale);
    _localeSubject.add(locale);
  }

  @override
  String get lastInitializedLocale => _localeSubject.value;
}
