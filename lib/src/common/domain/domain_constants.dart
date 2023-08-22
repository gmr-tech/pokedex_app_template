// ignore_for_file: public_member_api_docs

/// DomainConstants serve para armazenar valores constantes relacionados a api.
class DomainConstants {
  /// Variável criada para armazenar o endereço base da api.
  static const String baseApiAddress = 'https://pokeapi.co/api/v2/pokemon/';

  /// Varíavel criado para deteminar um número máximo de itens que podem
  /// ser buscados.
  static const int maxFetchCount = 1010;

  /// The maximum number of pokemons that can be fetched from the API.
  static const int pokemonMaxCount = 1281;

  /// Varíavel criado para deteminar um número base a ser buscado de itens.
  static const int baseStateMax = 255;
}
