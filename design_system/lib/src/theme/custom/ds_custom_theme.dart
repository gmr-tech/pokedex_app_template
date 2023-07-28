// Static members are required for Theme Tailor to work
// ignore_for_file: avoid_classes_with_only_static_members

// Global state is required for for Theme Tailor to work
// ignore_for_file: avoid-global-state

import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../base/ds_base_typography.dart';
import '../constant/ds_const_color.dart';

part 'ds_color.dart';
part 'ds_custom_theme.tailor.dart';
part 'ds_typography.dart';

/// A anotação `@tailor` é utilizada para que possamos sinalizar que essa é uma
/// classe que contém extensões adicionais ao tema da aplicação.
/// 
/// A classe `_$DSCustomTheme` ela utiliza a anotação `@themeExtension` como 
/// forma de extender as duas listas que foram criadas, tanto no arquivo 
/// `ds_color.dart` para definir as cores base da aplicação, quanto o arquivo
/// `ds_typography.dart` para definir as cores base da tipografia. Ou seja, a
/// sua função é agrupar as informações de tema que já foram criadas nas 
/// classes: `_$DSColor` e `_$DSTypography`.  
/// 
@tailor
class _$DSCustomTheme {
  @themeExtension
  static List<DSColor> dsColor = DSColor.themes;

  @themeExtension
  static List<DSTypography> dsTypography = DSTypography.themes;
}

