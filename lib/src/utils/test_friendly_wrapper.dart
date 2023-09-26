// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import '../config/is_testing_env.dart';

/// Classe criada para conseguir testar determinado widget, sem que precise de
/// conexão na rede, no caso, podendo ser um dado mockado.
//
// https://stackoverflow.com/questions/57059490/test-circularprogressindicator
class TestFriendlyWrapper extends StatelessWidget {
  const TestFriendlyWrapper({
    required this.child,
    this.replacement = const SizedBox.shrink(),
    super.key,
  });

  final Widget replacement;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return kIsTesting() ? replacement : child;
  }
}
