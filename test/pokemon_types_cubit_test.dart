import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/domain/entities/ui_state.dart';
import 'package:pokedex/domain/use_cases/base_use_case.dart';
import 'package:pokedex/domain/use_cases/get_types_use_case.dart';
import 'package:pokedex/presentation/cubits/pokemon_types_cubit.dart';

import 'mocks/mocks.dart';

class MockGetPokemonTypesUseCase extends Mock
    implements GetPokemonTypesUseCase {}

void main() {
  late PokemonTypesCubit cubit;
  late GetPokemonTypesUseCase getPokemonTypesUseCase;

  setUp(() {
    getPokemonTypesUseCase = MockGetPokemonTypesUseCase();
    cubit = PokemonTypesCubit(getTypesUseCase: getPokemonTypesUseCase);
  });

  tearDown(() {
    cubit.close();
  });

  void setSuccessOnTypesUseCase() {
    when(() => getPokemonTypesUseCase(const NoParams()))
        .thenAnswer((_) async => const Right(mockPokemonTypes));
  }

  void setFailureOnTypesUseCase() {
    when(() => getPokemonTypesUseCase(const NoParams()))
        .thenAnswer((_) async => Left(mockFailure));
  }

  group('initialization', () {
    test('state should be InitialState', () {
      expect(cubit.state.uiState, UIState.initial);
    });
  });

  group(
    'get pokemon types',
    () {
      blocTest<PokemonTypesCubit, PokemonTypesState>(
        'WHEN get types succeeds, THEN state should be Success and set the list',
        build: () => cubit,
        setUp: () => setSuccessOnTypesUseCase(),
        act: (cubit) => cubit.loadPokemonTypes(),
        expect: () => [
          const PokemonTypesState(uiState: UIState.loading),
          const PokemonTypesState(
            uiState: UIState.success,
            pokemonTypes: mockPokemonTypes,
          ),
        ],
      );

      blocTest<PokemonTypesCubit, PokemonTypesState>(
        'WHEN get types doesnt succeed, THEN should emits the error',
        build: () => cubit,
        setUp: () => setFailureOnTypesUseCase(),
        act: (cubit) => cubit.loadPokemonTypes(),
        expect: () => [
          const PokemonTypesState(uiState: UIState.loading),
          PokemonTypesState(uiState: UIState.failure, failure: mockFailure),
        ],
      );
    },
  );
}
