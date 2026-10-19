// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
  timestamp: json['timestamp'] as Object,
  status: (json['status'] as num).toInt(),
  exception: json['exception'] as String?,
  message: json['message'] as String?,
  path: json['path'] as String?,
);
