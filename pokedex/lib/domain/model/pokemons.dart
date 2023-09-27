class Pokemons {
  int count;
  String? next;
  String? previous;
  List<Pokemon> results;

  Pokemons({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });
}

class Pokemon {
  String name;
  String url;

  Pokemon({
    required this.name,
    required this.url,
  });
}