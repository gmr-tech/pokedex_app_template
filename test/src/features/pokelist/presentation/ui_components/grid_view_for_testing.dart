import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app_template/src/features/pokelist/presentation/pokelist_present_const.dart';

/// Usado para construir o gridview pokelist em testes.
/// Widget criado para ser utilizado nos cenários de tests
/// referentes ao estado de representação da gridview da pokelist.
//
// ignore: avoid-top-level-members-in-tests
class GridViewForTesting extends StatelessWidget {
  const GridViewForTesting({
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(DSConstSpace.medium),
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: PokeListPresentConst.gridCrossAxisCount,
        childAspectRatio: PokeListPresentConst.gridChildAspectRatio,
        crossAxisSpacing: DSConstSpace.small,
        mainAxisSpacing: DSConstSpace.small,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
