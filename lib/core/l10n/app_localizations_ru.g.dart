// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get gtu_timetable => 'Расписание ГТУ';

  @override
  String get error_timeout_message => 'Проблема со соединением';

  @override
  String get error_dio_message => 'Что-то пошло не так';

  @override
  String get error_connection_message => 'Проблема со соединением';

  @override
  String get error_unknown_message => 'Что-то пошло не так';

  @override
  String get error_api_message => 'Что-то пошло не так';

  @override
  String get error_timeout_description => 'Проверьте подключение к интернету и попробуйте снова.';

  @override
  String get error_connection_description => 'Проверьте подключение к интернету и попробуйте снова.';

  @override
  String get error_unknown_description => 'Что-то пошло не так. Пожалуйста, попробуйте снова.';

  @override
  String get your_academic_day_in_focus => 'Ваш учебный день под контролем.';

  @override
  String get find_your_study_group => 'Найдите свою учебную группу';

  @override
  String get choose_your_group_description => 'Выберите группу, чтобы увидеть пары, аудитории и расписание на день.';

  @override
  String get loading_study_groups => 'Загрузка учебных групп…';

  @override
  String get search_by_group_or_program => 'Поиск по группе или программе';

  @override
  String get available_groups => 'ДОСТУПНЫЕ ГРУППЫ';

  @override
  String get search_results => 'РЕЗУЛЬТАТЫ ПОИСКА';

  @override
  String groups_count(Object count) {
    return 'Групп: $count';
  }

  @override
  String get try_again => 'Попробовать снова';

  @override
  String group_selected_hint(Object group) {
    return 'Выбрана группа $group · Вы сможете изменить её позже.';
  }

  @override
  String get continue_button => 'Продолжить';

  @override
  String get no_groups_found => 'Группы не найдены';

  @override
  String no_groups_match_query(Object query) {
    return 'По запросу «$query» группы не найдены. Попробуйте другой номер группы или программу.';
  }

  @override
  String get clear_query => 'Очистить запрос';

  @override
  String get computer_science => 'Компьютерные науки';

  @override
  String subgroup_label(Object subgroup) {
    return 'Подгруппа: $subgroup';
  }

  @override
  String get subgroup_all => 'Подгруппа: Все';

  @override
  String classes_count(Object count) {
    return 'Пар: $count';
  }

  @override
  String free_period(Object hours, Object minutes) {
    return 'Окно · $hours ч $minutes мин';
  }

  @override
  String get day_without_classes_title => 'День без занятий';

  @override
  String get day_without_classes_description =>
      'На этот день занятия не запланированы. Выберите другую дату или вернитесь к сегодняшнему дню.';

  @override
  String get browse_another_day => 'Выбрать другой день';

  @override
  String last_updated(Object date) {
    return 'Обновлено · $date';
  }

  @override
  String last_updated_today(Object time) {
    return 'Обновлено · $time, Сегодня';
  }

  @override
  String get choose_a_subgroup => 'Выберите подгруппу';

  @override
  String get all_subgroups => 'Все подгруппы';

  @override
  String get now_status => 'СЕЙЧАС';

  @override
  String room_and_building(Object building, Object room) {
    return 'Аудитория $room · Корпус $building';
  }

  @override
  String get completed_status => 'Завершено';

  @override
  String percent_elapsed(Object percent) {
    return 'Прошло $percent%';
  }

  @override
  String min_remaining(Object minutes) {
    return 'Осталось $minutes мин';
  }

  @override
  String get settings_title => 'Настройки';

  @override
  String get settings_subtitle => 'Настройте расписание под себя.';

  @override
  String get appearance_title => 'Внешний вид';

  @override
  String get theme_system => 'Системная';

  @override
  String get theme_light => 'Светлая';

  @override
  String get theme_dark => 'Тёмная';

  @override
  String get language_title => 'Язык';
}
