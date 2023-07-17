// ignore_for_file: prefer-static-class
// ignore_for_file: avoid-non-null-assertion

part of 'ds_theme.dart';

/// The base button style for the StormDS buttons.
///
/// Contains the default `shape`, `textStyle`, `minimumSize`, `tapTargetSize`
/// and `padding`.
final _baseButtonStyle = ButtonStyle(
  elevation: const MaterialStatePropertyAll(0),
  shape: MaterialStateProperty.all(
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        DSConstProperty.radius,
      ),
    ),
  ),
  textStyle: MaterialStateProperty.all(
    DSBaseTypography.textTheme.headlineMedium,
  ),
  tapTargetSize: MaterialTapTargetSize.padded,
  padding: MaterialStateProperty.all(
    const EdgeInsets.symmetric(
      horizontal: DSConstSpace.medium,
      vertical: DSConstSpace.small,
    ),
  ),
);
