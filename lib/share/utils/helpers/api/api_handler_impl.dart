import 'dart:async';
import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:app_flutter/share/utils/exceptions/no_network_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'api_handler.dart';

class ApiHandlerImpl implements ApiHandler {
  ApiHandlerImpl(
    this._dio,
  );

  final Dio _dio;

  @override
  Future<T> post<T>(String path,
      {required ApiResponseToModelParser<T> parser,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      Options? options,
      bool? showToastNotConnect}) {
    body ??= {};

    // need remove
    // if (GetIt.I<UserCubit>().state.session?.secretKey != null) {
    //   body.putIfAbsent(
    //       'secretKey', () => GetIt.I<UserCubit>().state.session!.secretKey);
    // }

    return _remapError(() async {
      Response response;

      response = await _dio.post(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
      // da decode o trong phan cache inteceptor roi. Nhung thoi cu decode tiep cho no ngon
      if (response.data['data'] != null) {
        return parser(response.data);
      }
      return parser(response.data);
    }, path: path);
  }

  @override
  Future<T> get<T>(
    String path, {
    required ApiResponseToModelParser<T> parser,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _remapError(() async {
      Response response;
      response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );

      return parser(response.data);
    });
  }

  Future<T> _remapError<T>(ValueGetter<Future<T>> func,
      {bool? showToastNotConnect, String? path}) async {
    try {
      // bool result = await InternetConnectionChecker().hasConnection;
      // if (!result) {
      //   throw NetworkIssueException();
      // }
      return await func();
    } catch (e) {
      return await _apiErrorToInternalError(
        e,
      );
    }
  }

  Future<dynamic> _apiErrorToInternalError(
    e,
  ) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      throw NetworkIssueException();
    }
    if (e is DioError) {
      DioError? error;
      if ((e.message ?? '').contains('HandshakeException')) {
        error = DioError(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: 'Lỗi hệ thống hoặc kết nối mạng. Vui lòng thử lại.');
      } else {
        error = e;
      }

      // if (result == true) {
      //   FirebaseCrashlytics.instance.recordError(e, e.stackTrace);
      // }
      if (error.type == DioErrorType.connectionTimeout ||
          error.type == DioErrorType.sendTimeout) {
        throw NetworkIssueException();
      }
      // ToastUtils.showValidateToast(e.requestOptions.path);
      throw BaseError.fromObjectErr(e);
    }
    // ToastUtils.showValidateToast(e.requestOptions.path);
    // if (result == true) {
    //   FirebaseCrashlytics.instance.recordError(e, e.stackTrace);
    // }
    throw e;
  }
}
