import 'package:dio/dio.dart';

class ServerError implements Exception {
  int _errorCode = 0;
  String _errorMessage = "";

  ServerError.withError({required DioError error}) {
    _handleError(error);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioErrorType.connectTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.other:
        _errorMessage = "Connection failed due to internet connection";
        // _errorMessage = error.error.toString();

        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioErrorType.response:
        _errorCode = error.response!.statusCode!;

        _errorMessage =
            "Received invalid status code: ${error.response!.statusCode}";
        try {
          _errorMessage = error.response!.toString();
          if (error.response!.data["detail"] != null) {
            _errorMessage = error.response!.data["detail"];
          }
        } catch (e) {
          print("Error response = " + e.toString());
        }

        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Receive timeout in send request";
        break;
    }
    return _errorMessage;
  }
}
