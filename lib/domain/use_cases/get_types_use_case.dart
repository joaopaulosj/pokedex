import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/name_url_response.dart';
import 'package:pokedex/domain/repositories/pokedex_repository.dart';
import 'package:pokedex/domain/use_cases/base_use_case.dart';

class GetTypesUseCase extends UseCase<List<NameUrlResponse>, NoParams> {
  final PokedexRepository repository;

  GetTypesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<NameUrlResponse>>> call(NoParams params) {
    return repository.getTypes();
  }
}
