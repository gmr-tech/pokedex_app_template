// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';

import 'pokelist_sort_and_filter_screen.dart';

/// `PokeListSortAndFilterButton` é um widget criado para desenvolver o botão,
/// junto com o modal de filtragem de pokémons.
class PokeListSortAndFilterButton extends StatelessWidget {
  const PokeListSortAndFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // O unawaited foi adicionado para fazer com que o restante do código
      // continue sendo executado sem esperar a conclusão da utilização
      // do modal, que é uma função Future.
      onPressed: () => unawaited(
        showModalBottomSheet(
          // A propriedade `isScrollControlled` é utilizada para determinar se o
          // modal será controlado por scroll ou não;
          isScrollControlled: true,

          // A propriedade `constraints` serve para determinar o tamanho do
          // modal.
          constraints: BoxConstraints.loose(
            // Size: widget adicionado para receber os valores de altura e
            // largura.
            Size(
              double.infinity,
              MediaQuery.of(context).size.height * 0.8,
            ),
          ),
          context: context,
          builder: (_) => const PokelistSortAndFilterScreen(),
        ),
      ),

      /// Ícone que representa a lista de filtragem.
      icon: const Icon(Icons.filter_list_rounded),
    );
  }
}
