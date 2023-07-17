// Need global variable because _lightTheme depends on _lightColorScheme
// which is not a static member
// ignore_for_file: prefer-static-class

// Ignoring null safety for this file because color palette is configured
// in the right way,
// ignore_for_file: avoid-non-null-assertion

// Dynamic is required for Extensions
// ignore_for_file: avoid-dynamic

part of 'ds_theme.dart';

final ColorScheme _lightColorScheme = const ColorScheme.light().copyWith(
  primary: DSConstColor.primary,
  primaryContainer: DSConstColor.primary,
  secondary: DSConstColor.secondary,
  secondaryContainer: DSConstColor.secondary,
  surface: DSConstColor.white,
  background: DSConstColor.lighter,
  error: Colors.red,
  onPrimary: DSConstColor.white,
  onSecondary: DSConstColor.white,
  onSurface: DSConstColor.dark,
  onBackground: DSConstColor.dark,
  onError: DSConstColor.white,
  brightness: Brightness.light,
);

final ThemeData _lightThemeData = ThemeData.light().copyWith(
  primaryColor: _lightColorScheme.primary,
  useMaterial3: true,
  colorScheme: _lightColorScheme,
  scaffoldBackgroundColor: _lightColorScheme.background,
   ///O bloco `appBarTheme` define a aparência do AppBar (barra de aplicativo) do tema claro, 
/// incluindo as cores de fundo, cores do texto e estilos dos ícones.
  appBarTheme: AppBarTheme(
    backgroundColor: _lightColorScheme.primaryContainer,
    foregroundColor: _lightColorScheme.onPrimary,
    centerTitle: true,
    elevation: 0,
    shadowColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: _lightColorScheme.onPrimary,
    ),
    actionsIconTheme: IconThemeData(
      color: _lightColorScheme.onPrimary,
    ),
    titleTextStyle: DSBaseTypography.textTheme.headlineMedium!.copyWith(
      color: _lightColorScheme.onPrimary,
    ),
  ),
   ///O bloco `textTheme` define os estilos de texto para diferentes elementos do tema escuro, como títulos e corpo do texto. 
  textTheme: DSBaseTypography.textTheme.copyWith(
    titleLarge: DSBaseTypography.textTheme.titleLarge!.copyWith(
      color: _lightColorScheme.onSurface,
    ),
    titleMedium: DSBaseTypography.textTheme.titleMedium!.copyWith(
      color: _lightColorScheme.onSurface,
    ),
    titleSmall: DSBaseTypography.textTheme.titleSmall!.copyWith(
      color: _lightColorScheme.onSurface,
    ),
    headlineLarge: DSBaseTypography.textTheme.headlineLarge!.copyWith(
      color: _lightColorScheme.onSurface,
    ),
    headlineMedium: DSBaseTypography.textTheme.headlineMedium!.copyWith(
      color: _lightColorScheme.onSurface,
    ),
    headlineSmall: DSBaseTypography.textTheme.headlineSmall!.copyWith(
      color: _lightColorScheme.onSurface,
    ),
    bodyLarge: DSBaseTypography.textTheme.bodyLarge!.copyWith(
      color: _lightColorScheme.onSurface,
    ),
    bodyMedium: DSBaseTypography.textTheme.bodyMedium!.copyWith(
      color: _lightColorScheme.onSurface,
    ),
    bodySmall: DSBaseTypography.textTheme.bodySmall!.copyWith(
      color: _lightColorScheme.onSurface,
    ),
  ),
   /// O bloco `elevatedButtonTheme` define o estilo dos botões elevados (ElevatedButton) para o tema claro. Ele especifica a cor de fundo e a cor do texto com base no estado do botão (por exemplo, desabilitado, pressionado). 
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _baseButtonStyle.copyWith(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return DSConstColor.light;
          } else if (states.contains(MaterialState.pressed)) {
            return DSConstColor.primaryLight;
          } else if (states.contains(MaterialState.hovered)) {
            return DSConstColor.primaryLight;
          } else {
            return DSConstColor.primary;
          }
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return DSConstColor.medium;
          } else {
            return DSConstColor.lighter;
          }
        },
      ),
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[DSCustomTheme.light],
);

///esse arquivo define um esquema de cores e um conjunto de dados de tema claro personalizados, incluindo cores, estilos de texto e estilos de botões. Ele faz parte de um arquivo de definição de tema mais amplo (ds_theme.dart) usado para personalizar a aparência da aplicação em um tema claro.