// ignore_for_file: avoid_dynamic_calls
// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../common/domain/app_failure.dart';
import '../../../common/domain/domain_constants.dart';
import '../../../common/domain/entities/pokemon.dart';
import '../../../common/domain/entities/pokemon_identifier.dart';
import '../../../common/infrastructure/DTOs/pokemon_dto.dart';
import '../../../common/infrastructure/global_exception_handle.dart';
import '../domain/i_pokelist_repository.dart';

/// Classe [PokeListRepository] criada para implementar o contrato do
/// repositório da pokelist (IPokeListRepository), e realizar a conexão
/// com a api da web.
///
/// [LazySingleton] significa que [PokeListRepository] é representado como uma
/// implementação de [IPokeListRepository], e possui uma instância que pode
/// ser acessada em toda aplicação.
@LazySingleton(as: IPokeListRepository)
class PokeListRepository implements IPokeListRepository {
  PokeListRepository();

  /// [cache] foi criada para estabelecer configurações específicas, como a
  /// chave de cache e o período de validade do cache.
  final cache = CacheManager(
    Config(
      DomainConstants.pokelistCacheKey,
      stalePeriod: const Duration(days: DomainConstants.cacheDurationInDays),
    ),
  );

  @override
  Future<Either<AppFailure, List<PokemonIdentifier>>>
      fetchAllPokemonsIdentifiers() async {
    // Url da API para buscar identificadores de pokémons.
    const String baseURL = '${DomainConstants.baseApiAddress}'
        '?offset=0'
        '&limit=${DomainConstants.maxFetchCount}';

    try {
      // Realizar uma solicitação http get para a url da api [baseURL]
      final response = await http.get(Uri.parse(baseURL));

      if (response.statusCode == 200) {
        // Analisar a resposta JSON para extrair identificadores de pokémons.
        final jsonResponse = json.decode(response.body);
        final List results = jsonResponse['results'] as List;

        final List<PokemonIdentifier> pokemons = [];

        for (int index = 0; index < results.length; index++) {
          final pokemon = results[index];

          /// [identifier] foi criado para conseguir estrair da url do pokémon
          /// o seu id.
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

        // Retornar a lista de identificadores de pokémons como sucesso (right).
        return right(pokemons);
      } else {
        // Tratar erro se a resposta da api não for bem-sucedida.
        return left(AppFailure.unexpected(object: response.body));
      }
    } on Exception catch (e) {
      // Tratar exceções e convertê-las em falhas com o GlobalExceptionHandle.
      return left(GlobalExceptionHandle.handle(e));
    }
  }

  @override
  Future<Either<AppFailure, Pokemon>> fetchPokemonDetails(
    int id,
  ) async {
    try {
      // [baseUrl] desenvolvida para construir a URL do pokémon com base
      // no ID fornecido.
      final baseUrl = '${DomainConstants.baseApiAddress}$id/';

      // Verificar se os detalhes do pokémon já estão em cache
      final file = await cache.getSingleFile(baseUrl);

      // Os dados vindos da api são convertidos para o modelo de domínio da
      // aplicação, no caso, Pokemon.
      final pokemon = PokemonDTO.fromMap(
        jsonDecode(await file.readAsString()),
      ).toDomain();

      // Retornar a lista de detalhes de pokémons como sucesso (right).
      return right(pokemon);
    } on Exception catch (e) {
      // Tratar exceções e convertê-las em falhas com o GlobalExceptionHandle.
      return left(GlobalExceptionHandle.handle(e));
    }
  }
}
