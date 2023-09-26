// ignore_for_file: public_member_api_docs
// ignore_for_file: sort_constructors_first
// ignore_for_file: avoid_dynamic_calls

import '../../domain/entities/pokemon_about_properties.dart';

/// Classe criada para realizar a desserialização dos dados vindos da api, para
/// o formato do objeto [PokemonAboutProperties].
class PokemonAboutPropertiesDTO {
  const PokemonAboutPropertiesDTO({
    required this.height,
    required this.weight,
    required this.moves,
  });

  final num height;
  final num weight;
  final List<String> moves;

  PokemonAboutProperties toDomain() {
    return PokemonAboutProperties(
      height: height.toInt(),
      weight: weight.toDouble(),
      moves: moves,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'height': height,
      'weight': weight,
      'moves': moves,
    };
  }

  factory PokemonAboutPropertiesDTO.fromMap(Map<String, dynamic> map) {
    return PokemonAboutPropertiesDTO(
      height: map['height'] as num,
      weight: map['weight'] as num,
      moves: (map['moves'] as List)
          .map((e) => e['move']['name'] as String)
          .toList(),
    );
  }
}
