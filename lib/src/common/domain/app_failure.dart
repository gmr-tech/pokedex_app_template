// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

/// A anotação @freezed indica que a classe `AppFailure` será processada pelo
/// package freezed e assim gerar o arquivo com códigos adicionais.
///
/// A classe `AppFailure` é usada para representar diferentes tipos de falhas na
/// aplicação.
///
/// A classe AppFailure tem a palavra reservada `with` para que possa ser
/// utilizado um mixin, ou seja misturar o contéudo que será gerado pelo
/// freezed no arquivo: <u>app_failure.freezed.dart</u>
///
/// Logo abaixo temos os construtores nomeados que são criados cada um, para
/// receber uma instância da classe `_$AppFailure`, sendo que pelo fato de
/// utilizar a keyword const, tratam-se de construtore imutáveis, após sua
/// inicialização não podem mais serem modificados em tempo de execução.
@freezed
class AppFailure<T> with _$AppFailure<T> {
  const factory AppFailure.notFound() = notFound;
  const factory AppFailure.unexpected({T? object}) = _Unexpected;
  const factory AppFailure.permissionDenied() = permitionDenied;
}
