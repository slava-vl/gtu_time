import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.g.dart';
import 'app_localizations_ka.g.dart';
import 'app_localizations_ru.g.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.g.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('ka'), Locale('ru')];

  /// No description provided for @gtu_timetable.
  ///
  /// In en, this message translates to:
  /// **'GTU Timetable'**
  String get gtu_timetable;

  /// No description provided for @error_timeout_message.
  ///
  /// In en, this message translates to:
  /// **'Connection problem'**
  String get error_timeout_message;

  /// No description provided for @error_dio_message.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get error_dio_message;

  /// No description provided for @error_connection_message.
  ///
  /// In en, this message translates to:
  /// **'Connection problem'**
  String get error_connection_message;

  /// No description provided for @error_unknown_message.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get error_unknown_message;

  /// No description provided for @error_api_message.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get error_api_message;

  /// No description provided for @error_timeout_description.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection and try again.'**
  String get error_timeout_description;

  /// No description provided for @error_connection_description.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection and try again.'**
  String get error_connection_description;

  /// No description provided for @error_unknown_description.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get error_unknown_description;

  /// No description provided for @your_academic_day_in_focus.
  ///
  /// In en, this message translates to:
  /// **'Your academic day, in focus.'**
  String get your_academic_day_in_focus;

  /// No description provided for @find_your_study_group.
  ///
  /// In en, this message translates to:
  /// **'Find your study group'**
  String get find_your_study_group;

  /// No description provided for @choose_your_group_description.
  ///
  /// In en, this message translates to:
  /// **'Choose your group to see your classes, rooms and the day ahead.'**
  String get choose_your_group_description;

  /// No description provided for @loading_study_groups.
  ///
  /// In en, this message translates to:
  /// **'Loading study groups…'**
  String get loading_study_groups;

  /// No description provided for @search_by_group_or_program.
  ///
  /// In en, this message translates to:
  /// **'Search by group or program'**
  String get search_by_group_or_program;

  /// No description provided for @available_groups.
  ///
  /// In en, this message translates to:
  /// **'AVAILABLE GROUPS'**
  String get available_groups;

  /// No description provided for @search_results.
  ///
  /// In en, this message translates to:
  /// **'SEARCH RESULTS'**
  String get search_results;

  /// No description provided for @groups_count.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 groups} =1{1 group} other{{count} groups}}'**
  String groups_count(num count);

  /// No description provided for @teachers_count.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 teachers} =1{1 teacher} other{{count} teachers}}'**
  String teachers_count(num count);

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get try_again;

  /// No description provided for @group_selected_hint.
  ///
  /// In en, this message translates to:
  /// **'Group {group} selected · You can change this later.'**
  String group_selected_hint(Object group);

  /// No description provided for @continue_button.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_button;

  /// No description provided for @no_groups_found.
  ///
  /// In en, this message translates to:
  /// **'No groups found'**
  String get no_groups_found;

  /// No description provided for @no_groups_match_query.
  ///
  /// In en, this message translates to:
  /// **'No study groups match “{query}”. Try a different group ID or program.'**
  String no_groups_match_query(Object query);

  /// No description provided for @clear_query.
  ///
  /// In en, this message translates to:
  /// **'Clear query'**
  String get clear_query;

  /// No description provided for @computer_science.
  ///
  /// In en, this message translates to:
  /// **'Computer Science'**
  String get computer_science;

  /// No description provided for @subgroup_label.
  ///
  /// In en, this message translates to:
  /// **'Subgroup: {subgroup}'**
  String subgroup_label(Object subgroup);

  /// No description provided for @subgroup_all.
  ///
  /// In en, this message translates to:
  /// **'Subgroup: All'**
  String get subgroup_all;

  /// No description provided for @classes_count.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 classes} =1{1 class} other{{count} classes}}'**
  String classes_count(num count);

  /// No description provided for @free_period.
  ///
  /// In en, this message translates to:
  /// **'Free period'**
  String get free_period;

  /// No description provided for @hours_count.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 hour} other{{count} hours}}'**
  String hours_count(num count);

  /// No description provided for @minutes_count.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 minute} other{{count} minutes}}'**
  String minutes_count(num count);

  /// No description provided for @day_without_classes_title.
  ///
  /// In en, this message translates to:
  /// **'A day without classes'**
  String get day_without_classes_title;

  /// No description provided for @day_without_classes_description.
  ///
  /// In en, this message translates to:
  /// **'There are no classes scheduled for this day. Browse another date or return to today.'**
  String get day_without_classes_description;

  /// No description provided for @browse_another_day.
  ///
  /// In en, this message translates to:
  /// **'Browse another day'**
  String get browse_another_day;

  /// No description provided for @last_updated.
  ///
  /// In en, this message translates to:
  /// **'Last updated · {date}'**
  String last_updated(Object date);

  /// No description provided for @last_updated_today.
  ///
  /// In en, this message translates to:
  /// **'Last updated · {time}, Today'**
  String last_updated_today(Object time);

  /// No description provided for @choose_a_subgroup.
  ///
  /// In en, this message translates to:
  /// **'Choose a subgroup'**
  String get choose_a_subgroup;

  /// No description provided for @all_subgroups.
  ///
  /// In en, this message translates to:
  /// **'All subgroups'**
  String get all_subgroups;

  /// No description provided for @now_status.
  ///
  /// In en, this message translates to:
  /// **'NOW'**
  String get now_status;

  /// No description provided for @room_and_building.
  ///
  /// In en, this message translates to:
  /// **'Room {room} · Building {building}'**
  String room_and_building(Object building, Object room);

  /// No description provided for @completed_status.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed_status;

  /// No description provided for @percent_elapsed.
  ///
  /// In en, this message translates to:
  /// **'{percent}% elapsed'**
  String percent_elapsed(Object percent);

  /// No description provided for @min_remaining.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min remaining'**
  String min_remaining(Object minutes);

  /// No description provided for @settings_title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_title;

  /// No description provided for @settings_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Make the timetable feel like yours.'**
  String get settings_subtitle;

  /// No description provided for @appearance_title.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance_title;

  /// No description provided for @theme_system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get theme_system;

  /// No description provided for @theme_light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get theme_light;

  /// No description provided for @theme_dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get theme_dark;

  /// No description provided for @language_title.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language_title;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @degree_bachelor.
  ///
  /// In en, this message translates to:
  /// **'Bachelor\'s degree'**
  String get degree_bachelor;

  /// No description provided for @degree_master.
  ///
  /// In en, this message translates to:
  /// **'Master\'s degree'**
  String get degree_master;

  /// No description provided for @degree_doctor.
  ///
  /// In en, this message translates to:
  /// **'Doctoral degree'**
  String get degree_doctor;

  /// No description provided for @degree_vocational.
  ///
  /// In en, this message translates to:
  /// **'Vocational education'**
  String get degree_vocational;

  /// No description provided for @degree_preparatory_course.
  ///
  /// In en, this message translates to:
  /// **'Georgian language preparatory course'**
  String get degree_preparatory_course;

  /// No description provided for @group_label.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get group_label;

  /// No description provided for @teacher_label.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get teacher_label;

  /// No description provided for @choose_teacher_description.
  ///
  /// In en, this message translates to:
  /// **'Choose teacher to see schedule'**
  String get choose_teacher_description;

  /// No description provided for @find_teacher.
  ///
  /// In en, this message translates to:
  /// **'Find teacher'**
  String get find_teacher;

  /// No description provided for @search_by_name_or_program.
  ///
  /// In en, this message translates to:
  /// **'Search by name or program'**
  String get search_by_name_or_program;

  /// No description provided for @available_teachers.
  ///
  /// In en, this message translates to:
  /// **'Available teachers'**
  String get available_teachers;

  /// No description provided for @no_teachers_found.
  ///
  /// In en, this message translates to:
  /// **'No teachers found'**
  String get no_teachers_found;

  /// No description provided for @no_teachers_match_query.
  ///
  /// In en, this message translates to:
  /// **'No teachers match “{query}”. Try a different name or program.'**
  String no_teachers_match_query(Object query);

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ka', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ka':
      return AppLocalizationsKa();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
