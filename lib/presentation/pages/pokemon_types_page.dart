import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/constants/app_dimens.dart';
import 'package:pokedex/constants/app_strings.dart';
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
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
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
              padding: const EdgeInsets.fromLTRB(
                kMarginDefault,
                kMarginDefault,
                kMarginDefault,
                kMarginBig,
              ),
              itemBuilder: (context, index) {
                final type = state.pokemonTypes[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 8.0,
                  color: AppColors.typeColor(type),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () => _cubit.onPokemonTypeSelected(type),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Center(
                            child: AutoSizeText(
                              type.name,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.04),
                                fontSize: 180.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          type.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
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
