import 'package:pokedex/constants/app_network.dart';
import 'package:pokedex/data/model/pokemon_type_model.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/utils/string_utils.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required int id,
    required String name,
    required String imageUrl,
    required String url,
    List<PokemonType> types = const [],
    double? height,
    double? weight,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          url: url,
          types: types,
          height: height,
          weight: weight,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      types: List.from(json['types'])
          .map((e) => PokemonTypeModel.fromJson(e['type']))
          .toList(),
      weight: json['weight'] / 10,
      height: json['height'] / 10,
      url: '${AppNetwork.basePokemonUrl}/${json['id']}',
      imageUrl: '${AppNetwork.baseSpriteUrl}/${json['id']}.png',
    );
  }

  factory PokemonModel.fromNameUrlJson(Map<String, dynamic> json) {
    final id = StringUtils.getIdFromUrl(json['pokemon']['url']);
    return PokemonModel(
      id: id,
      name: json['pokemon']['name'],
      url: json['pokemon']['url'],
      imageUrl: '${AppNetwork.baseSpriteUrl}/$id.png',
    );
  }
}
