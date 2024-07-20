import 'package:app_flutter/share/utils/exceptions/no_network_exception.dart';
import 'package:app_flutter/share/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'base_exception.dart';

class BaseError implements Exception {
  final String? errMsgToastToUser;
  final Exception? exception;
  BaseError(this.errMsgToastToUser, [this.exception]);
  factory BaseError.fromObjectErr(Object? e) {
    if (e is CustomConnectionException) {
      return BaseError(e.exceptionMessage, e);
    }
    if (e is NetworkIssueException) {
      return BaseError(e.message, e);
    } else if (e is BaseException) {
      return BaseError(e.message, e);
    } else if (e is BaseError) {
      return e;
    } else if (e is DioException) {
      return BaseError(e.message, e);
    }
    {
      if (kDebugMode) {
        return BaseError(
          e.toString(),
        );
      } else {
        return BaseError(
          'Có lỗi xảy ra, vui lòng thử lại sau',
        );
      }
    }
  }
}
