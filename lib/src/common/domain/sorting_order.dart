// // ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/display_strings.dart';

part 'sorting_order.freezed.dart';

/// A anotação @freezed indica que a classe `SortingOrder` será processada pelo
/// package freezed, para que assim possa ser gerado o arquivo com códigos
/// adicionais.
///
/// A classe `SortingOrder` é usada para representar diferentes tipos de
/// ordenação.
///
/// Utilizamos a palavra reservada `factory` para que nos construtores
/// nomeados tenha que retornar de maneira obrigatória uma nova
/// instância, no caso uma instância da classe _$SortingOrder. Adicionamos a
/// palavra const aos constantes, para que as instâncias criadas
/// não possam ser alteradas depois de criadas, garantindo que sejam imutáveis.
@freezed
class SortingOrder with _$SortingOrder {
  /// * Construtor nomeado da classe, criado para representar uma ordenação por
  /// nome do pokémon de A à Z;
  const factory SortingOrder.byNameAZ() = _ByNameAZ;

  /// * Construtor nomeado da classe, criado para representar a ordenação por
  ///  nome do pokémon de Z à A;
  const factory SortingOrder.byNameZA() = _ByNameZA;

  /// * Construtor nomeado da classe, criado para representar a ordenação por
  /// ID em ordem crescente.
  const factory SortingOrder.byIDLowHigh() = _ByIDLowHigh;

  /// * Construtor nomeado da classe, criado para representar a ordenação por
  /// ID em ordem crescente.
  const factory SortingOrder.byIDHighLow() = _ByIDHighLow;
}

/// A extensão chamada `SortTypeX` definida
/// para a classe `SortingOrder` é usada para adicionar novos
/// métodos ou propriedades a classe sem modificar sua
/// implementação original.
extension SortTypeX on SortingOrder {
  /// `isByNameAZ`: O getter isByNameAZ foi criado para retornar um valor
  /// booleano. Se o valor retornado for diferente do objeto
  /// `SortingOrder.byNameAZ`, o valor será false. Caso contrário, se o valor
  /// retornado for igual ao objeto SortingOrder.byNameAZ, o valor será true.
  bool get isByNameAZ => this == const SortingOrder.byNameAZ();

  /// isByNameZA: O getter isByNameZA foi criado para retornar um valor
  /// booleano. Se o valor retornado for diferente do objeto
  /// `SortingOrder.byNameZA`, o valor será false. Caso contrário, se o valor
  /// retornado for igual ao objeto SortingOrder.byNameZA, o valor será true.
  bool get isByNameZA => this == const SortingOrder.byNameZA();

  /// isByIDLowHigh: O getter isByIDLowHigh foi criado para retornar um valor
  /// booleano. Se o valor retornado for diferente do objeto
  /// `SortingOrder.byIDLowHigh`, o valor será false. Caso contrário, se o valor
  /// retornado for igual ao objeto SortingOrder.byIDLowHigh, o valor será true.
  bool get isByIDLowHigh => this == const SortingOrder.byIDLowHigh();

  /// isByIDHighLow: O getter isByIDHighLow foi criado para retornar um valor
  /// booleano. Se o valor retornado for diferente do objeto
  /// `SortingOrder.byIDHighlow`, o valor será false. Caso contrário, se o valor
  /// retornado for igual ao objeto SortingOrder.byIDHighlow, o valor será true.
  bool get isByIDHighLow => this == const SortingOrder.byIDHighLow();

  /// O getter `display` foi criada para que possa ser retornada uma String de
  /// acordo com qual ordenação que está sendo representada. Como por exemplo,
  /// caso esteja sendo utilizado a ordenação alfábetica de A à Z, será
  /// retornado a String 'Name (A-Z)'.
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
