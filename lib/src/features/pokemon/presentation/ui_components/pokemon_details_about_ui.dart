// ignore_for_file: public_member_api_docs

import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/entities/pokemon.dart';
import '../../../../utils/display_strings.dart';
import '../../../../utils/num_x.dart';

/// Método criado para configurar os detalhes de cada pokémon
/// na interface do usuário, sendo: altura, peso e movimentos especiais.
class PokemonDetailsAboutUI extends StatelessWidget {
  const PokemonDetailsAboutUI({
    required this.pokemon,
    super.key,
  });

  // Instância do modelo do tipo pokémon que será iniacilizado por meio
  // do construtor da classe.
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    // Variavel criada para conseguir a cor característica do pokémon com
    // base no seu tipo.
    final Color pokemonColor = pokemon.types.first.color;

    return Column(
      children: [
        Text(
          DisplayStrings.about,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: pokemonColor),
        ),
        const DSBoxSpace.small(),
        // [IntrinsicHeight] é um widget usado para garantir que os
        // elementos dentro dele tenham a mesma altura máxima. Ele
        // envolve um Row que contém informações sobre peso, altura e
        // movimentos especiais do Pokémon.
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DSBoxSpace(),
              // [Expanded] utilizado para conseguir ocupar o espaço
              // disponível em tela, referente a orientação do widget
              // filho.
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const DSIcon(icon: DSIconPath.weight),
                        const DSBoxSpace.xSmall(),
                        // [Flexible] widget utilizado para fazer com que o
                        // texto ocupe apenas o espaço disponível para ele
                        Flexible(
                          child: Text(
                            pokemon.aboutProperties.weight.formatKilogram(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ),
                        const DSBoxSpace.small(),
                      ],
                    ),
                    const Spacer(),
                    const DSBoxSpace.small(),
                    const Text(DisplayStrings.weigth),
                  ],
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Widget [Transform.rotate] adicionado para
                          // rotacionar o ícone de régua.
                          Transform.rotate(
                            angle: pi * 0.5,
                            child: const DSIcon(icon: DSIconPath.straighten),
                          ),
                          // Transforma a unidade de mediada expressa no
                          // tamanho do pokémon em metro.
                          Text(
                            pokemon.aboutProperties.height.formatMeter(),
                          ),
                          const DSBoxSpace.small(),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const DSBoxSpace.small(),
                    const Text(DisplayStrings.height),
                  ],
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    /// (...) é utilizado a propagação spread para que possar
                    /// ser propagado/juntado o valor da lista de movimentos
                    /// do pokémon e assim gerar uma nova lista.
                    ...List.generate(
                      // Tamanho do lista.
                      pokemon.aboutProperties.moves.length >= 2
                          ? 2
                          : pokemon.aboutProperties.moves.length,
                      // Função construtora.
                      (index) => Text(
                        pokemon.aboutProperties.moves[index],
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                    const DSBoxSpace.small(),
                    const Text(DisplayStrings.moves),
                  ],
                ),
              ),
              const DSBoxSpace(),
            ],
          ),
        ),
      ],
    );
  }
}
