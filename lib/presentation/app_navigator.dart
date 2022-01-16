import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/presentation/cubits/pokemon_cubit.dart';

class AppRoutes {
  static const String pokemonTypes = '/';
  static const String pokemonType = '/type/';
  static const String pokemon = '/pokemon/';
}

class AppNavigator {
  Future openPokemonType({required PokemonType pokemonType}) async {
    await Modular.to.pushNamed(AppRoutes.pokemonType, arguments: pokemonType);
  }

  Future openPokemon({required Pokemon pokemon, required Color color}) async {
    await Modular.to.pushNamed(
      AppRoutes.pokemon,
      arguments: PokemonArgs(
        pokemon: pokemon,
        color: color,
      ),
    );
  }
}
