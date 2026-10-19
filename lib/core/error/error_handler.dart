import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtu_time/core/error/api_error/error_model.dart';
import 'package:gtu_time/core/services/app_connect/app_connect.dart';

@immutable
abstract class IErrorHandler {
  E when<E>({
    required E Function(TimeoutException error) timeout,
    required E Function(DioException error) dio,
    required E Function() connection,
    required E Function(Object error) unknown,
    required E Function(ErrorModel error) apiError,
  });

  bool get isApiError;
}

@immutable
abstract class ErrorHandler implements IErrorHandler {
  const ErrorHandler();

  factory ErrorHandler.fromError(Object object) {
    if (object is TimeoutException) {
      return _TimeoutError(object);
    }

    if (object is ConnectDioError) {
      return _ConnectionError();
    }

    if (object is HasNoConnect) {
      return _ConnectionError();
    }

    if (object is DioException) {
      if (object.error is SocketException) {
        return _ConnectionError();
      }

      final response = object.response;

      if (response != null && response.data is Map<String, Object?>) {
        final json = response.data as Map<String, Object?>;
        try {
          final errorModel = ErrorModel.fromJson(json);
          debugPrint('errorModel: ${errorModel.message}');
          return ApiError(errorModel);
        } on Object catch (error) {
          debugPrint('Нарушен контракт модели ошибки $error');
        }
      }
      return _DioError(object);
    }

    return _UnknownError(object);
  }
}

@immutable
class ApiError extends ErrorHandler {
  final ErrorModel error;
  const ApiError(this.error);

  @override
  E when<E>({
    required E Function(TimeoutException error) timeout,
    required E Function(DioException error) dio,
    required E Function() connection,
    required E Function(Object error) unknown,
    required E Function(ErrorModel error) apiError,
  }) => apiError(error);

  @override
  bool get isApiError => true;
}

@immutable
class _TimeoutError extends ErrorHandler {
  final TimeoutException exception;
  const _TimeoutError(this.exception);

  @override
  E when<E>({
    required E Function(TimeoutException error) timeout,
    required E Function(DioException error) dio,
    required E Function() connection,
    required E Function(Object error) unknown,
    required E Function(ErrorModel error) apiError,
  }) => timeout(exception);

  @override
  bool get isApiError => false;
}

@immutable
class _DioError extends ErrorHandler {
  final DioException error;
  const _DioError(this.error);

  @override
  E when<E>({
    required E Function(TimeoutException error) timeout,
    required E Function(DioException error) dio,
    required E Function() connection,
    required E Function(Object error) unknown,
    required E Function(ErrorModel error) apiError,
  }) => dio(error);

  @override
  bool get isApiError => false;
}

@immutable
class _ConnectionError extends ErrorHandler {
  const _ConnectionError();

  @override
  E when<E>({
    required E Function(TimeoutException error) timeout,
    required E Function(DioException error) dio,
    required E Function() connection,
    required E Function(Object error) unknown,
    required E Function(ErrorModel error) apiError,
  }) => connection();

  @override
  bool get isApiError => false;
}

@immutable
class _UnknownError extends ErrorHandler {
  final Object error;
  const _UnknownError(this.error);

  @override
  E when<E>({
    required E Function(TimeoutException error) timeout,
    required E Function(DioException error) dio,
    required E Function() connection,
    required E Function(Object error) unknown,
    required E Function(ErrorModel error) apiError,
  }) => unknown(error);

  @override
  bool get isApiError => false;
}

extension ObjectExtension on Object {
  IErrorHandler toHandler() => ErrorHandler.fromError(this);
}
