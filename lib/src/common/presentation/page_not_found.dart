// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';
import '../../utils/display_strings.dart';

/// Página criada para ser startada quando
/// ocorrer um erro ao navegar à uma página.
class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(DisplayStrings.pageNotFound),
            const DSBoxSpace.large(),
            ElevatedButton(
              onPressed: () => context.pushReplacementNamed(AppRoutes.pokeList),
              child: const Text(DisplayStrings.goHome),
            ),
          ],
        ),
      ),
    );
  }
}
