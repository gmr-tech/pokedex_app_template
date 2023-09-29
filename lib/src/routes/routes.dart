import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/presentation/page_not_found.dart';
import '../features/pokelist/presentation/pokelist_page.dart';
// import '../features/pokemon/presentation/pokemon_page.dart';
import '../features/pokemon/presentation/pokemon_page.dart';
import 'app_routes.dart';

/// Mixin criado para definir os objetos do tipo [GoRoute] da aplicação.
///
/// Cada objeto é criado para que possa ser configurado as rotas para utilização
/// do [GoRouter]
mixin Routes {
  /// [routes] é um métoddo que retorna uma instância do GoRouter com a
  /// definição dos caminhas de navegação para cada página da aplicação
  ///
  /// O parâmetro [rootNavigatorKey] é obrigatório e represente a chave do
  /// navegador raiz.
  static GoRouter routes(
    GlobalKey<NavigatorState> rootNavigatorKey,
  ) =>
      GoRouter(
        // Propriedade [errorBuilder] utilizada para definir a página que será
        // exibidade no caso de erro.
        errorBuilder: (context, state) => const PageNotFound(),
        navigatorKey: rootNavigatorKey,
        // Propriedade [initialLacoation]utilizado para definir o caminho raiz
        // da aplicação.
        initialLocation: AppRoutes.pokeListPath,
        routes: <RouteBase>[
          GoRoute(
            name: AppRoutes.pokeList,
            path: AppRoutes.pokeListPath,
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (
              BuildContext context,
              GoRouterState state,
            ) {
              return const MaterialPage<Widget>(
                child: PokeListPage(),
              );
            },
          ),
          GoRoute(
            name: AppRoutes.pokemon,
            path: AppRoutes.pokemonPath,
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (
              BuildContext context,
              GoRouterState state,
            ) {
              final int? id = int.tryParse(
                state.pathParameters[AppRoutes.pokemonId] ?? '',
              );

              if (id == null) {
                return const MaterialPage<Widget>(
                  child: PageNotFound(),
                );
              } else {
                return MaterialPage<Widget>(
                  child: PokemonPage(
                    key: state.pageKey,
                    id: id,
                  ),
                );
              }
            },
          ),
        ],
      );
}
