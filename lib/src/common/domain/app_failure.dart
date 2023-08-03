// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

/// A anotação @freezed indica que a classe `AppFailure` será processada pelo
/// package freezed e assim gerar o arquivo com códigos adicionais.
///
/// A classe `AppFailure` é usada para representar diferentes tipos de falhas na
/// aplicação.
///
/// A classe AppFailure tem a palavra reservada `with` como forma de utilizar o
/// mixin, ou seja misturar o contéudo que será gerado pelo freezed no arquivo
/// <u>app_failure.freezed.dart</u>
///
///  Logo a baixo temos os contrutores que utilizam as palavras reservadas
/// `const` e `factory` como forma de criar os construtores de fábrica
/// (**factory**) e também imutáveis (**const**) para receber o método a
/// partir do código gerado no arquivo:
///
/// > <u>app_failure.freezed.dart</u>
@freezed
class AppFailure<T> with _$AppFailure<T> {
  const factory AppFailure.notFound() = notFound;
  const factory AppFailure.unexpected({T? object}) = _Unexpected;
  const factory AppFailure.permissionDenied() = permitionDenied;
}
