// ignored because this function can be called from anywhere in the app
// ignore_for_file: prefer-static-class

import 'package:flutter/material.dart';

/// Esta função calcula o tamanho necessário para exibir uma string em uma
/// única linha, usando o estilo de texto especificado. Ela é útil para evitar
/// que o texto cause um overflow quando exibido em um espaço limitado, como
/// na página de visualização de cada Pokémon.
///
/// Retorna um objeto `Size` que representa o tamanho necessário para exibir o
/// texto em uma única linha com o estilo especificado.
Size getOneLineTextSize(String text, TextStyle style, BuildContext context) {
  return (TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textScaleFactor: MediaQuery.of(context).textScaleFactor,
    // Direção do texto definida da esquerda para direita.
    textDirection: TextDirection.ltr,
// Os dois pontos .. antes de chamar o método layout() são uma sintaxe de
// cascata em. Eles permitem para que possa encadiar várias chamadas
// de métodos em um objeto sem ter que repetir o nome desse objeto em cada
// chamada de método subsequente. É uma maneira concisa de realizar várias
// operações em um objeto sem precisar criar variáveis intermediárias.
  )..layout())
      // Tamanho do texto calculado como um objeto Size.
      .size;
}
