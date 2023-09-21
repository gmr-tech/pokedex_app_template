// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';

/// Essa classe foi criada para conseguir esperar a reação gerada pela ação do
/// método, fazendo com que seja rodado um tempo em milissegundos até que seja
/// atualizada a tela.
class Debouncer {
  Debouncer({required this.milliseconds});

  Timer? _timer;
  final int milliseconds;

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
