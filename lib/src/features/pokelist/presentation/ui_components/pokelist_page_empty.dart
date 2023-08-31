// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../utils/display_strings.dart';

/// Página criada para informar o usuário sobre o estado vaziu da pokelist.
class PokeListPageEmpty extends StatelessWidget {
  const PokeListPageEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.filter_alt_off,
            size: DSConstSize.iconSizeXLarge,
          ),
          DSBoxSpace(),
          Text(
            DisplayStrings.emptyPokemonsMessage,
          ),
        ],
      ),
    );
  }
}
