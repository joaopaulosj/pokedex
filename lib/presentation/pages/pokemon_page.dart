import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/constants/app_dimens.dart';
import 'package:pokedex/constants/app_strings.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/ui_state.dart';
import 'package:pokedex/presentation/cubits/pokemon_cubit.dart';
import 'package:pokedex/presentation/widgets/failure_widget.dart';
import 'package:pokedex/utils/string_utils.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Modular.get<PokemonCubit>(),
      child: _PageContent(),
    );
  }
}

class _PageContent extends StatefulWidget {
  @override
  State<_PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<_PageContent> {
  PokemonCubit get _cubit => BlocProvider.of<PokemonCubit>(context);

  @override
  void initState() {
    super.initState();
    _cubit.loadPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
      bloc: _cubit,
      buildWhen: (prev, curr) => prev.uiState != curr.uiState,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              StringUtils.capitalize(state.pokemon.name),
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            centerTitle: true,
            backgroundColor: _cubit.color,
            elevation: 0.0,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _cubit.color.withOpacity(1.0),
                  _cubit.color.withOpacity(0.5),
                ],
              ),
            ),
            child: Column(
              children: [
                Hero(
                  tag: state.pokemon.imageUrl,
                  child: CachedNetworkImage(
                    imageUrl: state.pokemon.imageUrl,
                    fit: BoxFit.fitHeight,
                    height: 200,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(kMarginDefault),
                    child: Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child: Builder(
                        builder: (context) {
                          if (state.uiState == UIState.loading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state.uiState == UIState.success) {
                            return _PokemonInfo(pokemon: state.pokemon);
                          } else if (state.uiState == UIState.failure) {
                            return FailureWidget(
                              failure: state.failure,
                              onRetry: _cubit.loadPokemon,
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PokemonInfo extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonInfo({
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMarginBig),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    AppStrings.height,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: kMarginDefault),
                  Text(
                    '${pokemon.height}m',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    AppStrings.weight,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: kMarginDefault),
                  Text(
                    '${pokemon.weight}kg',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
