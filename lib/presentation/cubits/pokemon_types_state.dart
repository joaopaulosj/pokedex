part of 'pokemon_types_cubit.dart';

class PokemonTypesState extends Equatable {
  final UIState uiState;
  final Failure? failure;
  final List<PokemonType> pokemonTypes;

  const PokemonTypesState({
    this.uiState = UIState.initial,
    this.pokemonTypes = const [],
    this.failure,
  });

  @override
  List<Object?> get props => [uiState, failure, pokemonTypes];

  PokemonTypesState copyWith({
    UIState? uiState,
    Failure? failure,
    List<PokemonType>? pokemonTypes,
  }) {
    return PokemonTypesState(
      uiState: uiState ?? this.uiState,
      failure: failure ?? this.failure,
      pokemonTypes: pokemonTypes ?? this.pokemonTypes,
    );
  }
}
