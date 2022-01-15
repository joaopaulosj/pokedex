import 'package:flutter_modular/flutter_modular.dart';

class AppRoutes {
  static const String pokemonTypes = '/';
  static const String pokemonType = '/type/';
  static const String pokemon = '/pokemon/';
}

class AppNavigator {
  Future openPokemonType({required String typeUrl}) async {
    await Modular.to.pushNamed(AppRoutes.pokemonType, arguments: typeUrl);
  }

  Future openPokemon(String pokemonUrl) async {
    await Modular.to.pushNamed(AppRoutes.pokemon, arguments: pokemonUrl);
  }
}
