// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pokedex_app_template/src/features/pokelist/application/pokelist_controller.dart';

// import '../infrastructure/mock_pokelist_repository.dart';

void main() {
  final controller = Get.put<PokeListController>(
    PokeListController(),
  );

// [group] é criada para organizar os testes que possuem o mesmo contexto ou
// propósito.
  group(
    // Descrição do conjunto
    'Pokelist controller:',
    () {
      const int pokedexInitialLength = 20;

      // Este teste verifica se o controlador está funcionando
      // conforme o esperado após a inicialização.
      test(
        'Should do initial fetch on controller initialization',
        () {
          // Essa primeira asserção verifica se o número de identificadores
          // de pokémon no controlador é igual a pokedexInitialLength.
          expect(
            controller.allPokemonsIdentifiers.length,
            pokedexInitialLength,
          );
          // Essa segunda asserção verifica se o último identificador de
          // pokémon na lista de identificadores não é nulo.
          expect(
            controller.allPokemonsIdentifiers[
                controller.allPokemonsIdentifiers.length - 1],
            isNotNull,
          );
        },
      );
    },
  );
}
