// ignore_for_file: public_member_api_docs
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/features/pokelist/presentation/pokelist_page.dart';

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
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DSThemeController>(
      create: (_) => DSThemeController(initialMode: DSThemeMode.light),

      /// Consumer é usado para reconstruir as informações
      /// dos widgets e objetos sobre as mudanças que ocorreram
      /// no provedor.
      child: Consumer<DSThemeController>(
        builder: (
          context,
          DSThemeController themeController,
          child,
        ) =>
            MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeController.themeMode,
          theme: DSTheme.lightThemeData,
          darkTheme: DSTheme.darkThemeData,
          home: const PokeListPage(),
        ),
      ),
    );
  }
}
