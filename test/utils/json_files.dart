// ignore_for_file: avoid-top-level-members-in-tests

enum JsonFiles {
  // Valor enum que representa o arquivo JSON usado para simular os resultados
  // retornados pelo repositório de listagem de Pokémon.
  pokemonList('test/api_return_examples/pokemon_list_repository_result.json'),

  // Valor enum que representa o arquivo JSON usado para simular os resultados
  // retornados pelo repositório no arquivo pokemon_repository_result.json'.
  pokemon('test/api_return_examples/pokemon_repository_result.json');

  /// Contrutor padrãocriado para quando for criado uma instância do enum
  /// [JsonFiles] ele possa que receber caminho armazenado na enumeraçào.
  const JsonFiles(this.path);

  final String path;
}
