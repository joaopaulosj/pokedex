import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/ui_state.dart';
import 'package:pokedex/domain/use_cases/base_use_case.dart';
import 'package:pokedex/domain/use_cases/get_pokemon_use_case.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final GetPokemonUseCase getPokemonUseCase;
  final String pokemonUrl;

  PokemonCubit({
    required this.getPokemonUseCase,
    required this.pokemonUrl,
  }) : super(const PokemonState());

  Future<void> loadPokemon() async {
    emit(state.copyWith(uiState: UIState.loading));

    final result = await getPokemonUseCase(UrlParams(pokemonUrl));
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
