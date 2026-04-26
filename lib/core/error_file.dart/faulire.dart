import 'package:dio/dio.dart';

abstract class Failure {
  final String errormessage;

  Failure(this.errormessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errormessage);

  factory ServerFailure.fromDioExpetion(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection TimeOut with Api Server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send TimeOut with Api Server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive TimeOut with Api Server');

      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with Api Server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResonse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Your request are canceled with Api Server');

      case DioExceptionType.connectionError:
        return ServerFailure('Please  Check Your Network ');

      case DioExceptionType.unknown:
        return ServerFailure('Opps there was an error, please try later !');
    }
  }

  factory ServerFailure.fromResonse(int statusCode, dynamic response) {
    final errorMessage =
        response?['error']?['message'] ??
        response?['message'] ??
        'حدث خطأ غير متوقع $statusCode';

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request Is Not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please Try Later!');
    } else {
      return ServerFailure('Opps there was an error, please try later !');
    }
  }
}
