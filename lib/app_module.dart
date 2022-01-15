import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/presentation/app_navigator.dart';
import 'package:pokedex/presentation/pages/pokemon_types_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.pokemonTypes,
          child: (context, args) => const PokemonTypesPage(),
        ),
        ChildRoute(
          AppRoutes.pokemonType,
          child: (context, args) => const PokemonTypesPage(),
        ),
        ChildRoute(
          AppRoutes.pokemon,
          child: (context, args) => const PokemonTypesPage(),
        ),
      ];
}
