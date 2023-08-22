// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../common/presentation/theme_switcher_button.dart';
import '../../../../utils/display_strings.dart';

/// A classe `PokeListDrawer` serve para criar a estrutura do menu drawer da
/// aplicação, sendo tanto implementação dos listile (criados em outros
/// arquivos) quanto o cabeçalho com o nome do app.
class PokeListDrawer extends StatelessWidget {
  const PokeListDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // SafeArea: widget de layout utilizado para combinar as proporções de
      // aplicativo com o tamanho da tela do smartphone.
      child: SafeArea(
        child: Column(
          // crossAxisAlignment: alinhamento cruzado adicionado ao título do
          // drawer, no lado esquerdo (start).
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Espaçamento interno adicionado para melhorar a distância dos
            // texto para a borda.
            Padding(
              padding: const EdgeInsets.all(DSConstSpace.medium),
              child: Text(
                DisplayStrings.appName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const ThemeSwitcherButton(),
          ],
        ),
      ),
    );
  }
}
