import 'package:dio/dio.dart';
import 'package:pokedex/constants/app_network.dart';
import 'package:pokedex/data/model/pokemon_model.dart';
import 'package:pokedex/data/model/pokemon_type_model.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

class PokedexDataSource {
  final Dio dio;

  PokedexDataSource({required this.dio});

  Future<List<PokemonType>> getTypes() async {
    final result = await dio.get(AppNetwork.typesUrl);
    final types = List.from(result.data['results'])
        .map((e) => NameUrlResponseModel.fromJson(e))
        .toList();
    return types;
  }

  Future<List<Pokemon>> getPokemonsFromType({
    required String typeUrl,
  }) async {
    final result = await dio.get(typeUrl);
    final pokemons = List.from(result.data['pokemon'])
        .map((e) => PokemonModel.fromNameUrlJson(e))
        .toList();
    return pokemons;
  }

  Future<Pokemon> getPokemon({required String pokemonUrl}) async {
    final result = await dio.get(pokemonUrl);
    return PokemonModel.fromJson(result.data);
  }
}
