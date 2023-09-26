// ignore_for_file: sort_constructors_first
// ignore_for_file: avoid_dynamic_calls
// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../domain/entities/pokemon_base_stats.dart';

/// Classe criada para realizar a desserialização dos dados vindos da api, para
/// o formato do objeto [PokemonBaseStats].
@immutable
class PokemonBaseStatsDTO {
  const PokemonBaseStatsDTO({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  PokemonBaseStats toDomain() {
    return PokemonBaseStats(
      hp: hp,
      attack: attack,
      defense: defense,
      specialAttack: specialAttack,
      specialDefense: specialDefense,
      speed: speed,
    );
  }

  PokemonBaseStatsDTO copyWith({
    int? hp,
    int? attack,
    int? defense,
    int? specialAttack,
    int? specialDefense,
    int? speed,
  }) {
    return PokemonBaseStatsDTO(
      hp: hp ?? this.hp,
      attack: attack ?? this.attack,
      defense: defense ?? this.defense,
      specialAttack: specialAttack ?? this.specialAttack,
      specialDefense: specialDefense ?? this.specialDefense,
      speed: speed ?? this.speed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hp': hp,
      'attack': attack,
      'defense': defense,
      'specialAttack': specialAttack,
      'specialDefense': specialDefense,
      'speed': speed,
    };
  }

  factory PokemonBaseStatsDTO.fromMap(List map) {
    return PokemonBaseStatsDTO(
      hp: map.first['base_stat'] as int,
      attack: map[1]['base_stat'] as int,
      defense: map[2]['base_stat'] as int,
      specialAttack: map[3]['base_stat'] as int,
      specialDefense: map[4]['base_stat'] as int,
      speed: map[5]['base_stat'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonBaseStatsDTO.fromJson(String source) =>
      PokemonBaseStatsDTO.fromMap(json.decode(source) as List<Map>);
}
