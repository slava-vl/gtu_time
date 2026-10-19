import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gtu_time/feature/localization_control/domain/entity/locale_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _locale = 'locale';

abstract interface class ILocalizationControlDatasource {
  String? getLocale();
  Future<void> saveLocale(String locale);
  String get lastInitializedLocale;
}

@immutable
@LazySingleton(as: ILocalizationControlDatasource)
class LocalizationControlDatasource implements ILocalizationControlDatasource {
  const LocalizationControlDatasource._(this._storage, this._lastInitializedLocale);

  @FactoryMethod(preResolve: true)
  static Future<LocalizationControlDatasource> init({required SharedPreferences sharedPrefsStorage}) async {
    var locale = _getLocale(sharedPrefsStorage);
    if (locale == null) {
      final platformLocale = PlatformDispatcher.instance.locale.languageCode;

      locale = LocaleEntity.supported.any((l) => l.languageCode == platformLocale)
          ? platformLocale
          : LocaleEntity.supported.first.languageCode;
    }
    Intl.defaultLocale = locale;
    return LocalizationControlDatasource._(sharedPrefsStorage, locale);
  }

  final SharedPreferences _storage;
  final String _lastInitializedLocale;

  static String? _getLocale(SharedPreferences storage) {
    if (!storage.containsKey(_locale)) return null;
    return storage.getString(_locale);
  }

  @override
  String? getLocale() => _getLocale(_storage);

  @override
  Future<void> saveLocale(String locale) async {
    Intl.defaultLocale = locale;
    await _storage.setString(_locale, locale);
  }

  @override
  String get lastInitializedLocale => _lastInitializedLocale;
}
