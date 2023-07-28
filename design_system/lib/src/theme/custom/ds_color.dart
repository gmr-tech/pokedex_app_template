// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: avoid-non-null-assertion
// ignore_for_file: avoid-global-state

part of 'ds_custom_theme.dart';

/// A anotação `@TailorComponent` é usada porque devemos especificar a 
/// quantidade de temas do aplicativo e nomeá-los da forma como acharmos 
/// necessário, para que possam ser gerados. Neste caso estão nomeados como 
/// `light` e `dark` dentro da propriedade *themes* da anotação.
/// 
/// A class `_$DSColor` é gerada para que possamos definir as cores base 
/// para cada tema definido, que nesse caso temos duas cores:
/// 
/// * DSConstColors.dark: uma cor definida como base de exemplo para o 
/// tema dark;
/// 
/// * DSConstColor.light: uma cor definida como base de exemplo para o 
/// tema light;  
/// 
@TailorComponent(themes: ['light', 'dark'])
class _$DSColor {
  static List<Color> example = [
    DSConstColor.dark,
    DSConstColor.light,
  ];
}
