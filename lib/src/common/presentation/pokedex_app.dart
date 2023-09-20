// ignore_for_file: public_member_api_docs
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes/go_router_singleton.dart';
import '../../utils/display_strings.dart';
import 'common_present_const.dart';

/// Esse código mostra um exemplo de como usar
/// o pacote provider para fornecer o objeto notificador de mudanças,
/// ele também configura um MaterialApp com temas claro e escuro, controlados
/// pelo DSThemeController.
///
/// O [ChangeNotifierProvider] é a classe que utilizamos para gerenciar o
/// estado, sempre que ocorrem mudanças no objeto notificador de mudanças,
/// o ChangeNotifierProvider notifica os widgets dependentes
/// para que eles possam reconstruir suas partes relevantes.
///
/// A partir da utilização dessa classe temas propriedade `create` proveniente
/// da classe que tem como função criar instância do objeto
/// notificador de mudanças, e torna essa instância disponível
/// para todos os widgets despendentes que desejam acessá-la.
///
/// ```
/// ChangeNotifierProvider<DSThemeController>(
/// create: (_) => DSThemeController(initialMode: DSThemeMode.light),
/// ```
///
/// Logo abaixo temos o Consumer que é utilizado como uma forma de otimizar
/// o gerenciamente de estado direcionado para um objeto especifico, e seus
/// filhos.
///
class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  // Este widget é a raiz da aplicação.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DSThemeController>(
      create: (_) => DSThemeController(initialMode: DSThemeMode.dark),

      /// Consumer é usado para reconstruir as informações
      /// dos widgets e objetos sobre as mudanças que ocorreram
      /// no provedor.
      child: Consumer<DSThemeController>(
        builder: (
          context,
          DSThemeController themeController,
          child,
        ) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  DSConstColor.primary,
                  DSConstColor.primaryDarker,
                ],
              ),
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: CommonPresentConst.maxViewportWidth,
                ),
                child: Material(
                  // [MaterialApp.router] construtor nomeado do GoRouter
                  // adicionado para ter acesso a atributos especificos de
                  // configuração da utilização do GoRouter.
                  child: MaterialApp.router(
                    routerConfig: GoRouterSingleton().goRouter,
                    debugShowCheckedModeBanner: false,
                    title: DisplayStrings.appName,
                    themeMode: themeController.themeMode,
                    theme: DSTheme.lightThemeData,
                    darkTheme: DSTheme.darkThemeData,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
