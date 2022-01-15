import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/domain/entities/ui_state.dart';
import 'package:pokedex/domain/use_cases/base_use_case.dart';
import 'package:pokedex/domain/use_cases/get_pokemons_from_type_use_case.dart';
import 'package:pokedex/presentation/app_navigator.dart';
import 'package:pokedex/presentation/cubits/pokemon_type_cubit.dart';

import '../mocks/mocks.dart';

class MockGetPokemonsFromTypeUseCase extends Mock
    implements GetPokemonsFromTypeUseCase {}

class MockAppNavigator extends Mock implements AppNavigator {}

class FakeUrlParams extends Fake implements UrlParams {}

void main() {
  late PokemonTypeCubit cubit;
  late GetPokemonsFromTypeUseCase getPokemonsFromTypeUseCase;
  late AppNavigator appNavigator;

  setUpAll(() {
    registerFallbackValue(FakeUrlParams());
  });

  setUp(() {
    getPokemonsFromTypeUseCase = MockGetPokemonsFromTypeUseCase();
    appNavigator = MockAppNavigator();
    cubit = PokemonTypeCubit(
      getPokemonsFromTypeUseCase: getPokemonsFromTypeUseCase,
      appNavigator: appNavigator,
      typeUrl: 'http://typeurl.com',
    );
  });

  tearDown(() {
    cubit.close();
  });

  void setupAppNavigation() {
    when(() => appNavigator.openPokemon(pokemonUrl: any(named: 'pokemonUrl')))
        .thenAnswer((_) => Future.value(''));
  }

  void setSuccessOnTypesUseCase() {
    when(() => getPokemonsFromTypeUseCase(any()))
        .thenAnswer((_) async => const Right(mockPokemons));
  }

  void setFailureOnTypesUseCase() {
    when(() => getPokemonsFromTypeUseCase(any()))
        .thenAnswer((_) async => Left(mockFailure));
  }

  group('initialization', () {
    test('state should be InitialState', () {
      expect(cubit.state.uiState, UIState.initial);
    });
  });

  group(
    'get pokemons from type',
    () {
      blocTest<PokemonTypeCubit, PokemonTypeState>(
        'WHEN get pokemons succeeds, THEN state should emit the list',
        build: () => cubit,
        setUp: () => setSuccessOnTypesUseCase(),
        act: (cubit) => cubit.loadPokemonsFromType(),
        expect: () => [
          const PokemonTypeState(uiState: UIState.loading),
          const PokemonTypeState(
            uiState: UIState.success,
            pokemons: mockPokemons,
          ),
        ],
      );

      blocTest<PokemonTypeCubit, PokemonTypeState>(
        'WHEN get pokemons doesnt succeed, THEN should emits the error',
        build: () => cubit,
        setUp: () => setFailureOnTypesUseCase(),
        act: (cubit) => cubit.loadPokemonsFromType(),
        expect: () => [
          const PokemonTypeState(uiState: UIState.loading),
          PokemonTypeState(uiState: UIState.failure, failure: mockFailure),
        ],
      );
    },
  );

  group(
    'interactions',
    () {
      test(
        'WHEN user taps on a pokemon, THEN should navigate to it',
        () {
          //Arrange
          setupAppNavigation();
          final pokemon = mockPokemons[0];

          //Act
          cubit.onPokemonSelected(pokemon);

          //Assert
          expect(pokemon.url, isNotNull);
          verify(() => appNavigator.openPokemon(pokemonUrl: pokemon.url!));
        },
      );
    },
  );
}
