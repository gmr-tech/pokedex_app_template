// ignore_for_file: sort_constructors_first

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';

/// A classe [GoRouterSingleton] foi desenvolvida para criar uma instância do
/// [GoRouter], e garantir que apenas essa instância seja acessada dentro da
/// aplicação.
class GoRouterSingleton {
  /// [goRouter] é uma instância criada para ser inicializada com
  /// as rotas do aplicativo.
  ///
  /// Pode ser acessada em qualquer parte do aplicativo, utilizando
  /// a instância singleton:
  ///  ```
  /// final GoRouter goRouter = GoRouterSingleton.instance.goRouter;
  /// ```
  final GoRouter goRouter;

  static final GoRouterSingleton _instance = GoRouterSingleton._internal();

  /// Construtor Factory que retorna a instância singleton da classe.
  factory GoRouterSingleton() => _instance;

  /// Construtor privado que é chamado internamente para inicializar a
  /// instância única da classe. Dentro deste construtor,
  /// o goRouter é inicializado com as rotas do aplicativo usando o método
  /// Routes.routes().
  GoRouterSingleton._internal()
      : goRouter = Routes.routes(
          GlobalKey<NavigatorState>(debugLabel: 'root'),
        );
}
