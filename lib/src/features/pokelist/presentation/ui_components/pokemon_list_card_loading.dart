// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/entities/pokemon_identifier.dart';
import 'pokemon_list_card_id.dart';
import 'pokemon_list_card_name.dart';

/// Widget criado para representar o estado de carregamento do card na pokelist.
class PokemonListCardLoading extends StatelessWidget {
  const PokemonListCardLoading({
    required this.pokemonID,
    super.key,
  });

  final PokemonIdentifier pokemonID;

  @override
  Widget build(BuildContext context) {
    // Ink é um widget utilizado para configurar as propriedades decorativas
    // do card no estado de carregamento. Neste caso, utilizado para adicionar
    // um gradiente e o arredondamento da borda.
    return Ink(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.background,
          ],
        ),
        borderRadius: const BorderRadius.all(DSConstProperty.radius),
      ),
      // LayoutBuilder é um widget utilizado para tratar a responsividade da
      // tela em relação ao tamanho de cada widget em relação ao tamanho da
      // tela. Nesse caso, adicionado para arumar escalonamento de cada widget
      // no card de loading.
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          alignment: Alignment.center,
          children: [
            PokemonListCardName(
              name: pokemonID.name,
              maxWidth: constraints.maxWidth,
            ),
            PokemonListCardID(id: pokemonID.id),
            const Positioned(
              top: DSConstSpace.xLarge,
              bottom: DSConstSpace.medium,
              left: DSConstSpace.large,
              right: DSConstSpace.large,
              child: CircularProgressIndicator.adaptive(),
            ),
          ],
        ),
      ),
    );
  }
}
