import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String url;
  final double? height;
  final double? weight;
  final List<PokemonType> types;

  const Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.url,
    this.types = const [],
    this.height,
    this.weight,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, url, height, weight, types];
}
