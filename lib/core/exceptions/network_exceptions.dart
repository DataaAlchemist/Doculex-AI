import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const NetworkExceptions._();

  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(
      String error, Response<dynamic>? response) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        late NetworkExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioExceptionType.connectionError:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 409:
                  networkExceptions = const NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = const NetworkExceptions.requestTimeout();
                  break;
                case 500:
                  networkExceptions =
                      const NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions =
                      const NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  if ((error.response?.data) == 'These credentials do not match our records.') {
                    networkExceptions = NetworkExceptions.defaultError(
                      'These credentials do not match our records',
                      error.response,
                    );
                  } else {
                    networkExceptions = NetworkExceptions.defaultError(
                      error.response?.data['message'].toString() ??
                          'Server error',
                      error.response,
                    );
                  }
                  break;
              }
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            default:
              networkExceptions = const NetworkExceptions.unexpectedError();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }

        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        // print(error.toString());
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  String get message {
    String errorMessage = '';

    when(
      notImplemented: () {
        errorMessage = 'Not Implemented';
      },
      requestCancelled: () {
        errorMessage = 'Request Cancelled';
      },
      internalServerError: () {
        errorMessage = 'Internal Server Error';
      },
      serviceUnavailable: () {
        errorMessage = 'Service unavailable';
      },
      methodNotAllowed: () {
        errorMessage = 'Method Not Allowed';
      },
      badRequest: () {
        errorMessage = 'Bad request';
      },
      unexpectedError: () {
        errorMessage = 'Unexpected error occurred';
      },
      requestTimeout: () {
        errorMessage = 'Connection request timeout';
      },
      noInternetConnection: () {
        errorMessage = 'No internet connection';
      },
      conflict: () {
        errorMessage = 'Error due to a conflict';
      },
      sendTimeout: () {
        errorMessage = 'Send timeout in connection with API server';
      },
      unableToProcess: () {
        errorMessage = 'Unable to process the data';
      },
      defaultError: (String error, Response? response) {
        errorMessage = error;
      },
      formatException: () {
        errorMessage = 'Unexpected error occurred (format exception)';
      },
      notAcceptable: () {
        errorMessage = 'Not acceptable';
      },
    );

    return errorMessage;
  }
}
