// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/entities/pokemon.dart';
import '../../../../utils/display_strings.dart';
import '../../../../utils/string_x.dart';
import '../pokemon_present_const.dart';
import 'pokemon_details_about_ui.dart';
import 'pokemon_details_stats_ui.dart';

/// Classe criada para organizar todos os detalhes relacionadados a um pokémon
/// sendo eles, `PokemonDetailsAboutUI`,
class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    required this.pokemon,
    super.key,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final Color pokemonColor = pokemon.types.first.color;

    return Material(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: const BorderRadius.vertical(
        top: DSConstProperty.radiusXLarge,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          DSConstSpace.medium,
          PokemonPresentConst.imageToDetailsDifference,
          DSConstSpace.medium,
          MediaQuery.of(context).padding.bottom > 0
              ? MediaQuery.of(context).padding.bottom
              : DSConstSpace.medium,
        ),
        // HACK: ListView forces alignment to left
        // ignore: prefer-using-list-view
        child: Column(
          children: [
            // Implementação do tipo de pokémon na interface.
            // O [Wrap] é adicionado para juntar e congfigurar
            // o espaçamento.
            Wrap(
              spacing: DSConstSpace.small,
              runSpacing: DSConstSpace.small,
              children: pokemon.types
                  .map(
                    (type) => DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          DSConstProperty.radiusXLarge,
                        ),
                        color: type.color.withOpacity(0.75),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: DSConstSpace.small,
                          horizontal: DSConstSpace.medium,
                        ),
                        child: Text(
                          type.name.capitalizeFirst(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const DSBoxSpace.small(),
            // Implementação dos detalhes dos pokémons na interface do usuário.
            PokemonDetailsAboutUI(pokemon: pokemon),
            const DSBoxSpace.large(),
            Text(
              DisplayStrings.baseStats,
              style: textTheme.headlineLarge!.copyWith(color: pokemonColor),
            ),
            const DSBoxSpace.small(),
            // Implementação dos detalhes do pokémon na interface do usuário.
            PokemonDetailsStatsUI(pokemon: pokemon),
            const Spacer(),
            Row(
              children: [
                // Botão para adicionar a lista de pokémons favoritos
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => log('Implement toggle favorite'),
                    icon: const Icon(Icons.favorite_border_rounded),
                    label: const Text(DisplayStrings.addToFavorites),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
