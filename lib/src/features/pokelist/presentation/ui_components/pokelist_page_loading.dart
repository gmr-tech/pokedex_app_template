// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../utils/display_strings.dart';

/// Página criada para mostrar ao usuário o status
/// de carregamento da aplicação.
class PokeListPageLoading extends StatelessWidget {
  const PokeListPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(DisplayStrings.loadingPokemons),
          DSBoxSpace(),
          // CircularProgressIndicator.adaptive(): widget adaptativo que
          // consegue se adaptar a diferentes plataformas, sendo, ios ou
          // android.
          CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}
