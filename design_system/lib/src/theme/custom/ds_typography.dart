// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: avoid-non-null-assertion
// ignore_for_file: avoid-global-state

part of 'ds_custom_theme.dart';

/// A anotação `@TailorComponent` é usada porque devemos especificar a 
/// quantidade de temas do aplicativo e nomeá-los da forma como acharmos 
/// necessário, para que possam ser gerados. Neste caso estão nomeados como 
/// `light` e `dark` dentro da propriedade *themes* da anotação.
/// 
/// A classe `_$DSTypography` é gerada como forma de especificar as cores
/// da tipografia para cada tema gerado, no caso: light e dark, e também 
/// para que possam ter duas cores de exemplo configuradas.
/// 
@TailorComponent(themes: ['light', 'dark'])
class _$DSTypography {
  //do the same with caption
  static List<TextStyle> caption = [
    DSBaseTypography.example.copyWith(
      color: DSConstColor.dark,
    ),
    DSBaseTypography.example.copyWith(
      color: DSConstColor.light,
    ),
  ];
}
