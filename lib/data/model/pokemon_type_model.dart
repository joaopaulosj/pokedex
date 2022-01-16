import 'package:pokedex/domain/entities/pokemon_type.dart';

class NameUrlResponseModel extends PokemonType {
  const NameUrlResponseModel({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory NameUrlResponseModel.fromJson(Map<String, dynamic> json) {
    return NameUrlResponseModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
