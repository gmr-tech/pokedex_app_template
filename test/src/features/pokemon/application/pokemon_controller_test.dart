import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pokedex_app_template/src/common/presentation/common_present_const.dart';
import 'package:pokedex_app_template/src/features/pokemon/application/pokemon_controller.dart';

import '../infrastructure/mock_pokemon_repository.dart';

void main() {
  final controller = Get.put<PokemonController>(
    PokemonController(MockPokemonRepository(), 1),
  );

// [group] é criada para organizar os testes que possuem o mesmo contexto ou
// propósito.
  group(
    // Descrição do conjunto
    'Pokemon controller:',
    () {
      // Este teste verifica se o repositório foi inicado e se realiza a
      // busca do pokemon depois do anti-flashing.
      test(
        'Should init repository and fetch pokemon after anti-flashing time',
        () async {
          // Essa primeira asserção verifica se o controller é nulo.
          expect(controller.pokemon, isNull);

          // O controlador possui um tempo de anti-flashing.
          // É necessário esperar.
          // ignore: avoid-ignoring-return-values
          await Future.delayed(
            const Duration(
              milliseconds: CommonPresentConst.antiFlashingTime,
            ),
          );
          // Essa asserção verifica se o nome do pokémon retornado
          // do repositório, não é nulo.
          expect(controller.pokemon?.name, isNotNull);
          // Essa segunda asserção verifica se a imagem do pokemon retornado,
          // não é nulo.
          expect(controller.pokemon?.imageUrl, isNotNull);
          // Essa terceira asserção verifica se a lista de tipos referentes
          // ao pokémon retornado, não é nulo.
          expect(controller.pokemon?.types, isNotNull);
        },
      );
    },
  );
}
