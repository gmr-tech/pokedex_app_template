// ignore_for_file: library_private_types_in_public_api, public_member_api_docs

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../common/domain/app_failure.dart';
import '../../../common/domain/entities/pokemon.dart';
import '../../../common/domain/x_state.dart';
import '../../../common/presentation/common_present_const.dart';
import '../domain/i_pokemon_repository.dart';

/// [PokemonController] foi criada para realizar o controle das ações voltadas
/// a feature da pokemon. A classe utiliza o package GetX como gerenciador de
/// de estado e injetor de dependências.
@injectable
class PokemonController extends GetxController {
  PokemonController(
    this._pokemonRepository,
    // Utiliza as anotações [@factoryParam] pois dentro das configurações da
    // injeção de dependência foi definida a forma como que é criada a instância
    // do de PokemonController.
    @factoryParam this.id, {
    @factoryParam this.pokemon,
  });

  // Quando o controller for inicializado, este método é chamado e realiza
  // a verificação, se o pokemon é nulo ele realizará a busca dos detalhes do
  // pokémon, caso contrário, se o pokémon já estiver definido ele retornará
  // o estado de sucesso.
  @override
  void onInit() {
    super.onInit();
    if (pokemon == null) {
      unawaited(_fetchPokemon(id));
    } else {
      status.value = const XState.success();
    }
  }

  final IPokemonRepository _pokemonRepository;
  final int id;

  /// Status do estado do Pokemon (inicializado como 'initial').
  final Rx<XState> status = Rx(const XState.initial());

  /// Instância do tipo Pokemon (pode ser nulo inicialmente).
  Pokemon? pokemon;

  /// [_fetchPokemon] é um metodo criado para realizar a busca dos
  /// detalhes de pokémosn.
  Future<void> _fetchPokemon(int id) async {
    /// Estado inicial do método, estado de carregamento.
    status.value = const XState.loading();

    // Aguarda a conclusão de duas operações assíncronas.
    final futures = await Future.wait([
      // Buscar detalhes do Pokémon no repositório por meio do método.
      _pokemonRepository.fetchPokemonDetails(id),

      // Aguardar um pequeno atraso (anti-flashing).
      Future.delayed(
        const Duration(
          milliseconds: CommonPresentConst.antiFlashingTime,
        ),
      ),
    ]);

    // Pega o primeiro elemento da lista futures.
    final result = futures.first as Either<AppFailure, Pokemon>;

    // retorna o método do [fold] que é proveniente do package da dartz.
    // Este método verifi
    return result.fold(
      // Left (Error)
      (failure) => status.value = const XState.error(),
      // Right (Sucesso)
      (pokemonResult) {
        // Recebe o resultado da busca.
        pokemon = pokemonResult;
        // Muda o estado para sucesso.
        status.value = const XState.success();
      },
    );
  }

  /// Método [refreshPokemon] realiza uma nova busca de pokémons. Ele chama o
  /// método _fetchPokemon com o mesmo ID para buscar o Pokémon novamente.
  Future<void> refreshPokemon() => _fetchPokemon(id);
}
