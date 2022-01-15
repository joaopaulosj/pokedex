import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/name_url_response.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

abstract class PokedexRepository {
  Future<Either<Failure, List<NameUrlResponse>>> getTypes();

  Future<Either<Failure, List<Pokemon>>> getPokemonsFromType({
    required String typeUrl,
  });
}
