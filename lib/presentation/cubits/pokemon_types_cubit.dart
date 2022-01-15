import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/name_url_response.dart';
import 'package:pokedex/domain/entities/ui_state.dart';
import 'package:pokedex/domain/use_cases/base_use_case.dart';
import 'package:pokedex/domain/use_cases/get_types_use_case.dart';

part 'pokemon_types_state.dart';

class PokemonTypesCubit extends Cubit<PokemonTypesState> {
  final GetTypesUseCase getTypesUseCase;

  PokemonTypesCubit({
    required this.getTypesUseCase,
  }) : super(const PokemonTypesState());

  Future<void> loadPokemonTypes() async {
    emit(state.copyWith(uiState: UIState.loading));

    final result = await getTypesUseCase(NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(uiState: UIState.failure, failure: failure),
      ),
      (pokemonTypes) => emit(
        state.copyWith(uiState: UIState.success, pokemonTypes: pokemonTypes),
      ),
    );
  }
}
