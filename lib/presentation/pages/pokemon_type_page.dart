import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/constants/app_dimens.dart';
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
      appBar: AppBar(
        title: Text(_cubit.pokemonType.name),
        centerTitle: true,
        backgroundColor: AppColors.typeColor(_cubit.pokemonType),
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.typeColor(_cubit.pokemonType),
              AppColors.typeColor(_cubit.pokemonType).withOpacity(0.6),
            ],
          ),
        ),
        child: BlocBuilder<PokemonTypeCubit, PokemonTypeState>(
          bloc: _cubit,
          buildWhen: (prev, curr) => prev.uiState != curr.uiState,
          builder: (context, state) {
            if (state.uiState == UIState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.uiState == UIState.success) {
              return GridView.builder(
                itemCount: state.pokemons.length,
                padding: const EdgeInsets.all(kMarginDefault),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: kMarginSmall,
                  mainAxisSpacing: kMarginSmall,
                ),
                itemBuilder: (context, index) {
                  final pokemon = state.pokemons[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 4.0,
                    child: InkWell(
                      onTap: () => _cubit.onPokemonSelected(pokemon),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(height: kMarginSmall),
                            Text('#${pokemon.id}'),
                            Expanded(
                              child: Hero(
                                tag: pokemon.imageUrl,
                                child: CachedNetworkImage(
                                  imageUrl: pokemon.imageUrl,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
      ),
    );
  }
}
