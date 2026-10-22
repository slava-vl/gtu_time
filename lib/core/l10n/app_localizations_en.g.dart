// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get gtu_timetable => 'GTU Timetable';

  @override
  String get error_timeout_message => 'Connection problem';

  @override
  String get error_dio_message => 'Something went wrong';

  @override
  String get error_connection_message => 'Connection problem';

  @override
  String get error_unknown_message => 'Something went wrong';

  @override
  String get error_api_message => 'Something went wrong';

  @override
  String get error_timeout_description => 'Check your internet connection and try again.';

  @override
  String get error_connection_description => 'Check your internet connection and try again.';

  @override
  String get error_unknown_description => 'Something went wrong. Please try again.';

  @override
  String get your_academic_day_in_focus => 'Your academic day, in focus.';

  @override
  String get find_your_study_group => 'Find your study group';

  @override
  String get choose_your_group_description => 'Choose your group to see your classes, rooms and the day ahead.';

  @override
  String get loading_study_groups => 'Loading study groups…';

  @override
  String get search_by_group_or_program => 'Search by group or program';

  @override
  String get available_groups => 'AVAILABLE GROUPS';

  @override
  String get search_results => 'SEARCH RESULTS';

  @override
  String groups_count(Object count) {
    return '$count groups';
  }

  @override
  String get try_again => 'Try again';

  @override
  String group_selected_hint(Object group) {
    return 'Group $group selected · You can change this later.';
  }

  @override
  String get continue_button => 'Continue';

  @override
  String get no_groups_found => 'No groups found';

  @override
  String no_groups_match_query(Object query) {
    return 'No study groups match “$query”. Try a different group ID or program.';
  }

  @override
  String get clear_query => 'Clear query';

  @override
  String get computer_science => 'Computer Science';

  @override
  String subgroup_label(Object subgroup) {
    return 'Subgroup: $subgroup';
  }

  @override
  String get subgroup_all => 'Subgroup: All';

  @override
  String classes_count(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count classes',
      one: '1 class',
      zero: '0 classes',
    );
    return '$_temp0';
  }

  @override
  String get free_period => 'Free period';

  @override
  String hours_count(num count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count hours', one: '1 hour');
    return '$_temp0';
  }

  @override
  String minutes_count(num count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count minutes', one: '1 minute');
    return '$_temp0';
  }

  @override
  String get day_without_classes_title => 'A day without classes';

  @override
  String get day_without_classes_description =>
      'There are no classes scheduled for this day. Browse another date or return to today.';

  @override
  String get browse_another_day => 'Browse another day';

  @override
  String last_updated(Object date) {
    return 'Last updated · $date';
  }

  @override
  String last_updated_today(Object time) {
    return 'Last updated · $time, Today';
  }

  @override
  String get choose_a_subgroup => 'Choose a subgroup';

  @override
  String get all_subgroups => 'All subgroups';

  @override
  String get now_status => 'NOW';

  @override
  String room_and_building(Object building, Object room) {
    return 'Room $room · Building $building';
  }

  @override
  String get completed_status => 'Completed';

  @override
  String percent_elapsed(Object percent) {
    return '$percent% elapsed';
  }

  @override
  String min_remaining(Object minutes) {
    return '$minutes min remaining';
  }

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_subtitle => 'Make the timetable feel like yours.';

  @override
  String get appearance_title => 'Appearance';

  @override
  String get theme_system => 'System';

  @override
  String get theme_light => 'Light';

  @override
  String get theme_dark => 'Dark';

  @override
  String get language_title => 'Language';

  @override
  String get close => 'Close';

  @override
  String get degree_bachelor => 'Bachelor\'s degree';

  @override
  String get degree_master => 'Master\'s degree';

  @override
  String get degree_doctor => 'Doctoral degree';

  @override
  String get degree_vocational => 'Vocational education';

  @override
  String get degree_preparatory_course => 'Georgian language preparatory course';
}
