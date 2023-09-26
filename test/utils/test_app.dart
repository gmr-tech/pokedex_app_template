// This class will only be used in the tests layer.
// ignore_for_file: avoid-top-level-members-in-tests
import 'package:alchemist/alchemist.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  // TestApp.light: construtor utilizado para criar uma instância do
  // aplicativo de teste com o tema claro (light).
  const TestApp.light({
    required this.child,
    super.key,
  }) : themeMode = ThemeMode.light;

// TestApp.dark: construtor utilizado para criar uma instância do
// aplicativo de teste com o tema escuro (dark).
  const TestApp.dark({
    required this.child,
    super.key,
  }) : themeMode = ThemeMode.dark;

  final Widget child;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex app',
      darkTheme: DSTheme.darkThemeData,
      theme: DSTheme.lightThemeData,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      builder: (context, router) => DefaultAssetBundle(
        bundle: TestAssetBundle(),
        child: Scaffold(body: child),
      ),
    );
  }
}
