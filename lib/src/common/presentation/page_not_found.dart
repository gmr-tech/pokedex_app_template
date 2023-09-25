// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';
import '../../utils/display_strings.dart';

/// Uma página de erro que é exibida quando uma rota não é encontrada durante
/// a navegação.
///
/// A classe `PageNotFound` é criada para ser usada como uma página de
/// erro, quando não for possível concluir a construção da página destacada
/// na navegação. Ela fornece uma mensagem de erro e um
/// botão para redirecionar os usuários de volta à página que é a lista de
/// Pokémons.
class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Mensagem de que indica a página não encontrada.
            const Text(DisplayStrings.pageNotFound),
            // SizedBox que aplica um espaçamento vertical
            // entre o texto e o botão.
            const DSBoxSpace.large(),
            // Botão que realiza a nevegação para lista de pokemons.
            ElevatedButton(
              onPressed: () => context.pushReplacementNamed(AppRoutes.pokeList),
              child: const Text(DisplayStrings.goHome),
            ),
          ],
        ),
      ),
    );
  }
}
