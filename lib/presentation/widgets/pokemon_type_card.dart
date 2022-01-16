import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

class PokemonTypeCard extends StatelessWidget {
  final PokemonType pokemonType;
  final VoidCallback onTap;

  const PokemonTypeCard({
    Key? key,
    required this.pokemonType,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 8.0,
      color: AppColors.typeColor(pokemonType),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Center(
                child: AutoSizeText(
                  pokemonType.name,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.04),
                    fontSize: 180.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Text(
              pokemonType.name,
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
  }
}
