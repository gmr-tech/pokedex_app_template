// ignore_for_file: public_member_api_docs

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// `PokemonType` é um *enum* que faz com que defina a cor de background
/// do botão de cada Pókemon na lista, a partir do seu tipo.
enum PokemonType {
  bug('bug', DSConstColor.pokBug),
  dark('dark', DSConstColor.pokDark),
  dragon('dragon', DSConstColor.pokDragon),
  electric('electric', DSConstColor.pokElectric),
  fairy('fairy', DSConstColor.pokFairy),
  fighting('fighting', DSConstColor.pokFighting),
  fire('fire', DSConstColor.pokFire),
  flying('flying', DSConstColor.pokFlying),
  ghost('ghost', DSConstColor.pokGhost),
  grass('grass', DSConstColor.pokGrass),
  ground('ground', DSConstColor.pokGround),
  ice('ice', DSConstColor.pokIce),
  normal('normal', DSConstColor.pokNormal),
  poison('poison', DSConstColor.pokPoison),
  psychic('psychic', DSConstColor.pokPsychic),
  rock('rock', DSConstColor.pokRock),
  steel('steel', DSConstColor.pokSteel),
  water('water', DSConstColor.pokWater);

  /// Aqui temos um construtor constante da classe, ou seja, após ter sido
  /// atribuído um valor a ela em tempo de compilação, o valor dela não pode
  /// ser mais alterado, sendo assim constante.
  const PokemonType(this.value, this.color);

  /// Aqui temos os atributos da classe `PokemonType`,
  final String value;
  final Color color;

  /// Esse método foi criado para conseguir pegar um valor adicionado
  /// no enum <u>`PokemonType`</u> a partir de um valor do tipo **_String_**,
  /// por exemplo: `getByString('fairy').color `.
  static PokemonType? getByString(String value) =>
      PokemonType.values.byName(value);
}
