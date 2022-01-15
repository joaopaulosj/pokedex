class AppStrings {
  static const shared = SharedStrings();
}

class SharedStrings {
  const SharedStrings();

  String get appName => 'Pokedex';

  String get unknownError => 'Unknown Error';

  String get retry => 'Retry';
}
