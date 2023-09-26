// ignore_for_file: avoid_dynamic_calls
// ignore_for_file: avoid-top-level-members-in-tests

import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pokedex_app_template/src/common/domain/app_failure.dart';
import 'package:pokedex_app_template/src/common/domain/entities/pokemon.dart';
import 'package:pokedex_app_template/src/common/domain/entities/pokemon_identifier.dart';
import 'package:pokedex_app_template/src/common/infrastructure/DTOs/pokemon_dto.dart';
import 'package:pokedex_app_template/src/features/pokelist/domain/i_pokelist_repository.dart';

import '../../../../utils/json_files.dart';

// Essa classe foi criada para testar o comportamento do código, substituindo o
// repositório conectado a api, pelo repositório mockado. Fazendo com que possa
// ser testado a lógica da aplicação sem depender do repositório real.
class MockPokeListRepository implements IPokeListRepository {
  // Esta função simula a busca de identificadores de Pokémon.
  @override
  Future<Either<AppFailure, List<PokemonIdentifier>>>
      fetchAllPokemonsIdentifiers({
    int offset = 0,
  }) async {
    // Caminho da lista de pokemons.
    final result = File(JsonFiles.pokemonList.path);

    // Analisar a resposta JSON para extrair identificadores de pokémons.
    final jsonResponse = json.decode(result.readAsStringSync());
    final List results = jsonResponse['results'] as List;

    final List<PokemonIdentifier> pokemons = [];

    for (int index = 0; index < results.length; index++) {
      final pokemon = results[index];

      // [identifier] foi criado para conseguir estrair da url do pokémon
      // o seu id.
      final identifier = int.tryParse(pokemon['url'].split('/')[6]);

      if (identifier == null) {
        // Tratar erro se o identificador não puder ser obtido.
        return left(const AppFailure.unexpected(object: 'index is null'));
      } else {
        // Adicionar o indentificar de pokémon na lista.
        pokemons.add(
          PokemonIdentifier(
            id: identifier,
            name: pokemon['name'],
            detailsUrl: pokemon['url'],
          ),
        );
      }
    }

    return right(pokemons);
  }

  // Esta função simula a busca dos detalhes de Pokémon.
  @override
  Future<Either<AppFailure, Pokemon>> fetchPokemonDetails(int id) async {
    final result = File(JsonFiles.pokemon.path);

    final jsonResponse = json.decode(result.readAsStringSync());
    final Pokemon pokemon = PokemonDTO.fromMap(jsonResponse).toDomain();

    // Retornar a lista de detalhes de pokémons como sucesso (right).
    return right(pokemon);
  }
}
