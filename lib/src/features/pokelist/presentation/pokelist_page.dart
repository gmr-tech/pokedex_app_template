// ignore_for_file: public_member_api_docs, prefer_const_constructors

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../common/domain/x_state.dart';
import '../../../config/injection.dart';
import '../application/pokelist_controller.dart';
import '../domain/i_pokelist_repository.dart';
import 'ui_components/pokelist_bar.dart';
import 'ui_components/pokelist_drawer.dart';
import 'ui_components/pokelist_page_empty.dart';
import 'ui_components/pokelist_page_error.dart';
import 'ui_components/pokelist_page_loading.dart';
import 'ui_components/pokelist_page_success.dart';
import 'ui_components/pokelist_results_count.dart';

/// Página criada para a representação da pokelist page, ou seja, todos os seus
/// elementos, juntos e posicionados.
class PokeListPage extends StatefulWidget {
  const PokeListPage({super.key});

  @override
  State<PokeListPage> createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {
  /// Instância do controller da pokelist criado para conseguir acessar e
  /// utilizar os métodos e variáveis criados no arquivo.
  /// Ele recebe como parâmetro o contrato do repositório para que não precise
  /// se preocupar com a criação de uma instância do repositório. Em vez disso,
  /// recebe uma instância singleton já criada do repositório quando
  /// é construída.
  final controller = PokeListController(getIt<IPokeListRepository>());

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: PokeListDrawer(),
      // resizeToAvoidBottomInset: propriedade que permite redimensionar
      // os elementos do scaffold em relacào a qualquer elemento que sobrepor o
      // conteudo da tela.
      resizeToAvoidBottomInset: false,

      // Propriedade adicionada para apresentar uma folha na parte inferior da
      // tela, para mostrar o resulltado da quantidade de pokémons.
      bottomSheet: Observer(
        builder: (_) => controller.showCount
            ? PokelistResultsCount(
                bottomPadding: bottomPadding,
                displayCount: controller.displayCount,
                clear: controller.clearFiltersAndShowAll,
              )
            : SizedBox.shrink(),
      ),
      body: Observer(
        builder: (context) => Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            0,
            0,
            controller.showCount ? bottomPadding : 0,
          ),
          child: Column(
            children: [
              PokeListBar(controller: controller),
              Expanded(
                // Instância da função gerada pelo freezed, que serve para
                // startar funções em diferentes estados possíveis da
                // tela, sendo: loading (carregamento), success (sucesso) e
                // orElse, que significa caso os outros estados não precisem
                // ser mostrados, o que será mostrado será esse estado, no
                // caso error.
                child: Observer(
                  builder: (_) => controller.status.maybeMap(
                    loading: (_) => const PokeListPageLoading(),
                    empty: (_) => PokeListPageEmpty(),
                    success: (_) => PokeListPageSuccess(
                      bottomPadding: controller.showCount
                          ? DSConstSize.materialTapTargetSize +
                              DSConstSpace.small +
                              DSConstSpace.medium
                          : 0,
                      pokemons: controller.detailsStatus.isSuccess
                          ? controller.allPokemons
                          : controller.allPokemonsIdentifiers,
                    ),
                    orElse: () => PokeListPageError(
                      onRefresh: controller.fetchAllPokemonsIdentifiers,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
