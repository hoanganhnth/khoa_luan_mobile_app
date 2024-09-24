
import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:app_flutter/share/utils/exceptions/no_network_exception.dart';
import 'package:app_flutter/share/utils/interceptor/session_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

bool refreshing = false;

String baseUrlProd = 'http://payment.api.deltago.com';
String baseUrlDev = 'http://payment.api.deltago.com';

class EnvConfig {
  EnvConfig({
    required this.baseUrl,
  });
  String baseUrl;
}

Map<String, EnvConfig> envConfigs = {
  'PROD': EnvConfig(
    baseUrl: baseUrlProd,
  ),
  'DEV': EnvConfig(
    baseUrl: baseUrlDev,
  )
};

class DioApi {
  DioApi() {
    // Set default configs
    api.options.connectTimeout = Duration(seconds: connectTimeout); //10s
    api.options.receiveTimeout = Duration(seconds: receiveTimeout);
  }
  static String env = 'PROD';

  static EnvConfig configs = envConfigs[env]!;

  static int connectTimeout = 30000; // seconds
  static int receiveTimeout = 30000; // seconds

  static final Dio api = Dio();

  Future<Dio> init() async {
    api.options.baseUrl = configs.baseUrl;

    // Set default configs
    api.options.connectTimeout = Duration(milliseconds: connectTimeout);
    api.options.receiveTimeout = Duration(milliseconds: receiveTimeout);
    // api.options.headers = defaultHeaders;
    api.interceptors.add(ParamInjectionQueueInterceptor());
    if (kDebugMode) {
      api.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return api;
  }

  static Dio getInstance() {
    return api;
  }

  static setBaseUrl(String newUrl) {
    api.options.baseUrl = newUrl;
  }

  String getBaseUrl() {
    return api.options.baseUrl;
  }

  static Future<Response<T>?> post<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress,
      String? baseUrl}) async {
    try {
      if (baseUrl != null) {
        DioApi.setBaseUrl(baseUrl);
      } else if (api.options.baseUrl != configs.baseUrl) {
        DioApi.setBaseUrl(configs.baseUrl);
      }
      Object? body;
      if (data != null && (data is Map)) {
        final Map<String, dynamic> mapDynamic = Map<String, dynamic>.from(data);
        // mapDynamic.putIfAbsent(appKey, () => APP_KEY);
        body = mapDynamic;
      } else {
        body = data;
      }
      final Response<T> response = await api.post(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      // bool result =
      // await Modular.get<ConnectivityCheckerHelper>().checkConnectivity();
      // if (!result) {
      //   throw NetworkIssueException();
      // }
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

        if (error.type == DioErrorType.connectionTimeout ||
            error.type == DioErrorType.sendTimeout) {
          throw NetworkIssueException();
        }
        throw BaseError.fromObjectErr(e);
      }

      rethrow;
    }
  }

  static Future<Response<T>?> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onReceiveProgress,
      String? baseUrl}) async {
    try {
      if (baseUrl != null) {
        DioApi.setBaseUrl(baseUrl);
      } else if (api.options.baseUrl != configs.baseUrl) {
        DioApi.setBaseUrl(configs.baseUrl);
      }

      final Response<T> response = await api.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
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

        if (error.type == DioErrorType.connectionTimeout ||
            error.type == DioErrorType.sendTimeout) {
          throw NetworkIssueException();
        }
        throw BaseError.fromObjectErr(e);
      }

      rethrow;
    }
  }

  void setConnectTimeout(int newTimeout) {
    connectTimeout = newTimeout;
  }

  void setReceiveTimeout(int newTimeout) {
    receiveTimeout = newTimeout;
  }
}
