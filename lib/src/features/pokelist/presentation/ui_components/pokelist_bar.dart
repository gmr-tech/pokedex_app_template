// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../common/presentation/common_present_const.dart';
import '../../../../utils/display_strings.dart';
import 'pokelist_sort_and_filter_button.dart';

/// `PokeListBar` foi criado para conseguir tornar a barra superior do app
/// reutilizável, além de tornar mais simples a manutenção do widget em apenas
/// um arquivo. O componente foi criada para ter acesso tanto as funções de
/// filtragem do app, quanto ao menu drawer do app.
class PokeListBar extends StatefulWidget {
  const PokeListBar({
    super.key,
  });

  @override
  State<PokeListBar> createState() => _PokeListBarState();
}

class _PokeListBarState extends State<PokeListBar> {
  /// focusNode foi criado para capturar o foco do teclado e também adicionar
  /// eventos refentes ao foco do teclado.
  final focusNode = FocusNode();

  /// Variável criada para capturar o conteúdo adicionado ao formulário.
  final searchController = TextEditingController();

  /// Variável criada para determinar se o modo de pesquisa está ativo ou não
  ///
  /// Valor acrescentado para inicializar.
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    /// Novo valor atribuído.
    isSearching = false;

    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: const IconThemeData(color: DSConstColor.white),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
        child: Column(
          children: [
            // SafeArea: widget de layout utilizado para combinar as
            // proporções do design do app, com as proporções da tela do
            // smartphone.
            SafeArea(
              bottom: false,
              child: Row(
                children: [
                  // Botão do menu drawer.
                  const DrawerButton(),

                  // Título da appBar.
                  Text(
                    DisplayStrings.appName,
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                  const Spacer(),

                  // Botão de tipo de ordenação.
                  const PokeListSortAndFilterButton(),

                  // Ícone de busca.
                  IconButton(
                    onPressed: () => log('Implement search'),
                    icon: Icon(
                      isSearching ? Icons.search_off : Icons.search,
                    ),
                  ),

                  // SizedBox já implementado na pasta widgets do package
                  // design_system. Utilizado para ampliar o espaçamento
                  // entre o ícone e a borda.
                  const DSBoxSpace.xSmall(),
                ],
              ),
            ),

            // AnimatedSize é um widget que serve para realizar uma
            // animação de tamanho no widget filho descrito. No caso, o
            // AnimatedSize foi adicionado para realizar a animaçåo de tamanho
            // da barra de pesquisa.
            AnimatedSize(
              duration: const Duration(
                milliseconds: CommonPresentConst.mediumAnimationDuration,
              ),
              child: isSearching
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(
                        DSConstSpace.medium,
                        0,
                        0,
                        DSConstSpace.medium,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: searchController,
                              decoration: const InputDecoration(
                                hintText: DisplayStrings.searchHint,
                              ),
                              onChanged: (term) => log('Search: $term'),

                              focusNode: focusNode,

                              // onFieldSubmitted é uma propriedade utilizada
                              // para submeter o campo de texto, e junto com
                              // o método focusNode.unfocus() tirar o foco
                              // do campo, quando submetido.
                              // Sendo assim, ele é utilizado para fazer com que
                              // o após ele ser submetido, o campo perca o foco
                              // e a pesquisa ganhe total destaque.
                              onFieldSubmitted: (_) => focusNode.unfocus(),
                              textInputAction: TextInputAction.done,
                            ),
                          ),

                          // AnimatedSize foi adicionado para realizar
                          // uma animação de tamanho em relação ao ícone
                          // de limpeza da barra de pesquisa.
                          AnimatedSize(
                            /// Atributo que serve para determinar a duração
                            /// da animação.
                            duration: const Duration(
                              milliseconds:
                                  CommonPresentConst.fastAnimationDuration,
                            ),
                            // HACK to improve UX with animatons
                            // ignore: avoid-nested-conditional-expressions
                            child: searchController.text.isNotEmpty
                                ? IconButton(
                                    onPressed: () => log('Clear search'),
                                    icon: const Icon(Icons.clear_rounded),
                                  )
                                : const DSBoxSpace(),
                          ),
                        ],
                      ),
                    )
                  // SixedBox utilizado para que caso a pesquisa não seja
                  // acionada, no caso, false, não apareça a barra de pesquisa.
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
