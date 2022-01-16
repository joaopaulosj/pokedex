import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/data/data_sources/pokedex_data_source.dart';
import 'package:pokedex/data/repositories/pokedex_repository_impl.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/domain/use_cases/get_pokemon_use_case.dart';
import 'package:pokedex/domain/use_cases/get_types_use_case.dart';
import 'package:pokedex/presentation/app_navigator.dart';
import 'package:pokedex/presentation/cubits/pokemon_cubit.dart';
import 'package:pokedex/presentation/cubits/pokemon_type_cubit.dart';
import 'package:pokedex/presentation/cubits/pokemon_types_cubit.dart';
import 'package:pokedex/presentation/pages/pokemon_page.dart';
import 'package:pokedex/presentation/pages/pokemon_type_page.dart';
import 'package:pokedex/presentation/pages/pokemon_types_page.dart';

import 'domain/use_cases/get_pokemons_from_type_use_case.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => AppNavigator()),
        Bind((i) => PokedexDataSource(dio: i())),
        Bind((i) => PokedexRepositoryImpl(dataSource: i())),
        Bind((i) => GetPokemonTypesUseCase(repository: i())),
        Bind((i) => GetPokemonsFromTypeUseCase(repository: i())),
        Bind((i) => GetPokemonUseCase(repository: i())),
        Bind((i) => PokemonTypesCubit(appNavigator: i(), getTypesUseCase: i())),
        Bind.factory(
          (i) => PokemonTypeCubit(
            appNavigator: i(),
            getPokemonsFromTypeUseCase: i(),
            pokemonType: i.args.data as PokemonType,
          ),
        ),
        Bind.factory(
          (i) => PokemonCubit(
            getPokemonUseCase: i(),
            args: i.args.data,
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.pokemonTypes,
          child: (context, args) => const PokemonTypesPage(),
        ),
        ChildRoute(
          AppRoutes.pokemonType,
          child: (context, args) => const PokemonTypePage(),
        ),
        ChildRoute(
          AppRoutes.pokemon,
          child: (context, args) => const PokemonPage(),
        ),
      ];
}
