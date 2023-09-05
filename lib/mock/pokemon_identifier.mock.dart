// ignore_for_file: public_member_api_docs, prefer-static-class

import '../src/common/domain/entities/pokemon_identifier.dart';

/// Variável final que recebe uma lista com uma função auxiliar chamada
/// **generate** que possibilita passar como parâmetro um número inteiro que
/// determina a quantidade de vezes que será retornado o valor que é passado na
/// função, no caso uma instância da classe `PokemonIdentifier()`.
final kPokemonIdentifierListMock = List.generate(
  50,
  (index) => kPokemonIdentifierMock,
);

/// Constante criada para preeencher uma instância da entidade
/// `PokemonIdentifier`, que contém as propriedades básicas de identificação
/// do pokémon, sendo: o seu identificador (id), nome (name) e sua
/// foto (detailsUrl).
const kPokemonIdentifierMock = PokemonIdentifier(
  id: 1,
  name: 'bulbasaur',
  detailsUrl: 'https://pokeapi.co/api/v2/pokemon/1/',
);
