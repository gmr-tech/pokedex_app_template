// ignore_for_file: public_member_api_docs

import 'dart:ui';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/domain_constants.dart';
import '../../../../common/domain/entities/pokemon.dart';
import '../../../../utils/get_text_size.dart';

/// Método criado para configurar os detalhes de estatisticas de cada pokémon
/// na interface do usuário.
class PokemonDetailsStatsUI extends StatelessWidget {
  const PokemonDetailsStatsUI({
    required this.pokemon,
    super.key,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    // Instância do tema de texto do design system da aplicação.
    final textTheme = Theme.of(context).textTheme;

    // A variável pokemonColor é definida para representar a cor
    // característica do Pokémon com base em seu primeiro tipo.
    final Color pokemonColor = pokemon.types.first.color;

    final stateTagStyle = textTheme.bodyMedium!.copyWith(
      color: pokemon.types.first.color,
    );

    final Size tagTextSize = getOneLineTextSize(
      'SDEF_',
      stateTagStyle,
      context,
    );

    final stateNumbeStyle = textTheme.bodyMedium!.copyWith(
      fontFeatures: const [FontFeature.tabularFigures()],
    );

    final Size numberTextSize = getOneLineTextSize(
      '999',
      stateNumbeStyle,
      context,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          pokemon.baseStats.mapValues().length,
          (index) =>
              // [IntrinsicHeight] é um widget usado para garantir que os
              // elementos dentro dele tenham a mesma altura máxima.
              IntrinsicHeight(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: DSConstSpace.xSmall,
                  ),
                  child: SizedBox(
                    width: tagTextSize.width,
                    child: Text(
                      // Pegar todas as chaves do map baseStats por
                      // meio do index e transformar em lista.
                      pokemon.baseStats.mapValues().keys.toList()[index],
                      style: stateTagStyle,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                // Divisor vertical entre o título da estatística
                // e o LinearProgressIndicator.
                const VerticalDivider(),
                SizedBox(
                  width: numberTextSize.width,
                  child: Text(
                    // Pegar todos os valores do map baseStats
                    // por meio do index, transformar em String
                    // e pular três casa para a esquerda.
                    pokemon.baseStats
                        .mapValues()
                        .values
                        .toList()[index]
                        .toString()
                        .padLeft(3, '0'),
                    style: stateNumbeStyle,
                  ),
                ),
                const DSBoxSpace.small(),
                // [Expanded] utilizado para conseguir ocupar o espaço
                // disponível em tela, referente a orientação do widget
                // filho.
                Expanded(
                  // [ClipRoundedRect] serve para conseguir arredondar as
                  // bordas de um widget.
                  child: ClipRRect(
                    // Arredondamento da borda da linha de progresso.
                    borderRadius: const BorderRadius.all(
                      Radius.circular(DSConstSize.linearIndicatorHeight / 2),
                    ),
                    child: LinearProgressIndicator(
                      // Altura mínima da linha de progresso.
                      minHeight: DSConstSize.linearIndicatorHeight,
                      // Pegar todos os valores do map baseStats
                      // por meio do index e transformar em lista, por último,
                      // dividir pelo valor máximo do estado base.
                      value:
                          pokemon.baseStats.mapValues().values.toList()[index] /
                              DomainConstants.baseStateMax,
                      color: pokemon.types.first.color,
                      backgroundColor: pokemonColor.withOpacity(0.3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
