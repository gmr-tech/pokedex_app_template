import 'package:flutter_test/flutter_test.dart';
import 'mock_pokelist_repository.dart';

void main() {
  final MockPokeListRepository mockPokeListRepository =
      MockPokeListRepository();

  // [group] é criada para organizar os testes que possuem o mesmo contexto ou
  // propósito.
  group(
    'PokeList repository:',
    () {
      // Deve retornar do lado direito uma lista de PokemonsIdentifiers.
      test(
        'Should return a List<PokemonIdentification> on the right side',
        () async {
          final result =
              await mockPokeListRepository.fetchAllPokemonsIdentifiers();

          // [expect] é uti para fazer asserções nos testes. Verifica se
          // uma condição é verdadeira e, se não for, falhará o teste.
          //
          // `expect(result.isRight(), isTrue)` - Verifica se o resultado
          // retornado pela função fetchAllPokemonsIdentifiers é do lado
          // direito, significa deu certo.
          expect(result.isRight(), isTrue);

          // Verifica se o resultado não está vazio. Se o resultado estiver
          // vazio, o teste irá falhar.
          expect(result.getOrElse(() => []), isNotEmpty);
        },
      );
    },
  );
}
