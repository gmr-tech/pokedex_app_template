// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'ds_theme.dart';

class DSThemeController extends ChangeNotifier {
  DSThemeController({required DSThemeMode initialMode}) {
    dsThemeMode = initialMode;
  }
  ///dsThemeMode: Um getter para obter o modo de tema atual, representado por um enum DSThemeMode que possui dois valores possíveis: light (claro) e dark (escuro). 
  DSThemeMode get dsThemeMode => _dsThemeMode;
  ///themeMode: Um getter para obter o ThemeMode atual, que é um enum do Flutter que representa o modo de tema do Flutter. Pode ser ThemeMode.light (claro), ThemeMode.dark (escuro)  .
  ThemeMode get themeMode => _themeMode;
  ///themeData: Um getter para obter os dados de tema do Flutter correspondentes ao modo de tema atual. 
  ThemeData get themeData => _themeData;
  
  ///dsThemeMode: Um setter para definir o modo de tema. Ele atualiza internamente o modo de tema, os dados de tema do Flutter e notifica os ouvintes sobre a alteração. 
  DSThemeMode _dsThemeMode = DSThemeMode.dark;
  ThemeMode _themeMode = ThemeMode.dark;
  ThemeData _themeData = DSTheme.darkThemeData;

  /// Sets DSThemeMode and updates Flutter ThemeData and ThemeMode.
  set dsThemeMode(DSThemeMode newMode) {
    _dsThemeMode = newMode;
    _toggleThemeData(newMode);
    _toggleThemeMode(newMode);
    notifyListeners();
  }

  ///_toggleThemeMode(DSThemeMode newMode): Um método privado que atualiza o _themeMode com base no DSThemeMode fornecido. 
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

  ///_toggleThemeData(DSThemeMode newMode): Um método privado que atualiza o _themeData com base no DSThemeMode fornecido. 
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


enum DSThemeMode {
  light,
  dark,
}
