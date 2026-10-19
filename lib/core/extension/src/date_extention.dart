import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool betweenOrEqualTo(DateTime start, DateTime end) {
    if (isBefore(start)) return false;
    if (isAfter(end)) return false;
    return true;
  }
}

extension TimeOfDayExtension on TimeOfDay {
  Duration difference(TimeOfDay other) {
    final currentM = hour * 60 + minute;
    final otherM = other.hour * 60 + other.minute;
    final dif = otherM - currentM;

    return Duration(minutes: dif);
  }
}
