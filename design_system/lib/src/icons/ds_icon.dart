// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../ds_constants.dart';
import '../theme/constant/ds_const_size.dart';
import 'ds_icon_path.dart';

/// A classe `DSIcon` foi criada para facilitar a criação de ícones
/// com tamanhos pré-definidas e configuração das cores.
class DSIcon extends StatelessWidget {
  const DSIcon({
    required this.icon,
    this.color,
    super.key,
  }) : size = DSConstSize.iconSize;

  const DSIcon.large({
    required this.icon,
    this.color,
    super.key,
  }) : size = DSConstSize.iconSizeLarge;

  const DSIcon.small({
    required this.icon,
    this.color,
    super.key,
  }) : size = DSConstSize.iconSizeSmall;

  const DSIcon.xLarge({
    required this.icon,
    this.color,
    super.key,
  }) : size = DSConstSize.iconSizeXLarge;

  const DSIcon.unconstrained({
    required this.icon,
    this.color,
    super.key,
  }) : size = null;

  /// Varíavel criada para receber o caminho do ícone.
  final DSIconPath icon;

  /// Varíavel criada para receber a cor do ícone.
  final Color? color;

  /// Varíavel criada para receber o tamanho personalizado
  /// para cada tipo de ícone.
  final double? size;

  @override
  Widget build(BuildContext context) {
    // Widget criado para renderizar o ícone.
    final child = SvgPicture.asset(
      icon.path,
      package: DSConstants.package,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).iconTheme.color!,
        BlendMode.srcIn,
      ),
    );

    // Verifica se o tamanho do ícone é nulo.
    // Se for nulo, retorna o ícone diretamente.
    // Caso contrário, envolve o ícone em um SizedBox
    // com o tamanho especificado.
    return size == null
        ? child
        : SizedBox(
            width: size,
            height: size,
            child: Center(
              child: child,
            ),
          );
  }
}
