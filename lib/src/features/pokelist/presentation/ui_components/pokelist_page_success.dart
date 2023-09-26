// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/entities/pokemon_identifier.dart';
import '../pokelist_present_const.dart';
import '../pokemon_list_card.dart';

/// `PokeListPageSucess` foi desenvolvida para mostrar ao usuário o estado de
/// sucesso da página de pokelist.
class PokeListPageSuccess extends StatefulWidget {
  const PokeListPageSuccess({
    required this.pokemons,
    this.bottomPadding = DSConstSpace.medium,
    super.key,
  });

  final List<PokemonIdentifier> pokemons;

  final double bottomPadding;

  @override
  State<PokeListPageSuccess> createState() => _PokeListPageSuccessState();
}

class _PokeListPageSuccessState extends State<PokeListPageSuccess> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: GridView.builder(
        // controller: objeto utilizado para controlar o posição de rolagem da
        // tela.
        controller: scrollController,

        // Espaçamento interno adicionado para melhorar a distância dos
        // elementos para a borda.
        padding: EdgeInsets.fromLTRB(
          DSConstSpace.medium,
          DSConstSpace.medium,
          DSConstSpace.medium,
          widget.bottomPadding,
        ),

        // itemCount: quantidade de itens que serão mostrados na tela.
        itemCount: widget.pokemons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // crossAxisCount: numéro de items da grid view no eixo cruzado.
          crossAxisCount: PokeListPresentConst.gridCrossAxisCount,

          // childAspectRatio: proporção de cada item da grid view.
          childAspectRatio: PokeListPresentConst.gridChildAspectRatio,

          // crossAxisSpacing: número de espaçamento no eixo cruzado.
          crossAxisSpacing: DSConstSpace.small,

          // espaçamento do eixo principal.
          mainAxisSpacing: DSConstSpace.small,
        ),

        // itemBuilder: construtor do item que molda as informaçõess que serão
        // mostradas em tela.
        itemBuilder: (context, index) => PokemonListCard(
          key: ValueKey(widget.pokemons[index].id),
          pokemonIdentifier: PokemonIdentifier(
            id: widget.pokemons[index].id,
            name: widget.pokemons[index].name,
            detailsUrl: widget.pokemons[index].detailsUrl,
          ),
        ),
      ),
    );
  }
}
