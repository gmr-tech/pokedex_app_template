// Need global variable because _lightTheme depends on _lightColorScheme
// which is not a static member
// ignore_for_file: prefer-static-class

// Ignoring null safety for this file because color palette is configured
// in the right way,
// ignore_for_file: avoid-non-null-assertion

// Dynamic is required for Extensions
// ignore_for_file: avoid-dynamic

part of 'ds_theme.dart';

/// Esse arquivo define um esquema de cores voltado para tema dark da aplicação.
final ColorScheme _darkColorScheme = const ColorScheme.dark().copyWith(
  primary: DSConstColor.primary,
  primaryContainer: DSConstColor.primaryDark,
  secondary: DSConstColor.secondary,
  secondaryContainer: DSConstColor.secondaryDark,
  surface: DSConstColor.dark,
  background: DSConstColor.darker,
  error: Colors.red,
  onPrimary: DSConstColor.white,
  onSecondary: DSConstColor.white,
  onSurface: DSConstColor.white,
  onBackground: DSConstColor.white,
  onError: DSConstColor.white,
  brightness: Brightness.dark,
);

/// Essa propriedade `darkThemeData` tem como objetivo principal
/// declarar um conjunto de dados do tema escuro
/// personalizados, incluindo cores, estilos de texto e estilos de botões. Ele
/// faz parte de um arquivo de definição de tema mais amplo (ds_theme.dart)
/// usado para personalizar a aparência da aplicação em um tema escuro.
/// 
/// Os atributos que foram configurados por meio do método `copyWith()`, 
/// do `ThemeData.dark()`, foram:
/// 
/// * `appBarTheme`: O bloco `appBarTheme` define a aparência do
/// AppBar (barra de aplicativo) do tema escuro, incluindo
/// as cores de fundo, cores do texto e estilos dos ícones.
/// 
/// * `textTheme`: O bloco `textTheme` define os estilos de texto para
/// diferentes elementos do tema escuro, como títulos e corpo do texto.
/// 
/// * `elevatedButtonTheme`: O bloco `elevatedButtonTheme` define o estilo
/// dos botões elevados (ElevatedButton) para o tema escuro. Ele
/// especifica a cor de fundo e a cor do texto com base no estado do botão
/// (por exemplo: desabilitado e pressionado).
///
final ThemeData _darkThemeData = ThemeData.dark().copyWith(
  primaryColor: _darkColorScheme.primary,
  useMaterial3: true,
  colorScheme: _darkColorScheme,
  scaffoldBackgroundColor: _darkColorScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: _darkColorScheme.primaryContainer,
    foregroundColor: _darkColorScheme.onSurface,
    centerTitle: true,
    elevation: 0,
    shadowColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: _darkColorScheme.onPrimary,
    ),
    actionsIconTheme: IconThemeData(
      color: _darkColorScheme.onPrimary,
    ),
    titleTextStyle: DSBaseTypography.textTheme.headlineMedium!.copyWith(
      color: _darkColorScheme.onPrimary,
    ),
  ),
  textTheme: DSBaseTypography.textTheme.copyWith(
    titleLarge: DSBaseTypography.textTheme.titleLarge!.copyWith(
      color: _darkColorScheme.onSurface,
    ),
    titleMedium: DSBaseTypography.textTheme.titleMedium!.copyWith(
      color: _darkColorScheme.onSurface,
    ),
    titleSmall: DSBaseTypography.textTheme.titleSmall!.copyWith(
      color: _darkColorScheme.onSurface,
    ),
    headlineLarge: DSBaseTypography.textTheme.headlineLarge!.copyWith(
      color: _darkColorScheme.onSurface,
    ),
    headlineMedium: DSBaseTypography.textTheme.headlineMedium!.copyWith(
      color: _darkColorScheme.onSurface,
    ),
    headlineSmall: DSBaseTypography.textTheme.headlineSmall!.copyWith(
      color: _darkColorScheme.onSurface,
    ),
    bodyLarge: DSBaseTypography.textTheme.bodyLarge!.copyWith(
      color: _darkColorScheme.onSurface,
    ),
    bodyMedium: DSBaseTypography.textTheme.bodyMedium!.copyWith(
      color: _darkColorScheme.onSurface,
    ),
    bodySmall: DSBaseTypography.textTheme.bodySmall!.copyWith(
      color: _darkColorScheme.onSurface,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _baseButtonStyle.copyWith(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return DSConstColor.dark;
          } else if (states.contains(MaterialState.pressed)) {
            return DSConstColor.primaryDark;
          } else if (states.contains(MaterialState.hovered)) {
            return DSConstColor.primaryDark;
          } else {
            return DSConstColor.primary;
          }
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return DSConstColor.light;
          } else {
            return DSConstColor.lighter;
          }
        },
      ),
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[DSCustomTheme.dark],
);
