// Static members are required for Theme Tailor to work
// ignore_for_file: avoid_classes_with_only_static_members

// Global state is required for for Theme Tailor to work
// ignore_for_file: avoid-global-state

import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../base/ds_base_typography.dart';
import '../constant/ds_const_color.dart';

///O arquivo inclui diretivas part para indicar que o código é dividido em partes e essas partes estão incluídas em outros arquivos. 
part 'ds_color.dart';
part 'ds_custom_theme.tailor.dart';
part 'ds_typography.dart';

// Classe responsável por agrupar e fornecer acesso aos elementos de personalização do tema, como cores e estilos de tipografia,
// que foram definidas no arquivo ds_color.dart e ds_typography.dart
@tailor
class _$DSCustomTheme {
  ///extende ThemeExtension, indicando que é uma extensão do tema padrão do Flutter. Isso permite adicionar propriedades e comportamentos personalizados ao tema. 
  @themeExtension
  static List<DSColor> dsColor = DSColor.themes;

  @themeExtension
  static List<DSTypography> dsTypography = DSTypography.themes;
}

/// ds_custom_theme.dart tem a função de definir e encapsular as configurações e elementos de personalização do tema em uma classe centralizada (DSCustomTheme), permitindo que o tema seja facilmente acessado e aplicado em todo o aplicativo Flutter. 
