// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../common/domain/domain_constants.dart';
import '../../../../common/domain/entities/pokemon_type.dart';
import '../../../../common/domain/sorting_order.dart';
import '../../../../common/domain/x_state.dart';
import '../../../../utils/display_strings.dart';
import '../../../../utils/string_x.dart';
import '../../application/pokelist_controller.dart';
import 'pokemon_type_selection_chip.dart';

/// Página criada para mostrar em tela o conteúdo do modal de filtro.
class PokelistSortAndFilterScreen extends StatefulWidget {
  const PokelistSortAndFilterScreen({
    required this.controller,
    super.key,
  });

  final PokeListController controller;

  @override
  State<PokelistSortAndFilterScreen> createState() =>
      _PokelistSortAndFilterScreenState();
}

class _PokelistSortAndFilterScreenState
    extends State<PokelistSortAndFilterScreen> {
  final expansionController = ExpansionTileController();

  // Variavel criada para determinar o estado dos elementos presentes no
  // modal de ordenaçào e filtragem.
  //
  // Valor adicionado para inicializar.
  XState detailsState = const XState.initial();

  // Variável criada para determinar se o modo de pesquisa está ativo ou não
  //
  // Valor acrescentado para inicializar.
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    // Novo valor atribuído.
    detailsState = const XState.success();

    // Novo valor atribuído.
    isSearching = true;

    return Column(
      // mainAxisSize: propriedade utilizada para
      // configurar o tamanho do modal.
      mainAxisSize: MainAxisSize.min,

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DSBoxSpace.small(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DSConstSpace.small),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CloseButton(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Text(
                DisplayStrings.sortAndFilter,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              IconButton(
                onPressed: () => log('Implement info'),
                icon: Icon(
                  Icons.info_outlined,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.sort_rounded,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          visualDensity: VisualDensity.compact,
          title: const Text(DisplayStrings.sortingBy),
          subtitle: Text(const SortingOrder.byIDLowHigh().display ?? ''),
          onTap: () => setState(() => widget.controller.toggleSort()),
        ),

        // O widget `AnimatedCrossFade`foi adicionado para gerar uma animação
        // entre dois widgets filhos, sendo eles, controlados a partir de uma
        // operação ternária.
        Observer(
          builder: (context) => AnimatedCrossFade(
            firstChild: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSConstSpace.medium,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DSBoxSpace(),
                  Text(
                    DisplayStrings.advancedFilterInfo.addInfoChar(),
                  ),
                  const DSBoxSpace(),
                  Observer(
                    builder: (context) {
                      return LinearProgressIndicator(
                        value: widget.controller.allPokemons.length /
                            DomainConstants.maxFetchCount,
                      );
                    },
                  ),
                ],
              ),
            ),
            secondChild: const SizedBox.shrink(),
            crossFadeState: widget.controller.detailsStatus.isSuccess
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(
              milliseconds: 300,
            ),
          ),
        ),
        Observer(
          builder: (context) => ExpansionTile(
            controller: expansionController,
            title: const Text(DisplayStrings.advancedFilters),

            // maybeMap é utilizada para poder condicionar o que será
            // representado em tela com base no seu estado, sendo: sucesso,
            // erro e caso nenhum desses estados seja o mais adequado, optará
            // pelo se não.
            children: detailsState.maybeMap(
              orElse: () => [],
              success: (_) => [
                Row(
                  children: [
                    const DSBoxSpace(),
                    Text(
                      DisplayStrings.types,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(),
                    TextButton.icon(
                      label: Text(
                        widget.controller.isTypesEmpty
                            ? DisplayStrings.selectAll
                            : DisplayStrings.clear,
                      ),
                      onPressed: () => setState(
                        () => widget.controller.toggleAllTypes(),
                      ),
                      icon: Icon(
                        widget.controller.isTypesEmpty
                            ? Icons.check_rounded
                            : Icons.clear_rounded,
                      ),
                    ),
                    const DSBoxSpace.small(),
                  ],
                ),

                // Padding adicionado para expandir o espaçamento envolto a
                // lista de chips de pokémons disponibilizadas dentro do modal.
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    DSConstSpace.small,
                    0,
                    DSConstSpace.small,
                    DSConstSpace.medium,
                  ),

                  // Wrap é utilizado para organizar a quantidade de itens
                  // gerados na tela em relação ao espaço disponibilizado,
                  // evitando o overflow.
                  child: Wrap(
                    spacing: DSConstSpace.small,
                    runSpacing: DSConstSpace.small,
                    children: List.generate(
                      PokemonType.values.length,
                      (index) => PokemonTypeSelectionChip(
                        type: PokemonType.values[index],
                        isSelected: widget.controller
                            .selectedTypes[PokemonType.values[index]]!,
                        onTap: () => setState(
                          () => widget.controller.toggleType(
                            PokemonType.values[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // SizedBox adicionado para colocar um espaçamento na parte final
        // do modal.
        SizedBox(
          height: MediaQuery.of(context).padding.bottom > DSConstSpace.xxLarge
              ? MediaQuery.of(context).padding.bottom
              : DSConstSpace.xxLarge,
        ),
      ],
    );
  }
}
