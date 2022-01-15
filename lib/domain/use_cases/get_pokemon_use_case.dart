import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/repositories/pokedex_repository.dart';
import 'package:pokedex/domain/use_cases/base_use_case.dart';

class GetPokemonUseCase extends UseCase<Pokemon, UrlParams> {
  final PokedexRepository repository;

  GetPokemonUseCase({required this.repository});

  @override
  Future<Either<Failure, Pokemon>> call(UrlParams params) {
    return repository.getPokemon(pokemonUrl: params.url);
  }
}
