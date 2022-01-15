import 'package:pokedex/constants/app_network.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/utils/string_utils.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required int id,
    required String name,
    required String imageUrl,
    String? url,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          url: url,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      imageUrl: '${AppNetwork.baseImageUrl}/${json['id']}.png',
    );
  }

  factory PokemonModel.fromNameUrlJson(Map<String, dynamic> json) {
    final id = StringUtils.getIdFromUrl(json['url']);
    return PokemonModel(
      id: id,
      name: json['name'],
      url: json['url'],
      imageUrl: '${AppNetwork.baseImageUrl}/$id.png',
    );
  }
}
