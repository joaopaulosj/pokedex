import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/ui_state.dart';
import 'package:pokedex/domain/use_cases/base_use_case.dart';
import 'package:pokedex/domain/use_cases/get_pokemon_use_case.dart';

part 'pokemon_state.dart';

class PokemonArgs {
  final Pokemon pokemon;
  final Color color;

  const PokemonArgs({
    required this.pokemon,
    required this.color,
  });
}

class PokemonCubit extends Cubit<PokemonState> {
  final GetPokemonUseCase getPokemonUseCase;
  final PokemonArgs args;

  PokemonCubit({
    required this.getPokemonUseCase,
    required this.args,
  }) : super(PokemonState(pokemon: args.pokemon));

  Pokemon get pokemon => args.pokemon;

  Color get color => args.color;

  Future<void> loadPokemon() async {
    emit(state.copyWith(uiState: UIState.loading, pokemon: pokemon));

    final result = await getPokemonUseCase(UrlParams(pokemon.url));
    result.fold(
      (failure) => emit(
        state.copyWith(uiState: UIState.failure, failure: failure),
      ),
      (pokemon) => emit(
        state.copyWith(uiState: UIState.success, pokemon: pokemon),
      ),
    );
  }
}
