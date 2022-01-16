import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/constants/app_dimens.dart';
import 'package:pokedex/constants/app_strings.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/presentation/widgets/stat_bar.dart';

class PokemonInfoWidget extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonInfoWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMarginBig),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _Body(pokemon: pokemon),
          const Spacer(),
          _Types(pokemon: pokemon),
          const Spacer(),
          _Stats(pokemon: pokemon),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final Pokemon pokemon;

  const _Body({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text(
              AppStrings.height,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 10),
            ),
            const SizedBox(height: kMarginSmall),
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
            const SizedBox(height: kMarginSmall),
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
    );
  }
}

class _Types extends StatelessWidget {
  final Pokemon pokemon;

  const _Types({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      alignment: WrapAlignment.center,
      children: pokemon.types.map((e) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.typeColor(e),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            child: Text(
              e.name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _Stats extends StatelessWidget {
  final Pokemon pokemon;

  const _Stats({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatBar(label: AppStrings.attack, progress: pokemon.attack),
        const SizedBox(height: kMarginDefault),
        StatBar(label: AppStrings.defense, progress: pokemon.defense),
        const SizedBox(height: kMarginDefault),
        StatBar(label: AppStrings.speed, progress: pokemon.speed),
        const SizedBox(height: kMarginDefault),
        StatBar(label: AppStrings.experience, progress: pokemon.experience),
        const SizedBox(height: kMarginDefault),
        StatBar(label: AppStrings.hp, progress: pokemon.hp),
      ],
    );
  }
}
