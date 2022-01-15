import 'package:dio/dio.dart';
import 'package:pokedex/constants/app_network.dart';
import 'package:pokedex/data/model/pokemon_type_model.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

class PokedexDataSource {
  final Dio dio;

  PokedexDataSource({required this.dio});

  Future<List<PokemonType>> getTypes() async {
    final result = await dio.get(AppNetwork.typesUrl);
    final types = List.from(result.data['results'])
        .map((e) => PokemonTypeModel.fromJson(e))
        .toList();
    return types;
  }
}
