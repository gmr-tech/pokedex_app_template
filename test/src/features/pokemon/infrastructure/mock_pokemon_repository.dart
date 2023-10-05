// ignore_for_file: avoid-top-level-members-in-tests

import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pokedex_app_template/src/common/domain/app_failure.dart';
import 'package:pokedex_app_template/src/common/domain/entities/pokemon.dart';
import 'package:pokedex_app_template/src/common/infrastructure/DTOs/pokemon_dto.dart';
import 'package:pokedex_app_template/src/features/pokemon/domain/i_pokemon_repository.dart';

import '../../../../utils/json_files.dart';

// Essa classe foi criada para testar o comportamento do código, substituindo o
// repositório conectado a api, pelo repositório mockado. Fazendo com que possa
// ser testado a lógica da aplicação sem depender do repositório real.
class MockPokemonRepository implements IPokemonRepository {
  // Esta função simula a busca dos detalhes do Pokémon.
  @override
  Future<Either<AppFailure, Pokemon>> fetchPokemonDetails(int id) async {
    // Caminho da lista retornada.
    final result = File(JsonFiles.pokemon.path);

    // Realiza uma comversão do dado vindo da api, para um objeto de domain
    // já presente dentro da aplicação.
    final jsonResponse = json.decode(result.readAsStringSync());
    final Pokemon pokemon = PokemonDTO.fromMap(jsonResponse).toDomain();

    // Retornar a lista de detalhes de pokémons como sucesso (right).
    return right(pokemon);
  }
}
