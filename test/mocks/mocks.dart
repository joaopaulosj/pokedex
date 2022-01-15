import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/name_url_response.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

final mockFailure = Failure(exception: Exception('error'));

const mockPokemonTypes = <NameUrlResponse>[
  NameUrlResponse(name: 'normal', url: 'https://pokeapi.co/api/v2/type/1/'),
  NameUrlResponse(name: 'fighting', url: 'https://pokeapi.co/api/v2/type/2/'),
  NameUrlResponse(name: 'flying', url: 'https://pokeapi.co/api/v2/type/3/'),
  NameUrlResponse(name: 'poison', url: 'https://pokeapi.co/api/v2/type/4/'),
  NameUrlResponse(name: 'ground', url: 'https://pokeapi.co/api/v2/type/5/'),
  NameUrlResponse(name: 'rock', url: 'https://pokeapi.co/api/v2/type/6/'),
  NameUrlResponse(name: 'bug', url: 'https://pokeapi.co/api/v2/type/7/'),
  NameUrlResponse(name: 'ghost', url: 'https://pokeapi.co/api/v2/type/8/'),
  NameUrlResponse(name: 'steel', url: 'https://pokeapi.co/api/v2/type/9/'),
  NameUrlResponse(name: 'fire', url: 'https://pokeapi.co/api/v2/type/10/'),
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
