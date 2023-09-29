// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokedex_app_template/src/common/domain/entities/pokemon.dart'
    as _i9;
import 'package:pokedex_app_template/src/features/pokelist/application/pokelist_controller.dart'
    as _i7;
import 'package:pokedex_app_template/src/features/pokelist/domain/i_pokelist_repository.dart'
    as _i3;
import 'package:pokedex_app_template/src/features/pokelist/infrastructure/pokelist_repository.dart'
    as _i4;
import 'package:pokedex_app_template/src/features/pokemon/application/pokemon_controller.dart'
    as _i8;
import 'package:pokedex_app_template/src/features/pokemon/domain/i_pokemon_repository.dart'
    as _i5;
import 'package:pokedex_app_template/src/features/pokemon/infrastructure/pokemon_repository.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IPokeListRepository>(() => _i4.PokeListRepository());
    gh.lazySingleton<_i5.IPokemonRepository>(() => _i6.PokemonRepository());
    gh.factory<_i7.PokeListController>(
        () => _i7.PokeListController(gh<_i3.IPokeListRepository>()));
    gh.factoryParam<_i8.PokemonController, int, _i9.Pokemon?>((
      id,
      pokemon,
    ) =>
        _i8.PokemonController(
          gh<_i5.IPokemonRepository>(),
          id,
          pokemon: pokemon,
        ));
    return this;
  }
}
