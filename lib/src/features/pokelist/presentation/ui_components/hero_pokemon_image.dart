// ignore_for_file: public_member_api_docs

import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// Classe criada para conseguir coletar as imagens de cada pokémon
/// pela api e também determinar a configuração do tamanho para cada imagem.
class HeroPokemonImage extends StatelessWidget {
  const HeroPokemonImage({
    required this.imageUrl,
    required this.id,
    super.key,
  });

  final String imageUrl;
  final int id;

  @override
  Widget build(BuildContext context) {
    // Hero é o widget que irá realizar a transição da imagem do pokémon,
    // presente na grid view para a foto do perfil do pokémon.
    return Hero(
      // A `tag` é uma propriedade que faz a comparação entre os dois locais de
      // transição, entre os dois Heros, para saber em quais objetos
      // realizar a transição.
      tag: id.toString(),

      // **CachedNetworkImage** foi usado para fazer com que cada imagem pegada
      // da internet, possa ser armazenada em cache para que uma mesma imagem
      // não precise ser baixada duas vezes.
      child: CachedNetworkImage(
        // Caminho da imagem.
        imageUrl: imageUrl,
        // placeholder é uma propriedade utilizada para mostrar algo na tela em
        // em quanto a imagem é baixada.
        placeholder: (context, url) => DSIcon.unconstrained(
          icon: DSIconPath.pokeball,
          color: Theme.of(context).disabledColor,
        ),
        // errorWidget é o widget de erro que será mostrado caso de erro
        // no carregamento da imagem.
        errorWidget: (context, url, error) => Center(
          child: Icon(
            Icons.error,
            color: Theme.of(context).colorScheme.error,
            size: DSConstSize.iconSizeXLarge,
          ),
        ),
        // propriedade `fit` utilizada para estabelecer um tamanho para a imagem
        // em relação ao espaço disponível para a imagem.
        fit: BoxFit.contain,
      ),
    );
  }
}
