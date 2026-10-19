// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class ScheduleResponseAdapter extends TypeAdapter<ScheduleResponse> {
  @override
  final typeId = 0;

  @override
  ScheduleResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduleResponse(
      week: (fields[0] as num).toInt(),
      source: fields[1] as String,
      checkedAt: fields[2] as DateTime,
      modifiedAt: fields[3] as String,
      groups: (fields[4] as Map).map(
        (dynamic k, dynamic v) =>
            MapEntry(k as String, (v as List).cast<DaySchedule>()),
      ),
    );
  }

  @override
  void write(BinaryWriter writer, ScheduleResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.week)
      ..writeByte(1)
      ..write(obj.source)
      ..writeByte(2)
      ..write(obj.checkedAt)
      ..writeByte(3)
      ..write(obj.modifiedAt)
      ..writeByte(4)
      ..write(obj.groups);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DayScheduleAdapter extends TypeAdapter<DaySchedule> {
  @override
  final typeId = 1;

  @override
  DaySchedule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DaySchedule(
      label: fields[0] as String,
      lessons: (fields[1] as List).cast<Lesson>(),
    );
  }

  @override
  void write(BinaryWriter writer, DaySchedule obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.lessons);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayScheduleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LessonAdapter extends TypeAdapter<Lesson> {
  @override
  final typeId = 2;

  @override
  Lesson read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lesson(
      time: fields[0] as String,
      slots: (fields[1] as num).toInt(),
      entries: (fields[2] as List).cast<LessonEntry>(),
    );
  }

  @override
  void write(BinaryWriter writer, Lesson obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.slots)
      ..writeByte(2)
      ..write(obj.entries);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LessonEntryAdapter extends TypeAdapter<LessonEntry> {
  @override
  final typeId = 3;

  @override
  LessonEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LessonEntry(
      subject: fields[1] as String,
      lecturer: fields[2] as String,
      room: fields[3] as String,
      subgroup: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LessonEntry obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.subgroup)
      ..writeByte(1)
      ..write(obj.subject)
      ..writeByte(2)
      ..write(obj.lecturer)
      ..writeByte(3)
      ..write(obj.room);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
