import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app_template/mock/pokemon_details.mock.dart';
import 'package:pokedex_app_template/src/features/pokemon/presentation/ui_components/pokemon_page_error.dart';
import 'package:pokedex_app_template/src/features/pokemon/presentation/ui_components/pokemon_page_loading.dart';
import 'package:pokedex_app_template/src/features/pokemon/presentation/ui_components/pokemon_page_success.dart';

import '../../../../../utils/test_app.dart';
import '../../../../../utils/test_device.dart';

void main() {
  // [setUpAll] é uma configuração que é executada uma vez antes de todos os
  // testes no arquivo. É usado aqui para garantir que o ambiente
  // de teste esteja inicializado antes de executar os testes.
  setUpAll(TestWidgetsFlutterBinding.ensureInitialized);
  setUpAll(loadFonts);

  group(
    'Pokemon list card:',
    () {
      // Permite que chame uma função assíncrona sem esperar pela
      // conclusão dela. É usado para chamar o goldenTest e continuar
      // a execução sem bloquear.
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
                child: const TestApp.dark(
                  child: PokemonPageLoading(),
                ),
              ),
              GoldenTestScenario(
                name: 'Success',
                child: TestApp.dark(
                  child: TestApp.dark(
                    child: PokemonPageSuccess(pokemon: kPokemonDetailsMock),
                  ),
                ),
              ),
              GoldenTestScenario(
                name: 'Error',
                child: const TestApp.dark(
                  child: PokemonPageError(),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
