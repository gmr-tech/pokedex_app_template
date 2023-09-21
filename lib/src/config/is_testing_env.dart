// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:flutter/foundation.dart';

/// Variável global criada para saber o momento que determinado widget
/// está em modo de teste ou não.
//
// ignore: prefer-static-class
bool kIsTesting() {
  try {
    if (kIsWeb) {
      return false;
    }

    return Platform.environment.containsKey('FLUTTER_TEST');
  } on Exception catch (_) {
    return false;
  }
}
