import 'package:dio/dio.dart';

class APIException {
  List<String> getExceptionMessage(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.badResponse:
        return [
          'Bad Response Error',
          'Check API url or parameters are invalid',
        ];

      case DioExceptionType.connectionError:
        return [
          'Connection Error',
          'Check network connectivity',
        ];

      case DioExceptionType.connectionTimeout:
        return [
          'Connection TimeOut',
          'Check network connectivity',
        ];

      case DioExceptionType.cancel:
        return [
          'Request Cancelled',
          'Check API url or parameters are invalid',
        ];

      case DioExceptionType.receiveTimeout:
        return [
          'Receive TimeOut',
          'Check API url, network connectivity or parameters are invalid',
        ];

      default:
        return [
          'Unknown Error',
          'Check API url or parameters are invalid',
        ];
    }
  }
}
