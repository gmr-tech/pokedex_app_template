import 'package:flutter/material.dart';

import '../../theme/constant/ds_const_space.dart';

part 'ds_box_space_size.dart';

/// {@template DSBoxSpace}
/// A class to simpligy the usage of:
/// ```dart
/// SizedBox(height: value, width: value)
/// ````
/// with:
/// ```dart
/// DSBoxSpace.dimension()
/// ````
/// Only values from [DSBoxSpaceSize] are available for dimension.
/// {@endtemplate}
class DSBoxSpace extends SizedBox {
  ///{@macro DSBoxSpace}
  const DSBoxSpace({super.key}) : super.square(dimension: DSConstSpace.medium);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.xxSmall({super.key})
      : super.square(dimension: DSConstSpace.xxSmall);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.xSmall({super.key})
      : super.square(dimension: DSConstSpace.xSmall);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.small({super.key})
      : super.square(dimension: DSConstSpace.small);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.large({super.key})
      : super.square(dimension: DSConstSpace.large);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.xLarge({super.key})
      : super.square(dimension: DSConstSpace.xLarge);

  ///{@macro DSBoxSpace}
  const DSBoxSpace.xxLarge({super.key})
      : super.square(dimension: DSConstSpace.xxLarge);

  ///{@macro DSBoxSpace}
  DSBoxSpace.custom({required DSBoxSpaceSize size, super.key})
      : super.square(dimension: size.kSize);
}
///a classe DSBoxSpace facilita a criação de SizedBox com dimensões pré-definidas, evitando a necessidade de escrever manualmente o SizedBox com os valores de altura e largura em cada caso. Ela fornece construtores para tamanhos específicos e também permite a criação de caixas com dimensões personalizadas usando a enumeração DSBoxSpaceSize.