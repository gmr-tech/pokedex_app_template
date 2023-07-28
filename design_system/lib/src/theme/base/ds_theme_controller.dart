// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'ds_theme.dart';

/// Essa classe chamada [DSThemeController] é um controlador de tema que 
/// gerencia a mudança do tema do aplicativo. O objetivo dessa classe 
/// é permitir que o aplicativo altere entre os modos de tema claro (light)
/// e escuro (dark) e atualize os dados de tema do Flutter.
/// 
class DSThemeController extends ChangeNotifier {
  DSThemeController({required DSThemeMode initialMode}) {
    dsThemeMode = initialMode;
  }
/// * `dsThemeMode`: Um getter para obter o modo de tema atual, 
/// representado pelo enum DSThemeMode que possui dois valores 
/// possíveis: light (claro) e dark (escuro).
  DSThemeMode get dsThemeMode => _dsThemeMode;

/// * `themeMode`: Um getter para obter o ThemeMode atual, que é um enum 
/// do Flutter que representa o modo de tema do Flutter. Pode ser 
/// ThemeMode.light (claro), ThemeMode.dark (escuro).
  ThemeMode get themeMode => _themeMode;

/// * `themeData`: Um getter para obter os dados de tema do Flutter 
/// correspondentes ao modo de tema atual.
  ThemeData get themeData => _themeData;

/// Essas são variáveis de instância da classe DSThemeController, e elas 
/// representam o estado atual do tema do aplicativo:
/// 
/// * `_dsThemeMode`: Um setter para definir o modo de tema. Ele atualiza
/// internamente o modo de tema, os dados de tema do Flutter e notifica
/// os ouvintes sobre a alteração.
  DSThemeMode _dsThemeMode = DSThemeMode.dark;

/// * `_themeMode`: Essa variável do tipo ThemeMode representa o modo de tema 
/// atual do app. A classe fornece esse enum para representar os modos de tema 
/// suportados: **ThemeMode.light** (modo claro) e **ThemeMode.dark**
/// (modo escuro).
/// Neste caso, ela também é inicializada com o valor ThemeMode.dark, o que 
/// significa que o tema do app será definido como escuro no início, seguindo o 
/// valor de _dsThemeMode.
  ThemeMode _themeMode = ThemeMode.dark;

/// * `_themeData`: Essa variável do tipo ThemeData representa dados 
/// do tema atual, como cores e tigrafia.
  ThemeData _themeData = DSTheme.darkThemeData;


/// `dsThemeMode`: Esse método atualiza o modo de tema. Quando ele é 
/// chamado, o controlador atualiza internamente o dsThemeMode, os dados de tema
/// do projeto _themeData, o modo de tema do projeto _themeMode e notifica os 
/// ouvintes sobre a mudança, utilizando o notifyListeners().
  set dsThemeMode(DSThemeMode newMode) {
    _dsThemeMode = newMode;
    _toggleThemeData(newMode);
    _toggleThemeMode(newMode);
    notifyListeners();
  }

/// #### Métodos que atualizam tanto o `themeMode` quanto o `themeData` 
/// #### da aplicação:
/// 
/// 1. `_toggleThemeMode(DSThemeMode newMode)`: Um método privado que atualiza
/// o _themeMode com base no DSThemeMode fornecido.
  void _toggleThemeMode(DSThemeMode newMode) {
    switch (newMode) {
      case DSThemeMode.light:
        _themeMode = ThemeMode.light;
        break;
      case DSThemeMode.dark:
        _themeMode = ThemeMode.dark;
        break;
    }
  }

/// 2. `_toggleThemeData(DSThemeMode newMode)`: Um método privado que atualiza
/// o _themeData com base no DSThemeMode fornecido.
  void _toggleThemeData(DSThemeMode newMode) {
    switch (newMode) {
      case DSThemeMode.light:
        _themeData = DSTheme.lightThemeData;
        break;
      case DSThemeMode.dark:
        _themeData = DSTheme.darkThemeData;
        break;
    }
  }
}

/// #### Enum criado como forma de declarar os tipos de temas da aplicação.
/// 
/// * `DSThemeMode`: representa os modos de tema disponíveis, ou seja, 
/// light (claro) e dark (escuro)
enum DSThemeMode {
  light,
  dark,
}
