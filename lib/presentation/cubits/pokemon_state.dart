part of 'pokemon_cubit.dart';

class PokemonState extends Equatable {
  final UIState uiState;
  final Pokemon pokemon;
  final Failure? failure;

  const PokemonState({
    this.uiState = UIState.initial,
    required this.pokemon,
    this.failure,
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
