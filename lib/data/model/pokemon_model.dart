import 'package:pokedex/constants/app_network.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/utils/string_utils.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required int id,
    required String name,
    required String imageUrl,
    required String url,
    double? height,
    double? weight,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          url: url,
          height: height,
          weight: weight,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
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
