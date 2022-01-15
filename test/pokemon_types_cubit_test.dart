import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/domain/entities/ui_state.dart';
import 'package:pokedex/domain/use_cases/base_use_case.dart';
import 'package:pokedex/domain/use_cases/get_types_use_case.dart';
import 'package:pokedex/presentation/app_navigator.dart';
import 'package:pokedex/presentation/cubits/pokemon_types_cubit.dart';

import 'mocks/mocks.dart';

class MockGetPokemonTypesUseCase extends Mock
    implements GetPokemonTypesUseCase {}

class MockAppNavigator extends Mock implements AppNavigator {}

class FakeNoParams extends Fake implements NoParams {}

void main() {
  late PokemonTypesCubit cubit;
  late GetPokemonTypesUseCase getPokemonTypesUseCase;
  late AppNavigator appNavigator;

  setUpAll(() {
    registerFallbackValue(FakeNoParams());
  });

  setUp(() {
    getPokemonTypesUseCase = MockGetPokemonTypesUseCase();
    appNavigator = MockAppNavigator();
    cubit = PokemonTypesCubit(
      getTypesUseCase: getPokemonTypesUseCase,
      appNavigator: appNavigator,
    );
  });

  tearDown(() {
    cubit.close();
  });

  void setupAppNavigation() {
    when(() => appNavigator.openPokemonType(typeUrl: any(named: 'typeUrl')))
        .thenAnswer((_) => Future.value(''));
  }

  void setSuccessOnTypesUseCase() {
    when(() => getPokemonTypesUseCase(any()))
        .thenAnswer((_) async => const Right(mockPokemonTypes));
  }

  void setFailureOnTypesUseCase() {
    when(() => getPokemonTypesUseCase(any()))
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

  group(
    'interactions',
    () {
      test(
        'WHEN user taps on a type, THEN should navigate to type',
        () {
          //Arrange
          setupAppNavigation();
          final type = mockPokemonTypes[0];

          //Act
          cubit.onPokemonTypeSelected(type);

          //Assert
          verify(() => appNavigator.openPokemonType(typeUrl: type.url));
        },
      );
    },
  );
}
