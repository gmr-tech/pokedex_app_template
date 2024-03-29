// Need global variable because _lightTheme depends on _lightColorScheme
// which is not a static member
// ignore_for_file: prefer-static-class

// Ignoring null safety for this file because color palette is configured
// in the right way,
// ignore_for_file: avoid-non-null-assertion

// Dynamic is required for Extensions
// ignore_for_file: avoid-dynamic

part of 'ds_theme.dart';

/// Esse arquivo define um esquema de cores
/// voltado para tema light da aplicação.
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

/// Essa propriedade `lightThemeData` tem como objetivo principal
/// declarar um conjunto de dados do tema claro
/// personalizados, incluindo cores, estilos de texto e estilos de botões. Ele
/// faz parte de um arquivo de definição de tema mais amplo (ds_theme.dart)
/// usado para personalizar a aparência da aplicação em um tema claro.
///
/// Os atributos que foram configurados por meio do método `copyWith()`,
/// do `ThemeData.light()`, foram:
///
/// * `appBarTheme`: o bloco `appBarTheme` define a aparência do AppBar
/// (barra de aplicativo) do tema claro, incluindo as cores de fundo,
/// cores do texto e estilos dos ícones.
///
/// * `textTheme`: o bloco `textTheme` define os estilos de texto para
///  diferentes elementos do tema escuro, como títulos e corpo do texto.
///
/// * `elevatedButtonTheme`: o bloco `elevatedButtonTheme` define o estilo
/// dos botões elevados (ElevatedButton) para o tema claro. Ele especifica
/// a cor de fundo e a cor do texto com base no estado do botão (por exemplo:
/// desabilitado e pressionado).
///
final ThemeData _lightThemeData = ThemeData.light().copyWith(
  primaryColor: _lightColorScheme.primary,
  useMaterial3: true,
  colorScheme: _lightColorScheme,
  scaffoldBackgroundColor: _lightColorScheme.background,
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
  cardTheme: const CardTheme(
    color: DSConstColor.white,
    elevation: 0,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(DSConstProperty.radius),
    ),
  ),
  chipTheme: ChipThemeData(
    shape: const StadiumBorder(
      side: BorderSide(width: 0),
    ),
    labelStyle: DSBaseTypography.textTheme.bodyLarge!.copyWith(
      color: DSConstColor.light,
    ),
    backgroundColor: DSConstColor.dark,
    labelPadding: const EdgeInsets.symmetric(
      vertical: DSConstSpace.xxSmall,
      horizontal: DSConstSpace.xSmall,
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: DSConstColor.light,
    thickness: DSConstSize.dividerThickness,
    space: DSConstSpace.xLarge,
  ),
  disabledColor: DSConstColor.light,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: _lightColorScheme.background,
    filled: true,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(DSConstProperty.radius),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(DSConstProperty.radius),
      borderSide: BorderSide(
        color: _lightColorScheme.primaryContainer,
        width: DSConstSize.borderThicknessLarge,
      ),
    ),
    contentPadding: const EdgeInsets.fromLTRB(
      DSConstSpace.medium,
      DSConstSpace.small,
      DSConstSpace.medium,
      DSConstSpace.small,
    ),
    iconColor: _lightColorScheme.primary,
    prefixIconColor: _lightColorScheme.primary,
    suffixIconColor: _lightColorScheme.primary,
    hintStyle: DSBaseTypography.textTheme.bodyMedium!.copyWith(
      color: _lightColorScheme.onBackground,
    ),
  ),
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
  iconTheme: IconThemeData(
    color: _lightColorScheme.onSurface,
  ),
  primaryIconTheme: IconThemeData(
    color: _lightColorScheme.primary,
  ),
  extensions: <ThemeExtension<dynamic>>[DSCustomTheme.light],
);
