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
    textDirection: TextDirection.ltr,
  )..layout())
      .size;
}
