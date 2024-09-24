
import 'package:app_flutter/share/base_component/app_toast/app_toast.dart';
import 'package:app_flutter/share/base_component/app_toast/src/model/data_alert.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:app_flutter/share/utils/validators/validation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParamInjectionQueueInterceptor extends QueuedInterceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('${options.path} queue interceptor request session interceptor');
    String token = Modular.get<SharedPreferences>()
            .getString(StringConstants.accessToken) ??
        "";
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return super.onRequest(options, handler);
  }
}

class SessionQueueInterceptor extends QueuedInterceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('${options.path} queue interceptor request session interceptor');

    return super.onRequest(options, handler);
  }

  void executeOtherError(
      Response response, ResponseInterceptorHandler handler) async {
    try {
      int apiResponseStatus = 1;
      try {
        apiResponseStatus = int.parse(response.data['status'].toString());
      } catch (e) {
        if (response.data['status'] is bool) {
          apiResponseStatus = response.data['status'] ? 1 : 0;
        } else {
          rethrow;
        }
      }

      final errMssage = response.data['message'] as String?;
      if (apiResponseStatus == 0) {
        if (TValidator.isNotNullOrEmpty(response.data['message'] as String?)) {
          String message = _handleMessage(
            response.data['message'],
            response.data['cta_button_title'],
            response.data['button_link'],
          );
          // toast loi
          AppToast.share.showToast(message, type: ToastType.error);
          return handler.reject(
            DioError(
              requestOptions: response.requestOptions,
              message: message,
            ),
          );
        } else {
          String message = _handleMessage(
            'Có lỗi xảy ra',
            response.data['cta_button_title'],
            response.data['button_link'],
          );
          // toast loi
          AppToast.share.showToast(message, type: ToastType.error);
          return handler.reject(
            DioError(
              requestOptions: response.requestOptions,
              message: message,
            ),
          );
        }
      }
      // else if (apiResponseStatus == 3) {
      //   // cần deeplink đến đâu đó kèm message
      //   final deeplink = response.data['data']['deeplink'].toString();
      //   // LichVietFlutterBase.appEventBus.fire(
      //   //   DeeplinkFromApiStatus3Event(deeplink, errMssage ?? ''),
      //   // );
      //   DeepLinkUtils.executeDeepLink(deeplink, globalContext!);
      //   if (errMssage.isNotNullOrEmpty) {
      //     AppToast.share.showToast(errMssage!);
      //   }
      //   return handler.reject(DioError(
      //       requestOptions: response.requestOptions, message: errMssage));
      // }
      else {
        final newSecret = response.data['secretKey'].toString();
        final newRefreshToken = response.data['refreshToken'].toString();
        // if (newSecret.isNotEmpty &&
        //     newRefreshToken.isNotEmpty &&
        //     newRefreshToken != 'null') {
        //   final sessionTimeOut = (response.data as Map<dynamic, dynamic>)
        //       .integer("session_timeout");
        //   await Modular.get<UserCubit>().saveSessionInfo(
        //       sessionInfo: SessionModel(
        //     newSecret,
        //     newRefreshToken,
        //     sessionTimeOut > 0
        //         ? DateTime.now().add(Duration(seconds: sessionTimeOut))
        //         : null,
        //   ));
        // }
        handler.next(response);
      }
    } catch (e) {
      debugPrint(e.toString());
      // toast loi
      AppToast.share.showToast(e.toString(), type: ToastType.error);
      handler.reject(DioError(requestOptions: response.requestOptions));
    }
  }

  String _handleMessage(
      String? message, String? buttonTitle, String? buttonLink) {
    String messageValue = message?.toString() ?? '';
    if (TValidator.isNotNullOrEmpty(buttonTitle) &&
        TValidator.isNotNullOrEmpty(buttonLink)) {
      messageValue =
          '${messageValue}cta_button_title=${buttonTitle.toString()}button_link=${buttonLink.toString()}';
    }
    return messageValue;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
