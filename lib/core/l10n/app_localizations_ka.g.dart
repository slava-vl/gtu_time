// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get gtu_timetable => 'სტუ-ს ცხრილი';

  @override
  String get error_timeout_message => 'კავშირის პრობლემა';

  @override
  String get error_dio_message => 'დაფიქსირდა შეცდომა';

  @override
  String get error_connection_message => 'კავშირის პრობლემა';

  @override
  String get error_unknown_message => 'დაფიქსირდა შეცდომა';

  @override
  String get error_api_message => 'დაფიქსირდა შეცდომა';

  @override
  String get error_timeout_description => 'შეამოწმეთ ინტერნეტთან კავშირი და სცადეთ ხელახლა.';

  @override
  String get error_connection_description => 'შეამოწმეთ ინტერნეტთან კავშირი და სცადეთ ხელახლა.';

  @override
  String get error_unknown_description => 'დაფიქსირდა შეცდომა. გთხოვთ, სცადოთ ხელახლა.';

  @override
  String get your_academic_day_in_focus => 'შენი აკადემიური დღე ყურადღების ცენტრში.';

  @override
  String get find_your_study_group => 'იპოვე შენი სასწავლო ჯგუფი';

  @override
  String get choose_your_group_description => 'აირჩიე შენი ჯგუფი ლექციების, აუდიტორიებისა და განრიგის სანახავად.';

  @override
  String get loading_study_groups => 'სასწავლო ჯგუფები იტვირთება…';

  @override
  String get search_by_group_or_program => 'ძებნა ჯგუფის ან პროგრამის მიხედვით';

  @override
  String get available_groups => 'ხელმისაწვდომი ჯგუფები';

  @override
  String get search_results => 'ძებნის შედეგები';

  @override
  String groups_count(Object count) {
    return '$count ჯგუფი';
  }

  @override
  String get try_again => 'ხელახლა ცდა';

  @override
  String group_selected_hint(Object group) {
    return 'არჩეულია ჯგუფი $group · შეცვლა მოგვიანებითაც შეგიძლიათ.';
  }

  @override
  String get continue_button => 'გაგრძელება';

  @override
  String get no_groups_found => 'ჯგუფები ვერ მოიძებნა';

  @override
  String no_groups_match_query(Object query) {
    return 'ძებნით “$query” ჯგუფი ვერ მოიძებნა. სცადეთ სხვა კოდი ან პროგრამა.';
  }

  @override
  String get clear_query => 'ძებნის გასუფთავება';

  @override
  String get computer_science => 'კომპიუტერული მეცნიერება';

  @override
  String subgroup_label(Object subgroup) {
    return 'ქვეჯგუფი: $subgroup';
  }

  @override
  String get subgroup_all => 'ქვეჯგუფი: ყველა';

  @override
  String classes_count(Object count) {
    return '$count ლექცია';
  }

  @override
  String free_period(Object hours, Object minutes) {
    return 'თავისუფალი პერიოდი · $hours საათი $minutes წუთი';
  }

  @override
  String get day_without_classes_title => 'ლექციები არ არის';

  @override
  String get day_without_classes_description => 'ამ დღისთვის ლექციები დაგეგმილი არ არის. გადადით სხვა თარიღზე.';

  @override
  String get browse_another_day => 'სხვა დღის ნახვა';

  @override
  String last_updated(Object date) {
    return 'ბოლო განახლება · $date';
  }

  @override
  String last_updated_today(Object time) {
    return 'ბოლო განახლება · $time, დღეს';
  }

  @override
  String get choose_a_subgroup => 'აირჩიეთ ქვეჯგუფი';

  @override
  String get all_subgroups => 'ყველა ქვეჯგუფი';

  @override
  String get now_status => 'ახლა';

  @override
  String room_and_building(Object building, Object room) {
    return 'აუდიტორია $room · კორპუსი $building';
  }

  @override
  String get completed_status => 'დასრულებულია';

  @override
  String percent_elapsed(Object percent) {
    return 'გასულია $percent%';
  }

  @override
  String min_remaining(Object minutes) {
    return 'დარჩენილია $minutes წუთი';
  }

  @override
  String get settings_title => 'პარამეტრები';

  @override
  String get settings_subtitle => 'მოარგეთ განრიგი თქვენს გემოვნებას.';

  @override
  String get appearance_title => 'იერსახე';

  @override
  String get theme_system => 'სისტემური';

  @override
  String get theme_light => 'ნათელი';

  @override
  String get theme_dark => 'მუქი';

  @override
  String get language_title => 'ენა';
}
