// ignore_for_file: sort_constructors_first
// ignore_for_file: avoid_dynamic_calls
// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../domain/entities/pokemon.dart';
import '../../domain/entities/pokemon_type.dart';
import 'pokemon_about_properties_dto.dart';
import 'pokemon_base_stats_dto.dart';

/// Classe criada para realizar a desserialização dos dados vindos da api, para
/// o formato do objeto [Pokemon].
@immutable
class PokemonDTO {
  const PokemonDTO({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.types,
    required this.aboutProperties,
    required this.baseStats,
  });

  final int id;
  final String imageUrl;
  final String name;
  final List<String> types;
  final PokemonAboutPropertiesDTO aboutProperties;
  final PokemonBaseStatsDTO baseStats;

  Pokemon toDomain() {
    return Pokemon(
      id: id,
      imageUrl: imageUrl,
      name: name,
      types:
          types.map(PokemonType.getByString).whereType<PokemonType>().toList(),
      aboutProperties: aboutProperties.toDomain(),
      baseStats: baseStats.toDomain(),
    );
  }

  factory PokemonDTO.fromMap(Map<String, dynamic> map) {
    return PokemonDTO(
      id: map['id'] as int,
      imageUrl: map['sprites']['other']['official-artwork']['front_default']
              as String? ??
          '',
      name: map['name'] as String,
      types: List<String>.of(
        (map['types'] as List)
            .map((element) => element['type']['name'] as String),
      ),
      aboutProperties: PokemonAboutPropertiesDTO.fromMap(map),
      baseStats: PokemonBaseStatsDTO.fromMap(map['stats'] as List),
    );
  }

  factory PokemonDTO.fromJson(String source) =>
      PokemonDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
