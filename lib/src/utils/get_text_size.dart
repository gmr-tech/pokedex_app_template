// ignored because this function can be called from anywhere in the app
// ignore_for_file: prefer-static-class

import 'package:flutter/material.dart';

/// Este arquivo foi criado para desenvolver um método que possa limitar
/// o tamanho utilizado por uma string, desta forma, evitando overflow,
/// neste caso utilizado na página de visualização de cada Pokémon.
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
