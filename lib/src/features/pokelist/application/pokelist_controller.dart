// ignore_for_file: public_member_api_docs, library_private_types_in_public_api,
// ignore_for_file: avoid_setters_without_getters, avoid-dynamic
// ignore_for_file: avoid-ignoring-return-values

import 'dart:async';
import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../mock/pokemon_details.mock.dart';
import '../../../../mock/pokemon_identifier.mock.dart';
import '../../../common/domain/entities/pokemon.dart';
import '../../../common/domain/entities/pokemon_identifier.dart';
import '../../../common/domain/entities/pokemon_type.dart';
import '../../../common/domain/sorting_order.dart';
import '../../../common/domain/x_state.dart';

part 'pokelist_controller.g.dart';

/// Classe que faz parte do modelo tradicional do MobX criada para receber
/// tanto a implementação da _PokelistController como também da classe
/// gerada _$PokelistController. Esta classe MobX, tem como padrão o
/// Observer, onde é necessário que tenha objetos observáveis dentro da
/// aplicação e também ações que serão disparadas e consequentemente geraram
/// reações, resultando na rebuild da tela.
class PokeListController = _PokeListController with _$PokeListController;

/// PokelistController foi criada para adicicionar os métodos e dados que serão
/// alterados durante a execução do app. Utiliza-se do mixin **Store**, para que
/// o MobX possa rastrear os estados observáveis e as ações.
abstract class _PokeListController with Store {
  _PokeListController() {
    // O método `unawaited` é utilizado para não esperar o resultado total
    // do método fetchAllPokemonsIdentifiers, sendo assim, continuando a
    // execução da aplicação.
    unawaited(fetchAllPokemonsIdentifiers());
  }

  /// Lista que receberá todos os identificadores de pokémons.
  final List<PokemonIdentifier> _allPokemonsIdentifiers = [];

  /// Lista que receberá todos os pokémons.
  final List<Pokemon> _allPokemons = [];

  /// @observable é um tipo de elemento que será atualizado a partir de uma
  /// action startada no código.
  ///
  /// allPokemonsIdentifiers foi criada como uma observable list para que ela
  /// possa ser modificada decorrente a mudança que ocorrer nela.
  @observable
  ObservableList<PokemonIdentifier> allPokemonsIdentifiers =
      ObservableList<PokemonIdentifier>();

  /// Variável observável que é utilizada para determinar o estado geral
  /// no momento de utilização dos métodos.
  @observable
  XState status = const XState.initial();

  /// List observável que é utilizada para armazaner o conteúdo da lista privada
  /// _allPokemons que é abastecida de forma privada, devido isso, não possuem
  /// o estado observável pelo MobX.
  @observable
  ObservableList<Pokemon> allPokemons = ObservableList<Pokemon>();

  /// Variável observável que é utilizada para determinar o estado operação de
  /// busca e tamém de exbição dos detalhes dos pokémos no momento de
  /// utilização dos métodos.
  @observable
  XState detailsStatus = const XState.initial();

  /// Variável que será exibida, revelando a contagem de pokémons.
  @observable
  int displayCount = 0;

  /// Variável booleana que controla a exibição da contagem de pokémons.
  @observable
  bool showCount = false;

  /// Variável booleana que controla a exibição da pesquisa.
  @observable
  bool isSearching = false;

  /// Variável criada para capturar o estado desta string, que tem como
  /// objetivo receber o termo de busca.
  @observable
  String searchTerm = '';

  /// Instância da classe `SortingOrder` que define o tipo de ordenação da
  /// página. Inicialmente recebe como valor inicial a ordenação por id, do
  /// do maior para o menor.
  @observable
  SortingOrder sortingOrder = const SortingOrder.byIDLowHigh();

  /// `selectedTypes` é um **ObservableMap**, ou seja um map que tem o seu
  /// estado observável. Neste caso o **ObservableMap** é utilizado para
  /// conseguir identificar qual tipo de pokemon está selecionado dentro do
  /// filtro, por meio do valor booleano dado pelo Map. Como por exemplo:
  /// caso o pokémon do tipo `bug`, tenho como seu valor `true`, isso
  /// significa que este tipo está selecionado, caso contrário será `false`.
  /// Porém, inicalmento todos vem selecionados como `true`.
  @observable
  ObservableMap<PokemonType, bool> selectedTypes =
      ObservableMap<PokemonType, bool>.of(
    Map.fromEntries(
      PokemonType.values.map(
        (type) => MapEntry(type, true),
      ),
    ),
  );

