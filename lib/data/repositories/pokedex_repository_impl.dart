import 'package:dartz/dartz.dart';
import 'package:pokedex/data/data_sources/pokedex_data_source.dart';
import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/domain/repositories/pokedex_repository.dart';

class PokedexRepositoryImpl implements PokedexRepository {
  final PokedexDataSource dataSource;

  const PokedexRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<PokemonType>>> getTypes() async {
    try {
      final result = await dataSource.getTypes();
      return Right(result);
    } catch (exception) {
      return Left(Failure(exception: exception));
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemonsFromType({
    required String typeUrl,
  }) async {
    try {
      final result = await dataSource.getPokemonsFromType(typeUrl: typeUrl);
      return Right(result);
    } catch (exception) {
      return Left(Failure(exception: exception));
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemon({
    required String pokemonUrl,
  }) async {
    try {
      final result = await dataSource.getPokemon(pokemonUrl: pokemonUrl);
      return Right(result);
    } catch (exception) {
      return Left(Failure(exception: exception));
    }
  }
}
