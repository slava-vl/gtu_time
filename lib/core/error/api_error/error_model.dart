import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable(createToJson: false)
class ErrorModel {
  final Object timestamp;
  final int status;
  final String? exception;
  final String? message;
  final String? path;

  const ErrorModel({
    required this.timestamp,
    required this.status,
    required this.exception,
    required this.message,
    required this.path,
  });

  factory ErrorModel.fromJson(Map<String, Object?> json) => _$ErrorModelFromJson(json);
}
