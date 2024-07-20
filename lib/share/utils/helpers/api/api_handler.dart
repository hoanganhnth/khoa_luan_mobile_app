import 'package:dio/dio.dart';

typedef ApiResponseToModelParser<T> = T Function(Map<String, dynamic> json);

abstract class ApiHandler {
  // parser JSON data {} => Object
  Future<T> post<T>(String path,
      {required ApiResponseToModelParser<T> parser,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      Options? options,
      bool? showToastNotConnect});

  // parser JSON data {} => Object
  Future<T> get<T>(
    String path, {
    required ApiResponseToModelParser<T> parser,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}
