import 'package:pokedex/domain/entities/failure.dart';
import 'package:pokedex/domain/entities/name_url_response.dart';

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
