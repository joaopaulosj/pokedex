import 'dart:ui';

import 'package:pokedex/domain/entities/pokemon_type.dart';

class AppColors {
  static Color typeColor(PokemonType type) {
    switch (type.name) {
      case 'fighting':
        return const Color(0xFFF44336);
      case 'flying':
        return const Color(0xFF1976D2);
      case 'poison':
        return const Color(0xFF9C27B0);
      case 'ground':
        return const Color(0xFFFBC02D);
      case 'rock':
        return const Color(0xFF795548);
      case 'bug':
        return const Color(0xFF388E3C);
      case 'ghost':
        return const Color(0xFF607D8B);
      case 'steel':
        return const Color(0xFF795548);
      case 'fire':
        return const Color(0xFFF44336);
      case 'water':
        return const Color(0xFF2196F3);
      case 'grass':
        return const Color(0xFF4CAF50);
      case 'electric':
        return const Color(0xFFFFC107);
      case 'psychic':
        return const Color(0xFFE91E63);
      case 'ice':
        return const Color(0xFF00BCD4);
      case 'dragon':
        return const Color(0xFFAA00FF);
      case 'dark':
        return const Color(0xFF212121);
      case 'fairy':
        return const Color(0xFFFFC0CB);
      case 'unknown':
        return const Color(0xFF9E9E9E);
      case 'shadow':
        return const Color(0xFF000000);
      default:
        return const Color(0xFF8BC34A);
    }
  }
}
