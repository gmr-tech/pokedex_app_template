// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// A classe é anotada como @immutable, o que significa que seus objetos
/// são imutáveis. Ou seja, depois que um objeto `PokemonBaseStats` é criado,
/// seus valores não podem ser alterados.
///
/// A classe `PokemonBaseStats` é criada como forma de determimar as
/// estatísticas do pokémon, levando em consideração dados como:
///
/// 1. `hp`: representa o valor de pontos de vida do pokémon (hit points);
/// 1. `attack`: representa o número da força do ataque do pokémon;
/// 1. `defense`: representa o número da força da defesa do pokémon;
/// 1. `specialAttack`:representa o número da força do ataque especial
/// do pokémon;
/// 1. `specialDeffense`: representa o número da força da defesa especial
///  do pokémon.
@immutable
class PokemonBaseStats {
  /// Construtor criado para fornecer as propriedades necessárias no momento de
  /// criação de qualquer instância da classe `PokemonBaseStats`.
  const PokemonBaseStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  /// Variáveis do tipo final criadas para que essas não tenham o seu valor
  /// alterado em tempo de execução após inicializadas e sejam adicionadas
  /// no construtor da classe.
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  /// O método `mapValues()` é criado como forma de fazer com que seja
  /// mais fácil acessar os dados fornecidos por essa clase, já que o
  /// método retorna um map com chave e valor, sendo cada chave,
  /// uma entrada para cada propriedade diferente.
  Map<String, int> mapValues() {
    return {
      'HP': hp,
      'ATK': attack,
      'DEF': defense,
      'SATK': specialAttack,
      'SDEF': specialDefense,
      'SPD': speed,
    };
  }

  /// Temos o método `copyWith` como forma de fazer com que tenhamos a
  /// possibillidade de gerar uma cópia de todos os dados e
  /// alterar o valor somente da propriedade que desejamos.
  ///
  /// O método utiliza o operador de coalescência nula `??` como
  /// forma de fazer com que, caso ao inicializar o método e determinada
  /// propriedade, por exemplo, `attack`, seja nulo, a propriedade ainda manterá
  /// o valor atual da propriedade original.
  PokemonBaseStats copyWith({
    int? hp,
    int? attack,
    int? defense,
    int? specialAttack,
    int? specialDefense,
    int? speed,
  }) {
    return PokemonBaseStats(
      hp: hp ?? this.hp,
      attack: attack ?? this.attack,
      defense: defense ?? this.defense,
      specialAttack: specialAttack ?? this.specialAttack,
      specialDefense: specialDefense ?? this.specialDefense,
      speed: speed ?? this.speed,
    );
  }

  /// O método `toString()` é criada para formatar os dados da classe
  /// **_PokemonBaseStats_** em uma String.
  @override
  String toString() {
    return 'PokemonBaseStats(hp: $hp, attack: $attack, defense: $defense, '
        'specialAttack: $specialAttack, specialDefense: $specialDefense, '
        'speed: $speed)';
  }

  /// O método operador de igualdade (==) é responsável por comparar dois
  /// objetos para verificar se eles são considerados iguais ou não. Nesse
  /// método, o operador == verifica se todas as propriedades dos objetos são
  /// iguais. Se todas as propriedades forem iguais, os objetos são considerados
  /// iguais e com isso o método recebe o valor de true.
  ///
  /// A função `identical(this, other)` é usada para verificar se duas
  /// referências de objetos em Dart apontam para exatamente a mesma instância
  /// na memória. Em outras palavras, `identical(this, other)` retorna **true**
  /// se **this e other** são a mesma instância (ou seja, o mesmo objeto) na
  /// memória e retorna false caso contrário.
  @override
  bool operator ==(covariant PokemonBaseStats other) {
    if (identical(this, other)) {
      return true;
    }

    return other.hp == hp &&
        other.attack == attack &&
        other.defense == defense &&
        other.specialAttack == specialAttack &&
        other.specialDefense == specialDefense &&
        other.speed == speed;
  }

  /// O método hashCode é uma função que já está presente em todos os objetos
  /// em Dart, neste caso, ele foi sobreescrito na classe e modificado para que
  /// o meio de comparação hashcode não fique limitado a comparação de números
  /// aleatórios que cada objeto possui, que por natureza se trata do seu
  /// hashCode, o identificador único.
  ///
  /// Sendo assim, essa comparação ocorre por meio do operador XOR (ˆ),
  /// que faz uma operaçåo bit a bit, entre cada objeto, para saber se eles
  /// são iguais ou não. Essa prática ajuda a minimizar as chances de erro
  /// com a utilização do hashCode como comparação, onde diferentes objetos
  /// teriam o mesmo valor hashCode. Se dois objetos tiverem as mesmas
  /// propriedades hp, attack, defense, specialAttack, specialDefense e speed,
  /// eles terão o mesmo valor hashCode. Caso contrário, se pelo menos uma das
  /// propriedades for diferente, o valor hashCode será diferente, indicando
  /// que os objetos são diferentes e garantindo que os objetos sejam comparados
  /// corretamente.
  @override
  int get hashCode {
    return hp.hashCode ^
        attack.hashCode ^
        defense.hashCode ^
        specialAttack.hashCode ^
        specialDefense.hashCode ^
        speed.hashCode;
  }
}
