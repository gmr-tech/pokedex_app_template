// ignore_for_file: public_member_api_docs, discarded_futures
// ignore_for_file: prefer-async-await, avoid-ignoring-return-values

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../common/domain/entities/pokemon_identifier.dart';
import '../../../config/injection.dart';
import '../../../routes/app_routes.dart';
import '../../pokemon/application/pokemon_controller.dart';
import '../../pokemon/domain/i_pokemon_repository.dart';
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
// Obtém o id como parâmetro e controlador de fluxo para garantir
// que o usuário possa carregar qualquer
// ignore: avoid-late-keyword
  late final PokemonController controller;

  // [initState] inicializa o estado e configura um PokemonController.
  // O PokemonController é usado para buscar as informações
  // sobre o Pokémon com base em seu ID.
  @override
  void initState() {
    super.initState();
    controller = Get.put(
      PokemonController(
        getIt<IPokemonRepository>(),
        widget.pokemonIdentifier.id,
      ),
      // A tag é usada para identificar exclusivamente uma
      // instância do controlador,
      tag: 'pokemon_controller_${widget.pokemonIdentifier.id}',
    );
  }

  @override
  Widget build(BuildContext context) {
    // InkWell: widget utilizado para transformar qualquer outro widget
    // filho em um botão.
    return InkWell(
      borderRadius: const BorderRadius.all(DSConstProperty.radius),
      onTap: () => context.pushNamed(
        AppRoutes.pokemon,
        pathParameters: {
          AppRoutes.pokemonId: controller.id.toString(),
        },
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(DSConstProperty.radius),
        ),

        /// Instância de função gerada pelo freezed, que serve para startar
        /// funções em diferentes estados possíveis da tela, sendo:
        /// loading (carregamento), sucess (sucesso), orElse, que significa caso
        /// os outros estados não precisem ser mostrados, o que será mostrado
        /// será esse estado, no caso error.
        child: Obx(
          () => controller.status.value.maybeMap(
            loading: (_) => PokemonListCardLoading(
              pokemonID: widget.pokemonIdentifier,
            ),
            success: (_) => PokemonListCardSucess(
              pokemon: controller.pokemon!,
            ),
            orElse: () => PokemonListCardError(
              pokemonID: widget.pokemonIdentifier,
            ),
          ),
        ),
      ),
    );
  }
}
