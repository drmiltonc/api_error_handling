import 'package:api_error_handling/allert_dialog.dart' as Alert;
import 'package:api_error_handling/api_exception.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class APIController {
  final dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 5)));

  final String url = 'https://fakestoreapi.com/productsm';
  Alert.ApiDialog apiDialog = Alert.ApiDialog();

  Future<void> fetchData(BuildContext context) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        print(response.data.toString());
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: url),
          response: response,
          type: DioExceptionType.connectionError,
        );
      }
    }on DioException {
      checkException;
    } catch (error) {
      apiDialog.showAlert(
          context: context, title: 'Error', content: error.toString());
    }
  }

  void checkException(DioException? error, BuildContext context) {
    APIException exception = APIException();
    List<String> errorMessage = exception.getExceptionMessage(error!);
    apiDialog.showAlert(
      title: errorMessage[0],
      content: errorMessage[1],
      context: context,
    );
  }
}
