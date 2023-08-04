// // ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/display_strings.dart';

part 'sorting_order.freezed.dart';

/// A anotação @freezed indica que a classe `SortingOrder` será processada pelo
/// package freezed e assim gerar o arquivo com códigos adicionais.
///
/// A classe `SortingOrder` é usada para representar diferentes tipos de
/// ordenação.
///
/// A classe `SortingOrder` tem a palavra reservada `with` como forma
/// de utilizar o mixin, ou seja, misturar o contéudo que será gerado
/// pelo freezed no arquivo
/// <u>sorting_order.freezed.dart</u>
///
///  Logo a baixo temos os contrutores que utilizam as palavras reservadas
/// `const` e `factory` como forma de criar os construtores de fábrica
/// (**factory**)e também imutáveis (**const**) para receber as classes
/// abstratas a partir do código gerado no arquivo:
/// <u>sorting_order.freezed.dart</u>
///
/// Esses construtores de fábrica são usados para criar instâncias da classe
/// `SortingOrder`. Como eles são constantes, as instâncias criadas não podem
/// ser alteradas depois de criadas, garantindo que sejam imutáveis, sendo
/// que eles atuam como se fossem enumerações também.
@freezed
class SortingOrder with _$SortingOrder {
  /// * Construtor de fábrica que representa uma ordenação do nome do pokémon
  /// de A à Z;
  const factory SortingOrder.byNameAZ() = _ByNameAZ;

  /// * Construtor de fábrica que representa uma ordenação do nome do pokémon
  ///  de Z à A;
  const factory SortingOrder.byNameZA() = _ByNameZA;

  /// * Construtor de fábrica que representa a ordenação por ID
  /// em ordem crescente.
  const factory SortingOrder.byIDLowHigh() = _ByIDLowHigh;

  /// * Construtor de fábrica que representa a ordenação por ID
  /// em ordem crescente.
  const factory SortingOrder.byIDHighLow() = _ByIDHighLow;
}

/// A extensão chamada `SortTypeX` definida
/// para a classe `SortingOrder` é usada para adicionar novos
/// métodos ou propriedades a classe sem modificar sua
/// implementação original.
///
/// Nesta extensão, são definidos quatro getters que
/// retornam um valor booleano, caso o objeto SortingOrder seja igual
/// ao respectivo membro da enumeração receberá **true*. Por exemplo, o getter
/// `isByNameAZ` retorna **true** se o `SortingOrder` for igual a
/// `SortingOrder.byNameAZ()`.
extension SortTypeX on SortingOrder {
  /// `isByNameAZ`: getter que foi criado como forma de comparar a atual
  /// enumeração que está sendo usada na aplicação. Caso a atual for exatamente
  /// igual (mesmo valor e mesmo tipo) a `SortingOrder.byNameAZ()`, o resultado
  /// será **true**, caso contrário, se o objeto `SortingOrder` atual for
  /// diferente de `SortingOrder.byNameAZ()`, o getter retornará false.
  bool get isByNameAZ => this == const SortingOrder.byNameAZ();

  /// `isByNameZA`: getter que foi criado como forma de comparar a atual
  /// enumeração que está sendo usada na aplicação. Caso a atual for exatamente
  /// igual (mesmo valor e mesmo tipo) a `SortingOrder.byNameZA()`, o resultado
  /// será **true**, caso contrário, se o objeto `SortingOrder` atual for
  /// diferente de `SortingOrder.byNameZA()`, o getter retornará false.
  bool get isByNameZA => this == const SortingOrder.byNameZA();

  /// `isByIDLowHigh`: getter que foi criado como forma de comparar a atual
  /// enumeração que está sendo usada na aplicação. Caso a atual for exatamente
  /// igual (mesmo valor e mesmo tipo) a `SortingOrder.isByIDLowHigh()`,
  /// o resultado será **true**, caso contrário, se o objeto `SortingOrder`
  /// atual for diferente de `SortingOrder.byNameZA()`, o getter
  /// retornará false.
  bool get isByIDLowHigh => this == const SortingOrder.byIDLowHigh();

  /// `isByIDHighLow`: getter que foi criado como forma de comparar a atual
  /// enumeração que está sendo usada na aplicação. Caso a atual for exatamente
  /// igual (mesmo valor e mesmo tipo) a `SortingOrder.issByIDHighLow()`,
  /// o resultado será **true**, caso contrário, se o objeto `SortingOrder
  /// atual for diferente de `SortingOrder.isByIDHighLow()`, o getter
  /// retornará false.
  bool get isByIDHighLow => this == const SortingOrder.byIDHighLow();

  /// A função do getter display é retornar uma `String` que condiz com
  /// o tipo de ordenação representada.
  String? get display {
    if (isByNameAZ) {
      return DisplayStrings.sortAZ;
    } else if (isByNameZA) {
      return DisplayStrings.sortZA;
    } else if (isByIDLowHigh) {
      return DisplayStrings.sortIDLowHigh;
    } else if (isByIDHighLow) {
      return DisplayStrings.sortIDHighLow;
    } else {
      return null;
    }
  }
}
