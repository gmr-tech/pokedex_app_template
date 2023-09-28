// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/domain/domain_constants.dart';
import '../../../../common/domain/entities/pokemon.dart';
import '../../../../common/presentation/app_assets.dart';
import '../../../../features/pokemon/presentation/pokemon_present_const.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/int_x.dart';
import '../../../../utils/string_x.dart';
import '../../../pokelist/presentation/ui_components/hero_pokemon_image.dart';
import 'pokemon_details.dart';

/// [PokemonPageSuccess] foi criada para ser utilizada no momento em que a
/// feature pokemon estiver no estado de sucesso.
class PokemonPageSuccess extends StatelessWidget {
  const PokemonPageSuccess({
    required this.pokemon,
    super.key,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Ink(
        color: pokemon.types.first.color.withOpacity(0.4),
        child: SafeArea(
          bottom: false,
          // [Stack] utilizado para empilhar os elementos visuais da tela.
          child: Stack(
            children: [
              // Posicionamento da imagem da pokebola no fundo da tela.
              Positioned(
                top: DSConstSpace.medium,
                right: DSConstSpace.medium,
                // [SvgPicture.asset] widget usado para renderizar a imagem da
                // Pokébola no canto superior direito da tela.
                child: SvgPicture.asset(
                  DSIconPath.pokeball.path,
                  package: AppAssets.designSystemPackage,
                  width: PokemonPresentConst.imageHeight,
                  // Cor da pokebola.
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              // Posicionamento de todos os detalhes do pokémon.
              Positioned(
                top: PokemonPresentConst.imageHeight -
                    PokemonPresentConst.imageToDetailsDifference +
                    DSConstSize.minButtonVisualHeight,
                left: 0,
                right: 0,
                bottom: 0,
                child: PokemonDetails(pokemon: pokemon),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const DSBoxSpace.small(),
                      // Essa estrutura condicional verifica se o usuário pode
                      // voltar para a tela anterior. Se for possível voltar,
                      // ele mostra o botão. Se não for
                      // possível voltar, ele mostra um botão de Pokébola que
                      // permite ao usuário navegar para a lista de Pokémon.
                      if (Navigator.canPop(context))
                        BackButton(
                          color: Theme.of(context).iconTheme.color,
                        )
                      else ...[
                        IconButton(
                          onPressed: () => context.pushReplacementNamed(
                            AppRoutes.pokeList,
                          ),
                          icon: const DSIcon.large(
                            icon: DSIconPath.pokeball,
                          ),
                        ),
                        const DSBoxSpace(),
                      ],
                      // Nome do pokémon com a primeira letra maiúscula.
                      Text(
                        pokemon.name.capitalizeFirst(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const Spacer(),
                      // Número do id formatado.
                      Text(
                        pokemon.id.formatID(),
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const DSBoxSpace(),
                    ],
                  ),
                  Row(
                    children: [
                      const DSBoxSpace.small(),
                      // se o id representado em tela for maior que 1, irá
                      // aparecer a seta de navegação para esquerda, senão,
                      // retornará um espaço vaziu.
                      if (pokemon.id > 1)
                        IconButton(
                          onPressed: () => context.pushReplacementNamed(
                            AppRoutes.pokemon,
                            pathParameters: {
                              AppRoutes.pokemonId: (pokemon.id - 1).toString(),
                            },
                          ),
                          icon: const Icon(Icons.chevron_left),
                        )
                      else
                        const DSBoxSpace.xLarge(),
                      const Spacer(),
                      // Imagem do pokémon
                      SizedBox(
                        // Altura da imagem
                        height: PokemonPresentConst.imageHeight,
                        child: HeroPokemonImage(
                          id: pokemon.id,
                          imageUrl: pokemon.imageUrl,
                        ),
                      ),
                      const Spacer(),
                      // Se o id representado em tela for menor que o número
                      // máximo de pokémons buscados, aparecerá o seta para
                      // direita, senão, retornará um espaço vaziu.
                      if (pokemon.id < DomainConstants.maxFetchCount)
                        IconButton(
                          onPressed: () => context.pushReplacementNamed(
                            AppRoutes.pokemon,
                            pathParameters: {
                              AppRoutes.pokemonId: (pokemon.id + 1).toString(),
                            },
                          ),
                          icon: const Icon(Icons.chevron_right),
                        )
                      else
                        const DSBoxSpace.xLarge(),
                      const DSBoxSpace.small(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
