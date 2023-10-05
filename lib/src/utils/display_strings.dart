// ignore_for_file: public_member_api_docs

/// A classe `DisplayStrings` tem como objetivo armazenar textos que poderão
/// ser exibidos em telas. De forma a facitilitar o acesso e restringindo erros
/// de digitação.
/// Classe criada para armazenar Strings como **consts** para serem imutáveis
/// e também **static** para que possam ser acessado em outras partes do código
/// de forma independente, sem que precise ser criado instâncias da própria
/// classe.
class DisplayStrings {
  static const String appName = 'Pokédex';

  static const String theme = 'Theme';
  static const String dark = 'Dark';
  static const String light = 'Light';

  static const String sortAndFilter = 'Sort and Filter';
  static const String sortingBy = 'Sorting by:';

  static const String sortAZ = 'Name (A-Z)';
  static const String sortZA = 'Name (Z-A)';
  static const String sortIDLowHigh = 'ID (Lowest to Highest)';
  static const String sortIDHighLow = 'ID (Highest to Lowest)';

  static const String searchHint = 'Type a pokemon name or number';

  static const String loadingPokemons = 'Loading pokemons...';
  static const String errorLoadingPokemons = 'Error loading pokemons...';

  static const String loadingPokemon = 'Loading pokemon...';
  static const String errorLoadingPokemon = 'Error loading pokemon...';

  static const String refresh = 'Refresh';

  static const String about = 'About';
  static const String weigth = 'Weigth';
  static const String height = 'Height';
  static const String moves = 'Main moves';
  static const String baseStats = 'Base Stats';

  static const String addToFavorites = 'Add to favorites';

  static const String emptyPokemonsMessage =
      'No pokemons found with givens filters or search term';

  static const String clear = 'Clear';

  static const String clearAllFilters = 'Clear filters and show all';

  static const String advancedFilters = 'Advanced Filters';
  static const String types = 'Types';

  static const String selectAll = 'Select All';

  static const String advancedFilterInfo = 'Advanced filters are enable after '
      'fetching all pokemons. Check the progress bar below.';

  static const String pageNotFound = 'Page not found';

  static const String goHome = 'Go to home';
}
