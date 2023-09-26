// ignore_for_file: public_member_api_docs, one_member_abstracts

import 'package:dartz/dartz.dart';

import '../../../common/domain/app_failure.dart';
import '../../../common/domain/entities/pokemon.dart';
import '../../../common/domain/entities/pokemon_identifier.dart';

/// Classe [IPokeListRepository] desenvolvida para criar um contrato com quais
/// devem ser subscritos, na camada de infraestrutura.
abstract class IPokeListRepository {
  /// Método [fetchAllPokemonsIdentifiers] criado para buscar todos os
  /// identificadores de pokemons na api.
  Future<Either<AppFailure, List<PokemonIdentifier>>>
      fetchAllPokemonsIdentifiers();

  /// Método [fetchPokemonDetails] criado para buscar todos os
  /// detalhes de pokemons na api.
  Future<Either<AppFailure, Pokemon>> fetchPokemonDetails(
    int id,
  );
}