  /// Váriavel observável criada para monitorar se os tipos de pokémons
  /// selecionados é vaziu.
  @observable
  bool isTypesEmpty = false;

  /// Método criado para pegar todos os identificadores de pokémon.
  @action
  Future<void> fetchAllPokemonsIdentifiers() async {
    /// Estado inicial do método, no caso o de carregamento quando
    /// ele for chamado.
    status = const XState.loading();

    await Future.delayed(const Duration(seconds: 1));

    _allPokemonsIdentifiers.addAll(kPokemonIdentifierListMock);
    allPokemonsIdentifiers.addAll(kPokemonIdentifierListMock);
    await _fetchPokemonsDetails();

    /// Estado final do método, no caso o de sucesso.
    status = const XState.success();
  }

  /// Método criado para buscar e armazenar todos os pokémons dentro da
  /// lista de todos os pokémons (allPokemons).
  @action
  Future<void> _fetchPokemonsDetails() async {
    // Estado inicial da busca dos detalhes dos pokémons.
    detailsStatus = const XState.loading();

    // Delay adicionado para esperar 1 segundo antes de realizar o looping.
    await Future.delayed(const Duration(seconds: 1));

    // loop criado para adicionar cada pokémon da lista
    // kPokemonDetailsListMock dentro da lista _allPokemons e allPokemons.
    for (int i = 0; i < allPokemonsIdentifiers.length; i++) {
      final pokemon = kPokemonDetailsListMock[i];

      log(pokemon.name);
      _allPokemons.add(pokemon);
      allPokemons.add(pokemon);
    }

    // Estado final da busca dos detalhes dos pokémons.
    detailsStatus = const XState.success();
  }

  /// Método criado para atualizar a exibição da pokelist.
  @action
  void updateDisplay() {
    // Verifica se há tipos de pokémons selecionados, que serve para determinar
    // se todos os tipos de  pokémons estão desmarcados.
    isTypesEmpty = selectedTypes.values.every((element) => !element);

    // Limpa a lista observável que armazena os identificadores dos pokémons.
    allPokemonsIdentifiers.clear();

    // Limpa a lista observável que armazena os pokémons.
    allPokemons.clear();

    // A lista observável dos allPokemonsIdentifiers recebe o valor dos
    // identificadores dos pokémons.
    allPokemonsIdentifiers = _allPokemonsIdentifiers.asObservable();

    // A lista observável dos allPokemons recebe o valor dos pokémons.
    allPokemons = _allPokemons.asObservable();

    // Filtro por nome e id, se o termo de busca não estiver vazio, ou seja,
    // preenchido.
    if (searchTerm.isNotEmpty) {
      allPokemonsIdentifiers = ObservableList.of(
        allPokemonsIdentifiers.where(
          (element) =>
              element.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
              element.id == int.tryParse(searchTerm),
        ),
      );
      allPokemons = ObservableList.of(
        allPokemons.where(
          (element) =>
              element.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
              element.id == int.tryParse(searchTerm),
        ),
      );
    }

    // Filtro por tipo de pokémon selecionado.
    allPokemons = ObservableList.of(
      allPokemons.where(
        (element) => element.types.any(
          (type) => selectedTypes[type]!,
        ),
      ),
    );

    // Ordenar a lista de acordo com a configuração de ordenação
    // atual selecionada.
    sortingOrder.map(
      byNameAZ: (_) {
        allPokemonsIdentifiers.sort((a, b) => a.name.compareTo(b.name));
        allPokemons.sort((a, b) => a.name.compareTo(b.name));
      },
      byNameZA: (_) {
        allPokemonsIdentifiers.sort((a, b) => b.name.compareTo(a.name));
        allPokemons.sort((a, b) => b.name.compareTo(a.name));
      },
      byIDLowHigh: (_) {
        allPokemonsIdentifiers.sort((a, b) => a.id.compareTo(b.id));
        allPokemons.sort((a, b) => a.id.compareTo(b.id));
      },
      byIDHighLow: (_) {
        allPokemonsIdentifiers.sort((a, b) => b.id.compareTo(a.id));
        allPokemons.sort((a, b) => b.id.compareTo(a.id));
      },
    );

    // Atualizar o estado de acordo com a lista filtrada e ordenada.
    if (allPokemons.isEmpty || allPokemonsIdentifiers.isEmpty) {
      status = const XState.empty();
    } else {
      status = const XState.success();
    }

    // Atualizar a contagem de exibição de pokémons.
    displayCount = allPokemons.length;

    // Determinar se a contagem deve ser exibida ou não com base nas mudanças.
    if (allPokemons.length != _allPokemons.length ||
        allPokemonsIdentifiers.length != _allPokemonsIdentifiers.length ||
        isTypesEmpty) {
      showCount = true;
    } else {
      showCount = false;
    }
  }

