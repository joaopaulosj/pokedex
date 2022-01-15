part of 'pokemon_cubit.dart';

class PokemonState extends Equatable {
  final UIState uiState;
  final Failure? failure;
  final Pokemon? pokemon;

  const PokemonState({
    this.uiState = UIState.initial,
    this.failure,
    this.pokemon,
  });

  @override
  List<Object?> get props => [uiState, failure, pokemon];

  PokemonState copyWith({
    UIState? uiState,
    Failure? failure,
    Pokemon? pokemon,
  }) {
    return PokemonState(
      uiState: uiState ?? this.uiState,
      failure: failure ?? this.failure,
      pokemon: pokemon ?? this.pokemon,
    );
  }
}
