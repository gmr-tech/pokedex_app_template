import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// {@template ThemeSwitcherButton}
/// This is the button used to switch between light and dark theme accross
/// the whole app.
///
/// It is an example of how to use a global provider to read and change a value
/// from anywhere in the app.
///
/// {@endtemplate}
class ThemeSwitcherButton extends StatelessWidget {
  /// {@macro ThemeSwitcherButton}
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    // / O `Consumer` é um widget que permite acessar o valor do DSThemeController e reconstruir automaticamente o widget sempre que esse valor mudar.
    return Consumer<DSThemeController>(
      builder: (
        context,
        DSThemeController themeController,
        child,
      ) =>
          IconButton(
        icon: Icon(
          themeController.themeMode == ThemeMode.dark
              ? Icons.dark_mode
              : Icons.light_mode,
        ),
        onPressed: () => themeController.dsThemeMode =
            themeController.themeMode == ThemeMode.dark
                ? DSThemeMode.light
                : DSThemeMode.dark,
      ),
    );
  }
}
