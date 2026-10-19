import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract interface class ILocalizationControlRepository {
  String get lastInitializedLocale;
  Stream<String> get localeChanges;
  String? getLocale();
  Future<void> saveLocale(String locale);
}
