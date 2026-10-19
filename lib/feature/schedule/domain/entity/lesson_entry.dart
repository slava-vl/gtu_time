import 'package:equatable/equatable.dart';

/// Распаковывает массив строк `entries` в безопасный объект.
/// В зависимости от длины списка (3 или 4 элемента):
/// - 3 элемента: [Subject, Lecturer, Room]
/// - 4 элемента: [Subgroup, Subject, Lecturer, Room]
class LessonEntry extends Equatable {
  final String? subgroup;
  final String subject;
  final String lecturer;
  final String room;

  const LessonEntry({required this.subject, required this.lecturer, required this.room, this.subgroup});

  factory LessonEntry.fromList(List<dynamic> list) {
    final strings = list.map((e) => e.toString()).toList();

    if (strings.length >= 4) {
      return LessonEntry(subgroup: strings[0], subject: strings[1], lecturer: strings[2], room: strings[3]);
    } else if (strings.length == 3) {
      return LessonEntry(subject: strings[0], lecturer: strings[1], room: strings[2]);
    } else {
      return LessonEntry(
        subject: strings.isNotEmpty ? strings[0] : '',
        lecturer: strings.length > 1 ? strings[1] : '',
        room: strings.length > 2 ? strings[2] : '',
      );
    }
  }

  List<String> toList() {
    if (subgroup != null) {
      return [subgroup!, subject, lecturer, room];
    }
    return [subject, lecturer, room];
  }

  @override
  List<Object?> get props => [subgroup, subject, lecturer, room];
}
