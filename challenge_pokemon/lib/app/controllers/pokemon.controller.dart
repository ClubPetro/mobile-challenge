import 'package:challenge_pokemon/app/models/pokemonapi.model.dart';
import 'package:challenge_pokemon/app/models/pokemonapievolutions.model.dart';
import 'package:challenge_pokemon/app/repositories/favorite.repository.dart';
import 'package:challenge_pokemon/app/repositories/pokemon.repository.dart';
import 'package:mobx/mobx.dart';
part 'pokemon.controller.g.dart';

class PokemonController = _PokemonController with _$PokemonController;

abstract class _PokemonController with Store {
  final PokemonRepository repositoryPokemon = PokemonRepository();
  final FavoriteRepository repositoryFavorite = FavoriteRepository();

  @observable
  ObservableList<PokemonAPIModel> pokemons;

  @observable
  bool favorite;

  @observable
  String previous;

  @observable
  String next;

  List<String> evolucoes;
  List<String> typeEvolution;

  @action
  Future<void> getPokemons(String link) async {
    pokemons = ObservableList<PokemonAPIModel>();
    var data = await repositoryPokemon.getPokemons(link);
    previous = data.previous;
    next = data.next;
    for (int i = 0; i < data.results.length; i++) {
      var data2 = await repositoryPokemon.getPokemon(data.results[i].name);
      pokemons.add(data2);
    }
  }

  @action
  Future<void> getEvolutions(String url) async {
    evolucoes = List<String>();
    var speciePokemon = await repositoryPokemon.getPokemonSpecie(url);
    var evolutionPokemon = await repositoryPokemon
        .getPokemonEvolutions(speciePokemon.evolutionChain.url);
    evolucoes.add(evolutionPokemon.chain.species.name);
    recursiveEvolution(evolutionPokemon.chain.evolvesTo);

    typeEvolution = List<String>();
    for (int i = 0; i < evolucoes.length; i++) {
      var specificPokemon =
          await repositoryPokemon.getPokemon(evolucoes.elementAt(i));
      String types = "(" + capitalize(specificPokemon.types[0].type.name);
      for (int j = 1; j < specificPokemon.types.length; j++) {
        types += " / " + capitalize(specificPokemon.types[j].type.name);
      }
      types += ")";
      typeEvolution.add(types);
    }
  }

  void recursiveEvolution(List<EvolvesTo> evolvesTo) {
    if (evolvesTo.isEmpty) {
      return null;
    } else {
      for (int i = 0; i < evolvesTo.length; i++) {
        evolucoes.add(evolvesTo.elementAt(i).species.name);
        recursiveEvolution(evolvesTo.elementAt(i).evolvesTo);
      }
    }
  }

  @action
  Future<void> getFavorites(String name) async {
    var dataFavorite = await repositoryFavorite.getFavorite(name.toLowerCase());
    if (dataFavorite == null) {
      favorite = false;
    } else {
      favorite = true;
    }
  }

  @action
  void toggleFavorite() {
    favorite = !favorite;
  }

  String capitalize(String term) {
    return "${term[0].toUpperCase()}${term.substring(1)}";
  }
}
