import 'package:flutter_test/flutter_test.dart';
import 'mock_pokemon_repository.dart';

void main() {
  final MockPokemonRepository repository = MockPokemonRepository();

  // [group] é criada para organizar os testes que possuem o mesmo contexto ou
  // propósito.
  group(
    'Pokemon repository:',
    () {
      // Deve retornar um pokémon.
      test(
        'Should return a Pokemon',
        () async {
          final result = await repository.fetchPokemonDetails(1);

          // [expect] é util para fazer asserções nos testes. Verifica se
          // uma condição é verdadeira e, se não for, falhará o teste.
          //
          // `expect(result.isRight(), isTrue)` - Verifica se o resultado
          // retornado pela função fetchAllPokemonsDetails
          expect(result.isRight(), isTrue);
        },
      );
    },
  );
}
