import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/domain/repositories/pokedex_repository.dart';
import 'package:pokedex/domain/use_cases/base_use_case.dart';

class GetPokemonTypesUseCase extends UseCase<List<PokemonType>, NoParams> {
  final PokedexRepository repository;

  GetPokemonTypesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<PokemonType>>> call(NoParams params) {
    return repository.getTypes();
  }
}
