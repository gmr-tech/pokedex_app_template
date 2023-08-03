// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'x_state.freezed.dart';

/// A anotação @freezed indica que a classe `XState<T>` será processada pelo
/// package freezed e assim gerar o arquivo com códigos adicionais.
///
/// A classe `XState<T>` é usada para representar diferentes estados da
/// aplicação.
///
/// A classe `XState<T>` tem a palavra reservada `with` como forma
/// de utilizar o mixin, ou seja, misturar o contéudo que será gerado
/// pelo freezed no arquivo <u>x_state.freezed.dart</u>
///
///  Logo a baixo temos os contrutores que utilizam as palavras reservadas
/// `const` e `factory` como forma de criar os construtores de fábrica
/// (**factory**) e também imutáveis (**const**) para receber as classes
/// abstratas a partir do código gerado no arquivo:
/// <u>x_state.freezed.dart</u>
///
/// Esses construtores de fábrica são usados para criar instâncias da classe
/// `XState<T>`. Como eles são constantes, as instâncias criadas não podem
/// ser alteradas depois de criadas, garantindo que sejam imutáveis, sendo
/// que eles atuam como se fossem enumerações também.
///
/// **Observação:** O <T> no nome da classe XState<T> é um parâmetro de tipo
/// genérico. Ou seja, a classe pode utilizar tipos específicos de dados sem
/// definir esses tipos de forma antecipada. Neste caso, o tipo genérico é
/// representado pelo <T>, onde T é um identificador que pode ser substituído
/// por qualquer tipo de dado, por exemplo:
///
/// > `XState<String>.loading();`
@freezed
class XState<T> with _$XState {
  /// 1. initial: construtor que representa o estado inicial;
  const factory XState.initial() = _Initial;

  /// 2. loading: construtor que representa o estado de carregando;
  const factory XState.loading() = _Loading;

  /// 3. loading more: construtor que representa o estado de carregando mais.
  const factory XState.loadingMore() = _LoadingMore;

  /// 4. empty: construtor que representa o estado vaziu.
  const factory XState.empty() = _Empty;

  /// 5. sucess: construtor que representa o estado de sucesso;
  const factory XState.success() = _Success;

  /// 6. error: construtor que representa o estado de erro. A constante error
  /// também pode conter um objeto failure ({T? failure}) que representa
  /// informações adicionais sobre o erro que ocorreu.
  const factory XState.error({T? failure}) = _Error;
}

/// A extensão chamada `XStateX` definida
/// para a classe `XState<T>` é usada para adicionar novos
/// métodos ou propriedades a classe sem modificar sua
/// implementação original.
///
/// Estes getters retornam **true** caso o objeto `XState` seja igual ao
/// respectivo membro do estado. Por exemplo, o getter `isInitial` retorna
/// **true** se o `XState` for igual a `XState.initial()`.
///
/// **Observação:** A expressão `this is` é usada para testar o tipo de um
/// objeto em tempo de execução. Ela permite verificar se o objeto
/// atual (referenciado por this) é uma instância de uma
/// determinada classe ou tipo de variável.
extension XStateX on XState {
  bool get isInitial => this is _Initial;
  bool get isLoading => this is _Loading;
  bool get isLoadingMore => this is _LoadingMore;
  bool get isEmpty => this is _Empty;
  bool get isSuccess => this is _Success;
  bool get isError => this is _Error;
}
