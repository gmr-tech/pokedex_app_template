import 'package:flutter/material.dart';
import 'src/common/presentation/pokedex_app.dart';
import 'src/config/injection.dart';

/// O ponto de entrada da aplicação.
void main() {
  configureInjection();
  runApp(const PokedexApp());
}
