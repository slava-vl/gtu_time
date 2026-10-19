import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtu_time/feature/localization_control/domain/entity/locale_entity.dart';
import 'package:gtu_time/feature/localization_control/domain/repository/i_localization_control_repository.dart';

part 'localization_control_bloc.freezed.dart';

@freezed
sealed class LocalizationControlEvent with _$LocalizationControlEvent {
  const factory LocalizationControlEvent.changeLocalization({required LocaleEntity locale}) = _ChangeLocalizationEvent;
}

@freezed
sealed class LocalizationControlState with _$LocalizationControlState {
  const factory LocalizationControlState({required LocaleEntity currentLocalization}) = _LocalizationControlState;
}

class LocalizationControlBloc extends Bloc<LocalizationControlEvent, LocalizationControlState> {
  LocalizationControlBloc({required this._repository})
    : super(
        LocalizationControlState(currentLocalization: LocaleEntity.fromLanguageCode(_repository.lastInitializedLocale)),
      ) {
    on<LocalizationControlEvent>(
      (event, emit) => event.map(changeLocalization: (event) => _changeLocalization(event, emit)),
    );
  }

  final ILocalizationControlRepository _repository;

  Future<void> _changeLocalization(_ChangeLocalizationEvent event, Emitter<LocalizationControlState> emit) async {
    final locale = event.locale;
    unawaited(_repository.saveLocale(locale.languageCode));
    emit(LocalizationControlState(currentLocalization: locale));
  }
}
