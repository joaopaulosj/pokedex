import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/domain/entities/ui_state.dart';
import 'package:pokedex/presentation/cubits/pokemon_types_cubit.dart';
import 'package:pokedex/presentation/widgets/failure_widget.dart';

class PokemonTypesPage extends StatelessWidget {
  const PokemonTypesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Modular.get<PokemonTypesCubit>(),
      child: _PageContent(),
    );
  }
}

class _PageContent extends StatefulWidget {
  @override
  State<_PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<_PageContent> {
  PokemonTypesCubit get _cubit => Modular.get<PokemonTypesCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.loadPokemonTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PokemonTypesCubit, PokemonTypesState>(
        bloc: _cubit,
        buildWhen: (prev, curr) => prev.uiState != curr.uiState,
        builder: (context, state) {
          if (state.uiState == UIState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.uiState == UIState.success) {
            return ListView.builder(
              itemCount: state.pokemonTypes.length,
              itemBuilder: (context, index) {
                final type = state.pokemonTypes[index];
                return ListTile(
                  title: Text(type.name),
                  subtitle: Text(type.url),
                  onTap: () => _cubit.onPokemonTypeSelected(type),
                );
              },
            );
          } else if (state.uiState == UIState.failure) {
            return FailureWidget(
              failure: state.failure,
              onRetry: _cubit.loadPokemonTypes,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
