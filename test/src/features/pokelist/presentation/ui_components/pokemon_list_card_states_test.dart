import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app_template/mock/pokemon_details.mock.dart';
import 'package:pokedex_app_template/mock/pokemon_identifier.mock.dart';
import 'package:pokedex_app_template/src/features/pokelist/presentation/ui_components/pokemon_list_card_error.dart';
import 'package:pokedex_app_template/src/features/pokelist/presentation/ui_components/pokemon_list_card_loading.dart';
import 'package:pokedex_app_template/src/features/pokelist/presentation/ui_components/pokemon_list_card_sucess.dart';

import '../../../../../utils/test_app.dart';
import '../../../../../utils/test_device.dart';
import 'grid_view_for_testing.dart';

void main() {
  // [setUpAll] é uma configuração que é executada uma vez antes de todos os
  // testes no arquivo. É usado aqui para garantir que o ambiente
  // de teste esteja inicializado antes de executar os testes.
  setUpAll(TestWidgetsFlutterBinding.ensureInitialized);

// [group] utilizado para agrupar todos os cenários de testes que possuem
// o mesmo contexto, na caso os status do card da pokelist.
  group(
    'Pokemon list card:',
    () {
      // [unawaited] foi adicionado para fazer com que o restante do código
      // continue sendo executado sem esperar a conclusão dos futures
      // representados nos tests.
      unawaited(
        // [goldenTest] é usado para verificar se a aparência visual da
        // inteface permanece consistente ao longo do tempo. Ele compara
        // a renderização atual da UI com uma imagem de referência (golden
        // image) predefinida e falhará se houver diferenças visuais.
        goldenTest(
          'Pokemon list card states',
          fileName: 'pokemon_list_card',
          builder: () => GoldenTestGroup(
            scenarioConstraints: BoxConstraints.tight(
              TestDevice.iphone14ProMax.size /
                  TestDevice.iphone14ProMax.devicePixelRatio,
            ),
            children: [
              GoldenTestScenario(
                name: 'Loading',
                child: TestApp.dark(
                  child: GridViewForTesting(
                    itemCount: kPokemonDetailsListMock.length,
                    itemBuilder: (context, index) => PokemonListCardLoading(
                      pokemonID: kPokemonIdentifierListMock[index],
                    ),
                  ),
                ),
              ),
              GoldenTestScenario(
                name: 'Success',
                child: TestApp.dark(
                  child: GridViewForTesting(
                    itemCount: kPokemonDetailsListMock.length,
                    itemBuilder: (context, index) => PokemonListCardSucess(
                      pokemon: kPokemonDetailsListMock[index],
                    ),
                  ),
                ),
              ),
              GoldenTestScenario(
                name: 'Error',
                child: TestApp.dark(
                  child: GridViewForTesting(
                    itemCount: kPokemonDetailsListMock.length,
                    itemBuilder: (context, index) => PokemonListCardError(
                      pokemonID: kPokemonIdentifierListMock[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
