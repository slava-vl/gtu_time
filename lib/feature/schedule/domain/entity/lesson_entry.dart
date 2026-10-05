/// Распаковывает массив строк `entries` в безопасный объект.
/// В зависимости от длины списка (3 или 4 элемента):
/// - 3 элемента: [Subject, Lecturer, Room]
/// - 4 элемента: [Subgroup, Subject, Lecturer, Room]
class LessonEntry {
  final String? subgroup;
  final String subject;
  final String lecturer;
  final String room;

  const LessonEntry({this.subgroup, required this.subject, required this.lecturer, required this.room});

  factory LessonEntry.fromList(List<dynamic> list) {
    final strings = list.map((e) => e.toString()).toList();

    if (strings.length >= 4) {
      return LessonEntry(subgroup: strings[0], subject: strings[1], lecturer: strings[2], room: strings[3]);
    } else if (strings.length == 3) {
      return LessonEntry(subgroup: null, subject: strings[0], lecturer: strings[1], room: strings[2]);
    } else {
      return LessonEntry(
        subgroup: null,
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
}
