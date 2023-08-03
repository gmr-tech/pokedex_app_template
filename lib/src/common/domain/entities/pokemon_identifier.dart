import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs

/// A classe é anotada como @immutable, o que significa que seus objetos
/// são imutáveis. Ou seja, depois que um objeto `PokemonIdentifier` é criados e
/// seus valores não podem ser alterados.
///
/// A classe `PokemonIdentifier` é criada como forma de determimar as formas
/// de identificação do pokémon, levando em consideração dados como:
///
/// 1. `id`: representa o valor do identificador único do pokemon;
/// 1. `name`: representa o nome do pokémon;
/// 1. `detailsUrl`: é um link url que fornece os detalhes do pokémon.
@immutable
class PokemonIdentifier {
  /// Construtor criado para fornecer as propriedades necessárias no momento da
  /// criação de qualquer instância da classe `PokemonIdentifier`.
  const PokemonIdentifier({
    required this.id,
    required this.name,
    this.detailsUrl,
  });

  /// Variáveis do tipo final criadas para que essas não tenham o seu valor
  /// alterado em tempo de execução e sejam adicionados no construtor da classe.
  final int id;
  final String name;
  final String? detailsUrl;

  /// Temos o método `copyWith()` como forma de fazer com que tenhamos a
  /// possibillidade de gerar uma cópia de todos os dados e
  /// alterar somente o valor da propriedade que desejamos.
  ///
  /// O método possui a utilizaçåo do operador de coalescência nula `??` como
  /// forma de fazer com que, caso ao inicializar o método e determinada
  /// propriedade, como por exemplo, `attack`, seja nulo, a propriedade ainda
  /// manterá o valor atual da propriedade original.
  PokemonIdentifier copyWith({
    int? id,
    String? name,
    String? detailsUrl,
  }) {
    return PokemonIdentifier(
      id: id ?? this.id,
      name: name ?? this.name,
      detailsUrl: detailsUrl ?? this.detailsUrl,
    );
  }

  /// O método `toString()` é criado para formatar os dados da classe
  /// **_PokemonBaseStats_** em uma String.
  ///
  /// A anotação @override, indica que o método está sendo sobrescrito
  /// (implementado) na classe atual.
  @override
  String toString() =>
      'PokemonIdentifier(id: $id, name: $name, detailsUrl: $detailsUrl)';

  /// A anotação @override, indica que o método está sendo sobrescrito
  /// (implementado) na classe atual.
  ///
  /// O método operador de igualdade (==) é responsável por comparar dois
  /// objetos para verificar se eles são considerados iguais ou não. Nesse
  /// método, o operador == verifica se todas as propriedades dos objetos
  /// são iguais. Se todas as propriedades forem iguais, os objetos são
  /// considerados iguais.
  ///
  /// A função `identical(this, other)` é usada para verificar se duas
  /// referências de objetos em Dart apontam para exatamente a mesma instância
  /// na memória. Em outras palavras, `identical(this, other)` retorna true se
  /// **this e other** são a mesma instância (ou seja, o mesmo objeto) na
  /// memória e retorna false caso contrário.
  @override
  bool operator ==(covariant PokemonIdentifier other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id &&
        other.name == name &&
        other.detailsUrl == detailsUrl;
  }

  /// O método hashCode é uma função que já está presente em todos os objetos
  /// em Dart, neste caso, ele foi sobreescrito na classe e modificado para que
  /// o meio de comparação hashcode não fique limitado a comparação de números
  /// aleatórios que cada objeto possui, que por natureza se trata do seu
  /// hashCode, o identificador único.
  ///
  /// Sendo assim, essa comparação ocorre por meio do operador XOR (ˆ),
  /// que faz uma operaçåo bit a bit, entre cada objeto, para saber se eles
  /// são iguais ou não. Essa técnica ajuda a minimizar as chances de erros
  /// com utilização do hashCode como coparação, onde diferentes objetos teriam
  /// o mesmo valor hashCode. Se dois objetos tiverem as mesmas propriedades
  /// id, name e detailsUrl, eles terão o mesmo valor hashCode. Caso contrário,
  /// se pelo menos uma das propriedades for diferente, o valor hashCode será
  /// diferente, indicando que os objetos são diferentes.
  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ detailsUrl.hashCode;
}
