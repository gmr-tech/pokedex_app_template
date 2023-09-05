// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokelist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokeListController on _PokeListController, Store {
  late final _$allPokemonsIdentifiersAtom = Atom(
      name: '_PokeListController.allPokemonsIdentifiers', context: context);

  @override
  ObservableList<PokemonIdentifier> get allPokemonsIdentifiers {
    _$allPokemonsIdentifiersAtom.reportRead();
    return super.allPokemonsIdentifiers;
  }

  @override
  set allPokemonsIdentifiers(ObservableList<PokemonIdentifier> value) {
    _$allPokemonsIdentifiersAtom
        .reportWrite(value, super.allPokemonsIdentifiers, () {
      super.allPokemonsIdentifiers = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_PokeListController.status', context: context);

  @override
  XState<dynamic> get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(XState<dynamic> value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$allPokemonsAtom =
      Atom(name: '_PokeListController.allPokemons', context: context);

  @override
  ObservableList<Pokemon> get allPokemons {
    _$allPokemonsAtom.reportRead();
    return super.allPokemons;
  }

  @override
  set allPokemons(ObservableList<Pokemon> value) {
    _$allPokemonsAtom.reportWrite(value, super.allPokemons, () {
      super.allPokemons = value;
    });
  }

  late final _$detailsStatusAtom =
      Atom(name: '_PokeListController.detailsStatus', context: context);

  @override
  XState<dynamic> get detailsStatus {
    _$detailsStatusAtom.reportRead();
    return super.detailsStatus;
  }

  @override
  set detailsStatus(XState<dynamic> value) {
    _$detailsStatusAtom.reportWrite(value, super.detailsStatus, () {
      super.detailsStatus = value;
    });
  }

  late final _$displayCountAtom =
      Atom(name: '_PokeListController.displayCount', context: context);

  @override
  int get displayCount {
    _$displayCountAtom.reportRead();
    return super.displayCount;
  }

  @override
  set displayCount(int value) {
    _$displayCountAtom.reportWrite(value, super.displayCount, () {
      super.displayCount = value;
    });
  }

  late final _$showCountAtom =
      Atom(name: '_PokeListController.showCount', context: context);

  @override
  bool get showCount {
    _$showCountAtom.reportRead();
    return super.showCount;
  }

  @override
  set showCount(bool value) {
    _$showCountAtom.reportWrite(value, super.showCount, () {
      super.showCount = value;
    });
  }

  late final _$isSearchingAtom =
      Atom(name: '_PokeListController.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$searchTermAtom =
      Atom(name: '_PokeListController.searchTerm', context: context);

  @override
  String get searchTerm {
    _$searchTermAtom.reportRead();
    return super.searchTerm;
  }

  @override
  set searchTerm(String value) {
    _$searchTermAtom.reportWrite(value, super.searchTerm, () {
      super.searchTerm = value;
    });
  }

  late final _$sortingOrderAtom =
      Atom(name: '_PokeListController.sortingOrder', context: context);

  @override
  SortingOrder get sortingOrder {
    _$sortingOrderAtom.reportRead();
    return super.sortingOrder;
  }

  @override
  set sortingOrder(SortingOrder value) {
    _$sortingOrderAtom.reportWrite(value, super.sortingOrder, () {
      super.sortingOrder = value;
    });
  }

  late final _$selectedTypesAtom =
      Atom(name: '_PokeListController.selectedTypes', context: context);

  @override
  ObservableMap<PokemonType, bool> get selectedTypes {
    _$selectedTypesAtom.reportRead();
    return super.selectedTypes;
  }

  @override
  set selectedTypes(ObservableMap<PokemonType, bool> value) {
    _$selectedTypesAtom.reportWrite(value, super.selectedTypes, () {
      super.selectedTypes = value;
    });
  }

  late final _$isTypesEmptyAtom =
      Atom(name: '_PokeListController.isTypesEmpty', context: context);

  @override
  bool get isTypesEmpty {
    _$isTypesEmptyAtom.reportRead();
    return super.isTypesEmpty;
  }

  @override
  set isTypesEmpty(bool value) {
    _$isTypesEmptyAtom.reportWrite(value, super.isTypesEmpty, () {
      super.isTypesEmpty = value;
    });
  }

  late final _$fetchAllPokemonsIdentifiersAsyncAction = AsyncAction(
      '_PokeListController.fetchAllPokemonsIdentifiers',
      context: context);

  @override
  Future<void> fetchAllPokemonsIdentifiers() {
    return _$fetchAllPokemonsIdentifiersAsyncAction
        .run(() => super.fetchAllPokemonsIdentifiers());
  }

  late final _$_fetchPokemonsDetailsAsyncAction = AsyncAction(
      '_PokeListController._fetchPokemonsDetails',
      context: context);

  @override
  Future<void> _fetchPokemonsDetails() {
    return _$_fetchPokemonsDetailsAsyncAction
        .run(() => super._fetchPokemonsDetails());
  }

  late final _$_PokeListControllerActionController =
      ActionController(name: '_PokeListController', context: context);

  @override
  void updateDisplay() {
    final _$actionInfo = _$_PokeListControllerActionController.startAction(
        name: '_PokeListController.updateDisplay');
    try {
      return super.updateDisplay();
    } finally {
      _$_PokeListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchPokemon(String userInput) {
    final _$actionInfo = _$_PokeListControllerActionController.startAction(
        name: '_PokeListController.searchPokemon');
    try {
      return super.searchPokemon(userInput);
    } finally {
      _$_PokeListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearch() {
    final _$actionInfo = _$_PokeListControllerActionController.startAction(
        name: '_PokeListController.clearSearch');
    try {
      return super.clearSearch();
    } finally {
      _$_PokeListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSort() {
    final _$actionInfo = _$_PokeListControllerActionController.startAction(
        name: '_PokeListController.toggleSort');
    try {
      return super.toggleSort();
    } finally {
      _$_PokeListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleType(PokemonType type) {
    final _$actionInfo = _$_PokeListControllerActionController.startAction(
        name: '_PokeListController.toggleType');
    try {
      return super.toggleType(type);
    } finally {
      _$_PokeListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFiltersAndShowAll() {
    final _$actionInfo = _$_PokeListControllerActionController.startAction(
        name: '_PokeListController.clearFiltersAndShowAll');
    try {
      return super.clearFiltersAndShowAll();
    } finally {
      _$_PokeListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleAllTypes() {
    final _$actionInfo = _$_PokeListControllerActionController.startAction(
        name: '_PokeListController.toggleAllTypes');
    try {
      return super.toggleAllTypes();
    } finally {
      _$_PokeListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allPokemonsIdentifiers: ${allPokemonsIdentifiers},
status: ${status},
allPokemons: ${allPokemons},
detailsStatus: ${detailsStatus},
displayCount: ${displayCount},
showCount: ${showCount},
isSearching: ${isSearching},
searchTerm: ${searchTerm},
sortingOrder: ${sortingOrder},
selectedTypes: ${selectedTypes},
isTypesEmpty: ${isTypesEmpty}
    ''';
  }
}
