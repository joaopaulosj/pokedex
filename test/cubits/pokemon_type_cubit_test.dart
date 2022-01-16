import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
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

class FakePokemon extends Fake implements Pokemon {}

class FakeColor extends Fake implements Color {}

void main() {
  late PokemonTypeCubit cubit;
  late GetPokemonsFromTypeUseCase getPokemonsFromTypeUseCase;
  late AppNavigator appNavigator;

  setUpAll(() {
    registerFallbackValue(FakeUrlParams());
    registerFallbackValue(FakePokemon());
    registerFallbackValue(FakeColor());
  });

  setUp(() {
    getPokemonsFromTypeUseCase = MockGetPokemonsFromTypeUseCase();
    appNavigator = MockAppNavigator();
    cubit = PokemonTypeCubit(
      getPokemonsFromTypeUseCase: getPokemonsFromTypeUseCase,
      appNavigator: appNavigator,
      pokemonType: mockPokemonTypes[0],
    );
  });

  tearDown(() {
    cubit.close();
  });

  void setupAppNavigation() {
    when(() => appNavigator.openPokemon(
          pokemon: any(named: 'pokemon'),
          color: any(named: 'color'),
        )).thenAnswer((_) => Future.value(''));
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
        'WHEN get pokemons doesnt succeed, THEN should emit the error',
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
          verify(
            () => appNavigator.openPokemon(
              pokemon: pokemon,
              color: AppColors.typeColor(cubit.pokemonType),
            ),
          );
        },
      );
    },
  );
}
