// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:io';

import '../domain/app_failure.dart';

/// Classe [GlobalExceptionHandle] criada para tratar as excessões na aplicação.
/// mapeando exceções específicas, como HttpException, para instâncias de
/// AppFailure
class GlobalExceptionHandle {
  /// O método trata as as execessões recebidas e mapeia para uma instância
  /// `AppFailure`.
  static AppFailure handle(Object exception) {
    switch (exception.runtimeType) {
      case HttpException:
        return _handleHTTPExceptions(exception as HttpException);
      default:
        return AppFailure.unexpected(object: exception);
    }
  }

  static AppFailure _handleHTTPExceptions(Object exception) {
    const Map<int, AppFailure> handle = {
      404: AppFailure.notFound(),
      403: AppFailure.permissionDenied(),
    };

    return handle[exception.hashCode] ??
        AppFailure.unexpected(object: exception);
  }
}
