import 'base_exception.dart';

class NetworkIssueException extends BaseException {
  NetworkIssueException() : super('Không có kết nối internet. Vui lòng kiểm tra và thử lại.');
}
