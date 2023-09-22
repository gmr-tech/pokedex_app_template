// This class will only be used in the tests layer.
// ignore_for_file: avoid-top-level-members-in-tests
import 'package:flutter/material.dart';

/// Esta classe é usada para representar um dispositivo de teste com várias
/// configurações, como tamanho da tela, densidade de pixels, fator de escala
/// de texto, brilho e área segura.
class TestDevice {
  const TestDevice({
    required this.name,
    required this.size,
    this.devicePixelRatio = 3.0,
    this.textScaleFactor = 1.0,
    this.brightness = Brightness.light,
    this.safeArea = EdgeInsets.zero,
  });

  final String name;

  final Size size;

  final double devicePixelRatio;

  final double textScaleFactor;

  final Brightness brightness;

  final EdgeInsets safeArea;

  /// Este método permite criar uma cópia do objeto TestDevice com novos
  /// valores para os parâmetros especificados.
  TestDevice copyWith({
    Size? size,
    double? devicePixelRatio,
    String? name,
    double? textScale,
    Brightness? brightness,
    EdgeInsets? safeArea,
  }) {
    return TestDevice(
      size: size ?? this.size,
      devicePixelRatio: devicePixelRatio ?? this.devicePixelRatio,
      name: name ?? this.name,
      textScaleFactor: textScale ?? textScaleFactor,
      brightness: brightness ?? this.brightness,
      safeArea: safeArea ?? this.safeArea,
    );
  }

  static const TestDevice iphone14ProMax = TestDevice(
    name: 'iphone14ProMax',
    size: Size(1290, 2796),
    safeArea: EdgeInsets.only(top: 44, bottom: 34),
  );

  static const TestDevice iphone14ProMaxLandscape = TestDevice(
    name: 'iphone14ProMax_landscape',
    size: Size(2796, 1290),
    safeArea: EdgeInsets.only(left: 44, right: 34),
  );

  /// Este método retorna uma cópia do dispositivo com o modo de brilho
  /// configurado como Brightness.dark. Ele é útils para testar a aparência
  /// escura do aplicativo em determinados dispositivos.
  TestDevice dark() {
    return TestDevice(
      size: size,
      devicePixelRatio: devicePixelRatio,
      textScaleFactor: textScaleFactor,
      brightness: Brightness.dark,
      safeArea: safeArea,
      name: '${name}_dark',
    );
  }

  @override
  String toString() {
    return 'Device: $name, '
        '${size.width}x${size.height} @ $devicePixelRatio, '
        'text: $textScaleFactor, $brightness, safe: $safeArea';
  }
}
