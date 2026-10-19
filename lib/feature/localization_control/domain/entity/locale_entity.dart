import 'package:flutter/material.dart';

enum LocaleEntity {
  en(countryCode: 'GB', languageCode: 'en', languageFullCode: 'en_EN', nativeName: 'English'),
  ru(countryCode: 'RU', languageCode: 'ru', languageFullCode: 'ru_RU', nativeName: 'Русский'),
  ka(countryCode: 'GE', languageCode: 'ka', languageFullCode: 'ka_GE', nativeName: 'ქართული');

  const LocaleEntity({
    required this.languageCode,
    required this.countryCode,
    required this.languageFullCode,
    required this.nativeName,
  });

  factory LocaleEntity.fromLocale(Locale locale) {
    return LocaleEntity.values.firstWhere(
      (element) => element.languageCode == locale.languageCode,
      orElse: () => LocaleEntity.ru,
    );
  }

  factory LocaleEntity.fromLanguageCode(String languageCode) {
    return LocaleEntity.values.firstWhere(
      (element) => element.languageCode == languageCode,
      orElse: () => LocaleEntity.ru,
    );
  }

  final String languageCode;
  final String countryCode;
  final String languageFullCode;
  final String nativeName;

  static const List<LocaleEntity> supported = [en, ru, ka];

  Locale get toLocale => Locale(languageCode, countryCode);

  String get flagEmoji {
    const flagOffset = 0x1F1E6;
    const asciiOffset = 0x41;
    final first = flagOffset + (countryCode.codeUnitAt(0) - asciiOffset);
    final second = flagOffset + (countryCode.codeUnitAt(1) - asciiOffset);
    return String.fromCharCode(first) + String.fromCharCode(second);
  }
}
