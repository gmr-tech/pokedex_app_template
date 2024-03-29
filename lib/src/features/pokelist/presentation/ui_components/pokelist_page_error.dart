// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../utils/display_strings.dart';

/// Página criada para informar o usuário sobre um erro ocorrido na página.
class PokeListPageError extends StatelessWidget {
  const PokeListPageError({
    super.key,
    this.onRefresh,
  });

  /// Função criada para executar um conjunto de comandos de modo direto, de
  /// forma que que não precise retornar nenhum valor ou passar parâmetros,
  /// permitindo especificar facilmente o que deve acontecer, no caso, a ação
  /// de atualizar a pokelist.
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error),
          const DSBoxSpace(),
          const Text(DisplayStrings.errorLoadingPokemons),

          // SizedBox adicionado para impor um maior espaçamento entre o texto
          // e o botão.
          const DSBoxSpace.xxLarge(),

          // ElevatedButton criado para realizar uma atualização na página.
          ElevatedButton.icon(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
            label: const Text(DisplayStrings.refresh),
          ),
        ],
      ),
    );
  }
}
