import 'package:pokedex/domain/entities/pokemon_type.dart';

class PokemonTypeModel extends PokemonType {
  const PokemonTypeModel({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
