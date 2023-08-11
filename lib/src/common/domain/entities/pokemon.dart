// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';

import 'pokemon_about_properties.dart';
import 'pokemon_base_stats.dart';
import 'pokemon_identifier.dart';
import 'pokemon_type.dart';

///
@immutable
class Pokemon extends PokemonIdentifier {
  /// Construtor criado para fornecer as propriedades necessárias no momento de
  /// criação de qualquer instância da classe `Pokemon`.
  const Pokemon({
    required super.id,
    required super.name,
    required this.imageUrl,
    required this.types,
    required this.aboutProperties,
    required this.baseStats,
    super.detailsUrl,
  });

  /// Variáveis do tipo final criadas para que essas não tenham o seu valor
  /// alterado em tempo de execução e sejam adicionados no construtor da classe.
  final String imageUrl;
  final List<PokemonType> types;
  final PokemonAboutProperties aboutProperties;
  final PokemonBaseStats baseStats;

  /// Temos o método `copyWith()` para fazer com que tenhamos a
  /// possibillidade de gerar uma cópia de todos os dados e
  /// alterar o valor somente da propriedade que desejamos.
  @override
  Pokemon copyWith({
    int? id,
    String? name,
    String? detailsUrl,
    String? imageUrl,
    List<PokemonType>? types,
    PokemonAboutProperties? aboutProperties,
    PokemonBaseStats? baseStats,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      detailsUrl: detailsUrl ?? this.detailsUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      types: types ?? this.types,
      aboutProperties: aboutProperties ?? this.aboutProperties,
      baseStats: baseStats ?? this.baseStats,
    );
  }

  /// O método operador de igualdade (==) é responsável por comparar dois
  /// objetos para verificar se eles são considerados iguais ou não. Esse
  /// método, o operador == verifica se todas as propriedades dos objetos são
  /// iguais. Se todas as propriedades forem iguais, os objetos são considerados
  /// iguais e o método retorna true.
  ///
  /// A função identical(this, other) é usada para verificar se duas referências
  /// de objetos em Dart apontam para exatamente a mesma instância na memória.
  /// Em outras palavras, `identical(this, other)` retorna **true** se
  /// **this e other** são a mesma instância (ou seja, o mesmo objeto) na
  /// memória, e retorna **false** caso contrário.
  @override
  bool operator ==(covariant Pokemon other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id &&
        other.name == name &&
        other.detailsUrl == detailsUrl &&
        other.imageUrl == imageUrl &&
        listEquals(other.types, types) &&
        other.aboutProperties == aboutProperties &&
        other.baseStats == baseStats;
  }

  /// O método hashCode é uma função que já está presente em todos os objetos
  /// em Dart, neste caso, ele foi sobreescrito na classe e modificado para que
  /// o meio de comparação hashcode não fique limitado a comparação de números
  /// aleatórios que cada objeto possui, que por natureza se trata do seu
  /// hashCode, o identificador único.
  ///
  /// Sendo assim, essa comparação ocorre por meio do operador XOR(ˆ),
  /// que faz uma operaçåo bit a bit, entre cada objeto, para saber se eles
  /// são iguais ou não. Essa técnica ajuda a minimizar as chances de erros ao
  /// utilizar o hashCode como comparação, onde diferentes objetos teriam o
  /// mesmo valor hashCode. Se dois objetos tiverem as mesmas propriedades
  /// id, name e detailsUrl, eles terão o mesmo valor hashCode. Caso contrário,
  /// se pelo menos uma das propriedades for diferente, o valor hashCode será
  /// diferente, indicando que os objetos são diferentes.
  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        detailsUrl.hashCode ^
        imageUrl.hashCode ^
        types.hashCode ^
        aboutProperties.hashCode ^
        baseStats.hashCode;
  }

  /// O método `toString` é criada para formatar os dados da classe
  /// **_Pokemon_** em uma String.
  /// A anotação @override, indica que o método está sendo sobrescrito
  /// (implementado) na classe atual.
  @override
  String toString() {
    return 'Pokemon(id: $id, imageUrl: $imageUrl, name: $name, '
        'detailsUrl: $detailsUrl, types: $types, '
        'aboutProperties: $aboutProperties, baseStats: $baseStats)';
  }
}
