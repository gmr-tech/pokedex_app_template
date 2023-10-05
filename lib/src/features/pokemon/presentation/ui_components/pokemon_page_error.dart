// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/app_routes.dart';
import '../../../../utils/display_strings.dart';

/// [PokemonPageError] foi criada para ser utilizada no momento em que a
/// feature pokemon estiver no estado de erro.
class PokemonPageError extends StatelessWidget {
  const PokemonPageError({
    this.onRefresh,
    super.key,
  });

  // Função criada para executar um conjunto de comandos de modo direto, de
  /// forma que que não precise retornar nenhum valor ou passar parâmetros,
  /// permitindo especificar facilmente o que deve acontecer, no caso, a ação
  /// de atualizar a pokelist.
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(DSConstSpace.medium),
              child: Row(
                children: [
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
                ],
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error),
                DSBoxSpace(),
                Text(DisplayStrings.errorLoadingPokemon),
                DSBoxSpace.xxLarge(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(DSConstSpace.medium),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: onRefresh,
                      icon: const Icon(Icons.refresh),
                      label: const Text(DisplayStrings.refresh),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
