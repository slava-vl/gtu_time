import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtu_time/feature/theme_control/domain/entity/current_theme.dart';
import 'package:gtu_time/feature/theme_control/domain/repository/i_theme_control_repository.dart';

part 'theme_control_bloc.freezed.dart';

@freezed
sealed class ThemeControlState with _$ThemeControlState {
  const factory ThemeControlState({CurrentTheme? currentTheme}) = _ThemeControlState;
}

@freezed
sealed class ThemeControlEvent with _$ThemeControlEvent {
  const factory ThemeControlEvent.changeTheme(CurrentTheme? themeMode) = _ChangeThemeEvent;
}

class ThemeControlBloc extends Bloc<ThemeControlEvent, ThemeControlState> {
  ThemeControlBloc({required IThemeControlRepository repository})
    : _repository = repository,
      super(ThemeControlState(currentTheme: repository.getTheme())) {
    on<_ChangeThemeEvent>(_changeTheme);
  }
  final IThemeControlRepository _repository;

  void _changeTheme(_ChangeThemeEvent event, Emitter<ThemeControlState> emit) {
    final theme = event.themeMode;
    emit(state.copyWith(currentTheme: event.themeMode));
    unawaited(_repository.saveTheme(theme));
  }
}
