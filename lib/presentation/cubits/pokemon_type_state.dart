part of 'pokemon_type_cubit.dart';

class PokemonTypeState extends Equatable {
  final UIState uiState;
  final Failure? failure;
  final List<Pokemon> pokemons;

  const PokemonTypeState({
    this.uiState = UIState.initial,
    this.pokemons = const [],
    this.failure,
  });

  @override
  List<Object?> get props => [uiState, failure, pokemons];

  PokemonTypeState copyWith({
    UIState? uiState,
    Failure? failure,
    List<Pokemon>? pokemons,
  }) {
    return PokemonTypeState(
      uiState: uiState ?? this.uiState,
      failure: failure ?? this.failure,
      pokemons: pokemons ?? this.pokemons,
    );
  }
}
