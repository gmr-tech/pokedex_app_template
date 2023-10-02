import 'package:flutter/material.dart';
import 'src/common/presentation/pokedex_app.dart';
import 'src/config/injection.dart';

/// O ponto de entrada da aplicação.
void main() {
  // Esta função configura a injeção de dependência para o aplicativo,
  // registrando dependências e configurações necessárias feitas no arquivo
  // `injection.dart` e `injection.config.dart`.
  configureInjection();
  runApp(const PokedexApp());
}
