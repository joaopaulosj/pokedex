import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

class GradientContainer extends StatelessWidget {
  final PokemonType pokemonType;
  final Widget child;

  const GradientContainer({
    Key? key,
    required this.pokemonType,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.typeColor(pokemonType),
            AppColors.typeColor(pokemonType).withOpacity(0.5),
          ],
        ),
      ),
    );
  }
}
