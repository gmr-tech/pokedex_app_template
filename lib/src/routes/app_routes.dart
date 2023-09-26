// ignore_for_file: public_member_api_docs

/// Classe criada para armazenar as rotas relacionadas ao aplicativo.
class AppRoutes {
  /// PATHS
  static const String pokeListPath = '/';

  static const String pokemonPath = '/pokemon/:$pokemonId';

  /// ROUTE NAMES
  static const String pokeList = 'pokeList';

  static const String pokemon = 'pokemon';

  /// ROUTE PARAMETER KEYS
  static const String pokemonId = 'pokemonId';
}
