// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'ds_custom_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class DSCustomTheme extends ThemeExtension<DSCustomTheme> {
  const DSCustomTheme({
    required this.dsColor,
    required this.dsTypography,
  });

  final DSColor dsColor;
  final DSTypography dsTypography;

  static final DSCustomTheme light = DSCustomTheme(
    dsColor: _$DSCustomTheme.dsColor[0],
    dsTypography: _$DSCustomTheme.dsTypography[0],
  );

  static final DSCustomTheme dark = DSCustomTheme(
    dsColor: _$DSCustomTheme.dsColor[1],
    dsTypography: _$DSCustomTheme.dsTypography[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  DSCustomTheme copyWith({
    DSColor? dsColor,
    DSTypography? dsTypography,
  }) {
    return DSCustomTheme(
      dsColor: dsColor ?? this.dsColor,
      dsTypography: dsTypography ?? this.dsTypography,
    );
  }

  @override
  DSCustomTheme lerp(covariant ThemeExtension<DSCustomTheme>? other, double t) {
    if (other is! DSCustomTheme) return this as DSCustomTheme;
    return DSCustomTheme(
      dsColor: dsColor.lerp(other.dsColor, t) as DSColor,
      dsTypography: dsTypography.lerp(other.dsTypography, t) as DSTypography,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DSCustomTheme &&
            const DeepCollectionEquality().equals(dsColor, other.dsColor) &&
            const DeepCollectionEquality()
                .equals(dsTypography, other.dsTypography));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(dsColor),
      const DeepCollectionEquality().hash(dsTypography),
    );
  }
}

extension DSCustomThemeBuildContextProps on BuildContext {
  DSCustomTheme get dSCustomTheme => Theme.of(this).extension<DSCustomTheme>()!;
  DSColor get dsColor => dSCustomTheme.dsColor;
  DSTypography get dsTypography => dSCustomTheme.dsTypography;
}

class DSColor extends ThemeExtension<DSColor> {
  const DSColor({
    required this.exampleColor,
  });

  final Color exampleColor;

  static final DSColor light = DSColor(
    exampleColor: _$DSColor.example[0],
  );

  static final DSColor dark = DSColor(
    exampleColor: _$DSColor.example[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  DSColor copyWith({
    Color? exampleColor,
  }) {
    return DSColor(
      exampleColor: exampleColor ?? this.exampleColor,
    );
  }

  @override
  DSColor lerp(covariant ThemeExtension<DSColor>? other, double t) {
    if (other is! DSColor) return this as DSColor;
    return DSColor(
      exampleColor: Color.lerp(exampleColor, other.exampleColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DSColor &&
            const DeepCollectionEquality()
                .equals(exampleColor, other.exampleColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(exampleColor),
    );
  }
}

class DSTypography extends ThemeExtension<DSTypography> {
  const DSTypography({
    required this.caption,
  });

  final TextStyle caption;

  static final DSTypography light = DSTypography(
    caption: _$DSTypography.pokemonID[0],
  );

  static final DSTypography dark = DSTypography(
    caption: _$DSTypography.pokemonID[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  DSTypography copyWith({
    TextStyle? caption,
  }) {
    return DSTypography(
      caption: caption ?? this.caption,
    );
  }

  @override
  DSTypography lerp(covariant ThemeExtension<DSTypography>? other, double t) {
    if (other is! DSTypography) return this as DSTypography;
    return DSTypography(
      caption: TextStyle.lerp(caption, other.caption, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DSTypography &&
            const DeepCollectionEquality().equals(caption, other.caption));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(caption),
    );
  }
}
