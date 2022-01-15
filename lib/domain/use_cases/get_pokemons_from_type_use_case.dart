import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/repositories/pokedex_repository.dart';
import 'package:pokedex/domain/use_cases/base_use_case.dart';

class GetPokemonsFromTypeUseCase extends UseCase<List<Pokemon>, UrlParams> {
  final PokedexRepository repository;

  GetPokemonsFromTypeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Pokemon>>> call(UrlParams params) {
    return repository.getPokemonsFromType(typeUrl: params.url);
  }
}
