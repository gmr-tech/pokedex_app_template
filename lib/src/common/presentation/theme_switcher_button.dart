import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/display_strings.dart';

/// {@template ThemeSwitcherButton}
/// This is the button used to switch between light and dark theme accross
/// the whole app.
///
/// It is an example of how to use a global provider to read and change a value
/// from anywhere in the app.
///
/// {@endtemplate}
///
/// O [ThemeSwitcherButton] utiliza-se do `Consumer` que é um widget construtor
/// proveniente do pacote provider, que permite acessar o valor do
/// `DSThemeController` para que possa reconstruir automaticamente o widget
/// sempre que esse valor mudar.
///
class ThemeSwitcherButton extends StatelessWidget {
  /// {@macro ThemeSwitcherButton}
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DSThemeController>(
      builder: (
        context,
        DSThemeController themeController,
        child,
      ) =>
          ListTile(
        visualDensity: VisualDensity.compact,
        onTap: () => themeController.dsThemeMode =
            themeController.themeMode == ThemeMode.dark
                ? DSThemeMode.light
                : DSThemeMode.dark,
        title: Text(
          themeController.themeMode == ThemeMode.dark
              ? DisplayStrings.light
              : DisplayStrings.dark,
        ),
        subtitle: const Text(DisplayStrings.theme),
        minVerticalPadding: 0,
        contentPadding: const EdgeInsets.fromLTRB(
          DSConstSpace.medium,
          0,
          DSConstSpace.medium,
          0,
        ),
        trailing: Icon(
          themeController.themeMode == ThemeMode.dark
              ? Icons.dark_mode
              : Icons.light_mode,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
