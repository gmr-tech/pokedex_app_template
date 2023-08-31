// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../common/domain/entities/pokemon_type.dart';
import '../../../../common/presentation/common_present_const.dart';
import '../../../../utils/string_x.dart';

/// PokemonTypeSelectionChip se trata da classe de configuração do layout
/// do chip de seleção do tipo de pokémon.
class PokemonTypeSelectionChip extends StatelessWidget {
  const PokemonTypeSelectionChip({
    required this.type,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final bool isSelected;
  final PokemonType type;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    // Ink é um widget utilizado para configurar as propriedades decorativas
    // do chip no estado de erro. Neste caso, utilizado para adicionar a cor e
    // o arredondamento do chip.
    return Ink(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          DSConstProperty.radiusXLarge,
        ),
        color: isSelected
            ? type.color.withOpacity(CommonPresentConst.highOpacity)
            : Theme.of(context)
                .disabledColor
                .withOpacity(CommonPresentConst.midOpacity),
      ),
      // InkWell: widget utilizado para transformar qualquer outro widget
      // filho em um botão.
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(
          DSConstProperty.radiusXLarge,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: DSConstSpace.small,
            horizontal: DSConstSpace.medium,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                type.name.capitalizeFirst(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(
                            isSelected ? 1 : CommonPresentConst.midOpacity,
                          ),
                    ),
              ),
              if (isSelected) ...[
                const DSBoxSpace.small(),
                Icon(
                  Icons.close,
                  size: DSConstSize.iconSizeSmall,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
