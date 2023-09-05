// ignore_for_file: public_member_api_docs

/// DomainConstants serve para armazenar valores constantes relacionados a api.
class DomainConstants {
  /// Variável criada para armazenar o endereço base da api.
  static const String baseApiAddress = 'https://pokeapi.co/api/v2/pokemon/';

  /// Varíavel criado para deteminar um número máximo de itens que podem
  /// ser buscados.
  static const int maxFetchCount = 1010;

  /// O número máximo de pokémons que podem ser buscados pela a API.
  static const int pokemonMaxCount = 1281;

  /// O valor máximo de uma estatística base para um Pokémon.
  ///
  /// Esta variável foi criada para especificar o valor mais alto possível
  /// para uma estatística base de um Pokémon, como HP, Ataque, Defesa, etc.
  static const int baseStateMax = 255;
}
