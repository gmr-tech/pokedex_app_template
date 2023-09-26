// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injectable/injectable.dart';

import '../../../common/domain/app_failure.dart';
import '../../../common/domain/domain_constants.dart';
import '../../../common/domain/entities/pokemon.dart';
import '../../../common/infrastructure/DTOs/pokemon_dto.dart';
import '../../../common/infrastructure/global_exception_handle.dart';
import '../domain/i_pokemon_repository.dart';

/// Classe [PokemonRepository] criada para implementar o contrato do
/// repositório da pokelist (IPokemonRepository), e realizar a conexão
/// com a api da web.
///
/// [LazySingleton] significa que [PokemonRepository] é representado como uma
/// implementação de [IPokemonRepository], e possui uma instância que pode
/// ser acessada em toda aplicação.
@LazySingleton(as: IPokemonRepository)
class PokemonRepository implements IPokemonRepository {
  /// [cache] foi criada para estabelecer configurações específicas, como a
  /// chave de cache e o período de validade do cache.
  final cache = CacheManager(
    Config(
      DomainConstants.pokelistCacheKey,
      stalePeriod: const Duration(days: DomainConstants.cacheDurationInDays),
    ),
  );

  /// Método [fetchPokemonDetails] criado para realizar a busca dos detalhes dos
  /// dos Pokémons.
  @override
  Future<Either<AppFailure, Pokemon>> fetchPokemonDetails(
    int id,
  ) async {
    try {
      // Url da API com o id interpolado para buscar os detalhes
      // em geral do pokémon.
      final baseUrl = '${DomainConstants.baseApiAddress}$id/';

      // Verificar se os detalhes do pokémon já estão em cache
      final file = await cache.getSingleFile(baseUrl);

      // Os dados vindos da api são convertidos para o modelo de domínio da
      // aplicação, no caso, Pokemon.
      final pokemon = PokemonDTO.fromMap(
        jsonDecode(await file.readAsString()),
      ).toDomain();

      // Retornar os detalhes do pokémon como sucesso (right).
      return right(pokemon);
    } on Exception catch (e) {
      // Tratar exceções e convertê-las em falhas com o GlobalExceptionHandle.
      return left(GlobalExceptionHandle.handle(e));
    }
  }
}
