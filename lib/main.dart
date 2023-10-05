import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'src/common/presentation/pokedex_app.dart';
import 'src/config/injection.dart';

/// O ponto de entrada da aplicação.
void main() {
  // Esta função configura a injeção de dependência para o aplicativo,
  // registrando dependências e configurações necessárias feitas no arquivo
  // `injection.dart` e `injection.config.dart`.
  configureInjection();
  setPathUrlStrategy();
  runApp(const PokedexApp());
}
