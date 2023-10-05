// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../common/presentation/common_present_const.dart';
import '../../../../utils/display_strings.dart';
import '../../../../utils/test_friendly_wrapper.dart';

/// [PokemonPageLoading] foi criada para ser utilizada no momento em que a
/// feature pokemon estiver no estado de carregamento.
class PokemonPageLoading extends StatelessWidget {
  const PokemonPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          // Tamanho do eixo principal.
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(DisplayStrings.loadingPokemon),
            DSBoxSpace.large(),
            // [TestFriendlyWrapper] adicionado para identificar quando o app
            // está em teste. Se for o caso, utilizara o `replacement`, senão,
            // utilizará o child.
            TestFriendlyWrapper(
              replacement: CircularProgressIndicator.adaptive(
                value: CommonPresentConst.progressIndicatorTestValue,
              ),
              child: CircularProgressIndicator.adaptive(),
            ),
          ],
        ),
      ),
    );
  }
}
