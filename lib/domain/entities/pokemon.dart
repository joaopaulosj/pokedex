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
  final double speed;
  final double defense;
  final double attack;
  final double hp;
  final double experience;

  const Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.url,
    this.speed = 0.0,
    this.defense = 0.0,
    this.attack = 0.0,
    this.hp = 0.0,
    this.experience = 0.0,
    this.types = const [],
    this.height,
    this.weight,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        url,
        height,
        weight,
        types,
        speed,
        defense,
        attack,
        hp,
        experience,
      ];
}
