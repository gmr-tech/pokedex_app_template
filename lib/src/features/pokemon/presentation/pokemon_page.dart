// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/domain/entities/pokemon.dart';
import '../application/pokemon_controller.dart';
import '../domain/i_pokemon_repository.dart';
import 'ui_components/pokemon_page_error.dart';
import 'ui_components/pokemon_page_loading.dart';
import 'ui_components/pokemon_page_success.dart';

/// Página criada para a representação da página de pokémon, ou seja,
/// todos os seus elementos, juntos e posicionados.
class PokemonPage extends StatefulWidget {
  const PokemonPage({
    required this.id,
    this.controller,
    this.pokemon,
    super.key,
  });

  final int? id;
  final PokemonController? controller;
  final Pokemon? pokemon;

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  // Only way to flow controller and ensure user can load any pokemon using\
  // dynamic link.
  //
  // Eg.: running [localhost:7357/pokemon/2] on the web load yvysaur
  // without loading any other app data
  // ignore: avoid-late-keyword
  late final PokemonController controller;

  /// Verifica se o id do Pokémon foi fornecido. Se sim, ele cria um
  /// PokemonController. Se um controller também foi fornecido, ele usa esse
  /// controlador. Caso contrário, ele cria um novo controlador usando o id
  /// do Pokémon e o registra com uma tag específica.
  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      if (widget.controller != null) {
        controller = widget.controller!;
      } else {
        controller = Get.put(
          PokemonController(
            IPokemonRepository,
            widget.id!,
          ),
          tag: 'pokemon_controller_${widget.id}',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // O widget Obx serve para observar o status do controlador.
    // Com base no status.
    return Obx(
      () => controller.status.value.maybeMap(
        loading: (_) => const PokemonPageLoading(),
        success: (_) => PokemonPageSuccess(pokemon: controller.pokemon!),
        orElse: () => PokemonPageError(onRefresh: controller.refreshPokemon),
      ),
    );
  }
}
