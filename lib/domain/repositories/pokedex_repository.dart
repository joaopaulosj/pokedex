import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

abstract class PokedexRepository {
  Future<Either<Failure, List<PokemonType>>> getTypes();
}
