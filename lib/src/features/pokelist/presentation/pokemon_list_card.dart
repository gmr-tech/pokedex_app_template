// ignore_for_file: public_member_api_docs, discarded_futures
// ignore_for_file: prefer-async-await, avoid-ignoring-return-values

import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../../../mock/pokemon_details.mock.dart';
import '../../../common/domain/entities/pokemon_identifier.dart';
import '../../../common/domain/x_state.dart';
import 'ui_components/pokemon_list_card_error.dart';
import 'ui_components/pokemon_list_card_loading.dart';
import 'ui_components/pokemon_list_card_sucess.dart';

/// Widget que determina o layout do card representado na pokelist de forma
/// a avaliar o estado do componente e determinar a melhor informação para
/// passar ao usuário, sendo: loading, success e or else, que significa, caso
/// todos os outros estados não sejam o correto.
class PokemonListCard extends StatefulWidget {
  const PokemonListCard({
    required this.pokemonIdentifier,
    super.key,
  });

  final PokemonIdentifier pokemonIdentifier;

  @override
  State<PokemonListCard> createState() => _PokemonListCardState();
}

class _PokemonListCardState extends State<PokemonListCard> {
  // Variavel criada acessar a classe XState e determinar um estado ao card.
  //
  // Valor adicionado para inicializar.
  XState state = const XState.initial();

  @override
  Widget build(BuildContext context) {
    // Novo valor atribuído.
    state = const XState.success();

    // InkWell: widget utilizado para transformar qualquer outro widget
    // filho em um botão.
    return InkWell(
      borderRadius: const BorderRadius.all(DSConstProperty.radius),
      onTap: () => log('Navigation'),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(DSConstProperty.radius),
        ),

        /// Instância de função gerada pelo freezed, que serve para startar
        /// funções em diferentes estados possíveis da tela, sendo:
        /// loading (carregamento), sucess (sucesso), orElse, que significa caso
        /// os outros estados não precisem ser mostrados, o que será mostrado
        /// será esse estado, no caso error.
        child: state.maybeMap(
          loading: (_) => PokemonListCardLoading(
            pokemonID: widget.pokemonIdentifier,
          ),
          success: (_) => PokemonListCardSucess(
            pokemon: kPokemonDetailsMock,
          ),
          orElse: () => PokemonListCardError(
            pokemonID: widget.pokemonIdentifier,
          ),
        ),
      ),
    );
  }
}