  /// Método para realizar a busca de pokémons por meio da search bar.
  @action
  void searchPokemon(String userInput) {
    // Status inicial da busca para mostrar o carregamento.
    status = const XState.loading();

    // A varíavel observável recebe o termo da pesquisa.
    searchTerm = userInput;

    // Atualização da tela da pokelist de acordo com o termo digitado.
    updateDisplay();
  }

  /// Método para limpar a busca de pokémons.
  @action
  void clearSearch() {
    // Status inicial do método.
    status = const XState.loading();

    // Limpeza da string referente a barra de busca.
    searchTerm = '';

    // Atualização da tela da pokelist.
    updateDisplay();
  }

  /// Método criado para a ordenação da lista de pokémons.
  @action
  void toggleSort() {
    // Estado inicial do método para mostrar o carregamento.
    status = const XState.loading();

    // Intancia da classe map do arquivo `sorting_order.freezed.dart`,
    // que recebe um objeto do tipo SortingOrder para representar o
    // o tipo de ordenação.
    sortingOrder.map(
      byNameAZ: (_) {
        sortingOrder = const SortingOrder.byNameZA();
      },
      byNameZA: (_) {
        sortingOrder = const SortingOrder.byIDLowHigh();
      },
      byIDLowHigh: (_) {
        sortingOrder = const SortingOrder.byIDHighLow();
      },
      byIDHighLow: (_) {
        sortingOrder = const SortingOrder.byNameAZ();
      },
    );

    // O método `updateDisplay`é chamado para receber o novo tipo de ordenação
    // selecionada e atualizar a tela.
    updateDisplay();
  }

  /// Método criado para alternar o tipo de pokémon por meio do
  /// **ObservableMap**, onde.
  @action
  void toggleType(PokemonType type) {
    // Determina o status atual do método, no caso, o estado de carregamento,
    // demonstrando que está em andamento.
    status = const XState.loading();

    // Operação realizada para inverter o valor do tipo de pokémon selecionado,
    // caso ele seja `true`, ele passará a ser `false` e vice-versa.
    selectedTypes[type] = !selectedTypes[type]!;

    // Adicionado para atualizar a interface.
    updateDisplay();
  }

  /// Método criado para limpar o filtro e todas as configurações de busca,
  /// mostrando todos os pokémons sem filtragem.
  @action
  void clearFiltersAndShowAll() {
    // Determina o status atual do método, no caso o estado de carregamento,
    // demonstrando que está em andamento.
    status = const XState.loading();

    // Limpar o campo de filtragem.
    searchTerm = '';

    // Desativa a busca.
    isSearching = false;

    // Não mostrar a contagem de pokémons.
    showCount = false;

    // Restaura o número de exibição para a quantidade total de pokémons.
    displayCount = allPokemons.length;

    // Mostrar todos os tipos de pokémons juntos.
    selectedTypes = ObservableMap.of(
      // Mapeia todos os tipos de pokémon para true (selecionado).
      Map.fromEntries(
        PokemonType.values.map(
          (type) => MapEntry(type, true),
        ),
      ),
    );
    // Atualizar a exibiçào com base nas opções de filtro
    // configuradas no método.
    updateDisplay();
  }

  /// Método criado para controlar a alternância entre marcar todos os tipos
  /// de pokémons e desmarcar todos.
  @action
  void toggleAllTypes() {
    status = const XState.loading();
    if (isTypesEmpty) {
      // Marcar todos os tipos de pokémons.
      selectedTypes = ObservableMap.of(
        Map.fromEntries(
          PokemonType.values.map(
            (type) => MapEntry(type, true),
          ),
        ),
      );
    } else {
      // Desmarcar todos os tipos de pokémons.
      selectedTypes = ObservableMap.of(
        Map.fromEntries(
          PokemonType.values.map(
            (type) => MapEntry(type, false),
          ),
        ),
      );
    }
    // Atualizar a exibiçào com base na exibição de tipos atualizadas.
    updateDisplay();
  }
}
