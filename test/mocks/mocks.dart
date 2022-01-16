import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_type.dart';

final mockFailure = Failure(exception: Exception('error'));

const mockPokemonTypes = <PokemonType>[
  PokemonType(name: 'normal', url: 'https://pokeapi.co/api/v2/type/1/'),
  PokemonType(name: 'fighting', url: 'https://pokeapi.co/api/v2/type/2/'),
  PokemonType(name: 'flying', url: 'https://pokeapi.co/api/v2/type/3/'),
  PokemonType(name: 'poison', url: 'https://pokeapi.co/api/v2/type/4/'),
  PokemonType(name: 'ground', url: 'https://pokeapi.co/api/v2/type/5/'),
  PokemonType(name: 'rock', url: 'https://pokeapi.co/api/v2/type/6/'),
  PokemonType(name: 'bug', url: 'https://pokeapi.co/api/v2/type/7/'),
  PokemonType(name: 'ghost', url: 'https://pokeapi.co/api/v2/type/8/'),
  PokemonType(name: 'steel', url: 'https://pokeapi.co/api/v2/type/9/'),
  PokemonType(name: 'fire', url: 'https://pokeapi.co/api/v2/type/10/'),
];

const mockPokemons = <Pokemon>[
  Pokemon(
    id: 1,
    name: 'bulbasaur',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
    url: 'https://pokeapi.co/api/v2/pokemon/1/',
  ),
  Pokemon(
    id: 2,
    name: 'ivysaur',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',
    url: 'https://pokeapi.co/api/v2/pokemon/2/',
  ),
  Pokemon(
    id: 3,
    name: 'venusaur',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png',
    url: 'https://pokeapi.co/api/v2/pokemon/3/',
  ),
  Pokemon(
    id: 4,
    name: 'charmander',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',
    url: 'https://pokeapi.co/api/v2/pokemon/4/',
  ),
  Pokemon(
    id: 5,
    name: 'charmeleon',
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png',
    url: 'https://pokeapi.co/api/v2/pokemon/5/',
  ),
];
