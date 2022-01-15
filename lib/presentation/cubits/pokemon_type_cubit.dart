import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/ui_state.dart';
import 'package:pokedex/domain/use_cases/base_use_case.dart';
import 'package:pokedex/domain/use_cases/get_pokemons_from_type_use_case.dart';
import 'package:pokedex/presentation/app_navigator.dart';

part 'pokemon_type_state.dart';

class PokemonTypeCubit extends Cubit<PokemonTypeState> {
  final AppNavigator appNavigator;
  final GetPokemonsFromTypeUseCase getPokemonsFromTypeUseCase;
  final String typeUrl;

  PokemonTypeCubit({
    required this.appNavigator,
    required this.getPokemonsFromTypeUseCase,
    required this.typeUrl,
  }) : super(const PokemonTypeState());

  Future<void> loadPokemonsFromType() async {
    emit(state.copyWith(uiState: UIState.loading));

    final result = await getPokemonsFromTypeUseCase(UrlParams(typeUrl));
    result.fold(
      (failure) => emit(
        state.copyWith(uiState: UIState.failure, failure: failure),
      ),
      (pokemons) => emit(
        state.copyWith(uiState: UIState.success, pokemons: pokemons),
      ),
    );
  }

  void onPokemonSelected(Pokemon pokemon) {
    if (pokemon.url == null) {
      return;
    }

    appNavigator.openPokemon(pokemonUrl: pokemon.url!);
  }
}
