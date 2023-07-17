// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: avoid-non-null-assertion
// ignore_for_file: avoid-global-state


part of 'ds_custom_theme.dart';

/// ///A anotação @TailorComponent é específica para o projeto e é definida pelo pacote theme_tailor usado no projeto para facilitar a personalização e ajuste do tema. O pacote theme_tailor utiliza essa anotação para identificar os componentes que podem ser personalizados e gerar o código correspondente para cada tema.
///Portanto, a anotação @TailorComponent(themes: ['light', 'dark']) indica que a classe DSColor é um componente personalizável do tema e que existem dois temas disponíveis para personalização: "light" e "dark".
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
