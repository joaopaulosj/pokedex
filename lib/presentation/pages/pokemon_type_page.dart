import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/domain/entities/ui_state.dart';
import 'package:pokedex/presentation/cubits/pokemon_type_cubit.dart';
import 'package:pokedex/presentation/widgets/failure_widget.dart';

class PokemonTypePage extends StatelessWidget {
  const PokemonTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Modular.get<PokemonTypeCubit>(),
      child: _PageContent(),
    );
  }
}

class _PageContent extends StatefulWidget {
  @override
  State<_PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<_PageContent> {
  PokemonTypeCubit get _cubit => BlocProvider.of<PokemonTypeCubit>(context);

  @override
  void initState() {
    super.initState();
    _cubit.loadPokemonsFromType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PokemonTypeCubit, PokemonTypeState>(
        bloc: _cubit,
        buildWhen: (prev, curr) => prev.uiState != curr.uiState,
        builder: (context, state) {
          if (state.uiState == UIState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.uiState == UIState.success) {
            return ListView.builder(
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = state.pokemons[index];
                return ListTile(
                  leading: SizedBox(
                    height: 64,
                    width: 64,
                    child: Hero(
                      tag: pokemon.imageUrl,
                      child: CachedNetworkImage(imageUrl: pokemon.imageUrl),
                    ),
                  ),
                  title: Text(pokemon.name),
                  subtitle: Text(pokemon.id.toString()),
                  onTap: () => _cubit.onPokemonSelected(pokemon),
                );
              },
            );
          } else if (state.uiState == UIState.failure) {
            return FailureWidget(
              failure: state.failure,
              onRetry: _cubit.loadPokemonsFromType,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
