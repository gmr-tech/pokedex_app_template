// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../utils/string_x.dart';

/// Classe criada para configurar o posicionamento e espaço em relação a
/// representação do nome e formatação da string.
class PokemonListCardName extends StatelessWidget {
  const PokemonListCardName({
    required this.name,
    required this.maxWidth,
    super.key,
  });

  final String name;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: DSConstSpace.mSmall,
      top: DSConstSpace.mSmall,
      right: DSConstSpace.xxLarge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name.capitalizeFirst(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
