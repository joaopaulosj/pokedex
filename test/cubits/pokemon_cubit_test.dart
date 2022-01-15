import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/domain/entities/ui_state.dart';
import 'package:pokedex/domain/use_cases/base_use_case.dart';
import 'package:pokedex/domain/use_cases/get_pokemon_use_case.dart';
import 'package:pokedex/presentation/cubits/pokemon_cubit.dart';

import '../mocks/mocks.dart';

class MockGetPokemonUseCase extends Mock implements GetPokemonUseCase {}

class FakeUrlParams extends Fake implements UrlParams {}

void main() {
  late PokemonCubit cubit;
  late GetPokemonUseCase getPokemonUseCase;

  setUpAll(() {
    registerFallbackValue(FakeUrlParams());
  });

  setUp(() {
    getPokemonUseCase = MockGetPokemonUseCase();
    cubit = PokemonCubit(
      getPokemonUseCase: getPokemonUseCase,
      pokemonUrl: 'https://pokemon.com',
    );
  });

  tearDown(() {
    cubit.close();
  });

  void setSuccessOnTypesUseCase() {
    when(() => getPokemonUseCase(any()))
        .thenAnswer((_) async => Right(mockPokemons[0]));
  }

  void setFailureOnTypesUseCase() {
    when(() => getPokemonUseCase(any()))
        .thenAnswer((_) async => Left(mockFailure));
  }

  group('initialization', () {
    test('state should be InitialState', () {
      expect(cubit.state.uiState, UIState.initial);
    });
  });

  group(
    'get pokemon',
    () {
      blocTest<PokemonCubit, PokemonState>(
        'WHEN get pokemon succeeds, THEN state should emit the pokemon',
        build: () => cubit,
        setUp: () => setSuccessOnTypesUseCase(),
        act: (cubit) => cubit.loadPokemon(),
        expect: () => [
          const PokemonState(uiState: UIState.loading),
          PokemonState(
            uiState: UIState.success,
            pokemon: mockPokemons[0],
          ),
        ],
      );

      blocTest<PokemonCubit, PokemonState>(
        'WHEN get pokemon doesnt succeed, THEN should emit the error',
        build: () => cubit,
        setUp: () => setFailureOnTypesUseCase(),
        act: (cubit) => cubit.loadPokemon(),
        expect: () => [
          const PokemonState(uiState: UIState.loading),
          PokemonState(uiState: UIState.failure, failure: mockFailure),
        ],
      );
    },
  );
}
