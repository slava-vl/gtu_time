import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get clearDio {
    final dio = Dio(BaseOptions(baseUrl: 'https://gtu-timetable.vercel.app/api/', receiveTimeout: const Duration(seconds: 35)));
    dio.interceptors.addAll([if (!kIsWeb) LogInterceptor(requestBody: true, responseBody: true)]);
    return dio;
  }
}
