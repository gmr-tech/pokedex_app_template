// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class DSBaseTypography {

  ///constante `poppinsFont`, que armazena o nome da fonte "Poppins". 
  /// Porque essa fonte será usada para todos os estilos de texto definidos posteriormente. 
  static const poppinsFont = 'Poppins';


  static const TextTheme textTheme = TextTheme(

    /// [DISPLAY]
    ///DISPLAY: Estilos usados para textos de destaque, como títulos principais. Eles têm tamanhos maiores, 
    ///pesos de fonte mais pesados e espaçamento de letras mais amplo.
    displayLarge: TextStyle(
      fontFamily: poppinsFont,
      fontSize: 48,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.25,
    ),
    displayMedium: TextStyle(
      fontFamily: poppinsFont,
      fontSize: 36,
      fontWeight: FontWeight.w800,
      letterSpacing: 1,
    ),
    displaySmall: TextStyle(
      fontFamily: poppinsFont,
      fontSize: 24,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.5,
    ),

    /// [TITLE]
    ///TITLE: Estilos usados para títulos. Eles têm tamanhos menores que os estilos de exibição,
    /// mas ainda são grandes em relação ao corpo do texto. Os títulos têm peso de fonte mais pesado e um leve estilo itálico.
    titleLarge: TextStyle(
      fontFamily: poppinsFont,
      fontSize: 32,
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.italic,
      letterSpacing: 1,
    ),
    titleMedium: TextStyle(
      fontFamily: poppinsFont,
      fontSize: 24,
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.italic,
      letterSpacing: 0.25,
    ),
    titleSmall: TextStyle(
      fontFamily: poppinsFont,
      fontSize: 20,
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.italic,
      letterSpacing: 0.25,
    ),

    /// [HEADLINE]
    /// HEADLINE: Estilos usados para manchetes. Eles têm tamanhos menores que os estilos de título,
    ///  são mais ousados e têm espaçamento de letras mais apertado.
    headlineLarge: TextStyle(
      fontFamily: poppinsFont,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.75,
    ),
    headlineMedium: TextStyle(
      fontFamily: poppinsFont,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
    ),
    headlineSmall: TextStyle(
      fontFamily: poppinsFont,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.25,
    ),

    // [BODY]
    ///BODY: Estilos usados para o corpo principal do texto. Eles têm pesos de fonte mais leves e tamanhos menores que os estilos de manchete.
    bodyLarge: TextStyle(
      fontFamily: poppinsFont,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: poppinsFont,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontFamily: poppinsFont,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );

  static const TextStyle example = TextStyle(
    fontFamily: poppinsFont,
    fontWeight: FontWeight.w500,
    fontSize: 10,
  );
}

///Esses estilos podem ser usados em vários widgets do projeto para aplicar a aparência consistente e personalizada aos textos no aplicativo. 