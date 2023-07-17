// ignore_for_file: public_member_api_docs
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  ///Esse código mostra um exemplo de como usar
  ///o pacote provider para fornecer o objeto notificador de mudanças
  ///Ele também configura um MaterialApp com temas claro e escuro, controlados
  ///pelo DSThemeController.
  @override
  Widget build(BuildContext context) {
    ///Sempre que ocorrem mudanças no objeto notificador de mudanças,
    ///o ChangeNotifierProvider notifica os widgets dependentes
    ///para que eles possam reconstruir suas partes relevantes.
    return ChangeNotifierProvider<DSThemeController>(
      ///A função create tem como função criar instância do objeto
      ///notificador de mudanças, e torna essa instância disponível
      ///para todos os widgets descentes que desejam acessá-la.
      create: (_) => DSThemeController(initialMode: DSThemeMode.light),

      ///Consumer é usado para reconstruir as informações
      ///dos widgets e objetos sobre as mudanças que ocorreram
      ///no provedor.
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
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
