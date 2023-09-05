// ignore_for_file: public_member_api_docs, prefer-static-class

import '../src/common/domain/entities/pokemon.dart';
import '../src/common/domain/entities/pokemon_about_properties.dart';
import '../src/common/domain/entities/pokemon_base_stats.dart';
import '../src/common/domain/entities/pokemon_type.dart';

/// Variável final que recebe uma lista, que junto com a notação ponto, acessa
/// a função **generate** que irá criar uma lista por meio de um inteiro como
/// **length**, que determinará a quantidade de items representados e também
/// uma função que o seu valor retornado será repetido uma quantidade de vezes
/// de acordo com o length recebido.
final kPokemonDetailsListMock = List.generate(
  50,
  (index) => kPokemonDetailsMock,
);

/// Essa variável do tipo **final** chamada `kPokemonDetailsMock` foi criada
/// para preencher uma instância da entidade `Pokemon` em tempo compilação
/// apenas, para que possa ser testado na medida do possivél cada um dos
/// atributos.
final kPokemonDetailsMock = Pokemon(
  id: 1,
  name: 'bulbasaur',
  imageUrl:
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
  types: const [
    PokemonType.grass,
    PokemonType.poison,
  ],
  aboutProperties: PokemonAboutProperties(
    height: 7,
    weight: 69,
    moves: [
      'razor-wind',
      'swords-dance',
      'cut',
      'bind',
      'vine-whip',
      'headbutt',
      'tackle',
      'body-slam',
      'take-down',
      'double-edge',
      'growl',
      'strength',
      'mega-drain',
    ],
  ),
  baseStats: const PokemonBaseStats(
    hp: 45,
    attack: 49,
    defense: 49,
    specialAttack: 65,
    specialDefense: 65,
    speed: 45,
  ),
);
