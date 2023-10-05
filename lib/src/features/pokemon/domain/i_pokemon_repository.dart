// ignore_for_file: public_member_api_docs, one_member_abstracts

import 'package:dartz/dartz.dart';

import '../../../common/domain/app_failure.dart';
import '../../../common/domain/entities/pokemon.dart';

/// [IPokemonRepository] foi desenvolvida para criar um concrato
/// referente ao método que deverá ser sobreescrito dentro da camada de
/// infraestrutura, responsável por buscar os detalhes dos pokémons.
abstract class IPokemonRepository {
  Future<Either<AppFailure, Pokemon>> fetchPokemonDetails(int id);
}
