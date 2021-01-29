import 'package:challenge_pokemon/app/models/pokemonapi.model.dart';
import 'package:challenge_pokemon/app/repositories/favorite.repository.dart';
import 'package:challenge_pokemon/app/repositories/pokemon.repository.dart';
import 'package:mobx/mobx.dart';
part 'pokemon.controller.g.dart';

class PokemonController = _PokemonController with _$PokemonController;

abstract class _PokemonController with Store {
  final PokemonRepository repository = PokemonRepository();
  final FavoriteRepository repositoryFavorite = FavoriteRepository();

  @observable
  ObservableList<PokemonAPIModel> pokemons;
  @observable
  String previous;
  @observable
  String next;
  @observable
  bool favorite;

  List<String> evolucoes;
  List<String> typeEvolution;

  @action
  Future<void> search(String term) async {
    pokemons = ObservableList<PokemonAPIModel>();
    var data = await repository.search(term);
    pokemons.addAll(data);
  }

  @action
  Future<void> getPokemons(String link) async {
    pokemons = ObservableList<PokemonAPIModel>();
    var data = await repository.getPokemons(link);
    previous = data.previous;
    next = data.next;
    for (int i = 0; i < data.results.length; i++) {
      var data2 = await repository.getPokemon(data.results[i].name);
      pokemons.add(data2);
    }
  }

  @action
  Future<void> getEvolutions(String url) async {
    evolucoes = List<String>();
    var data = await repository.getPokemonSpecie(url);
    var dataAux =
        await repository.getPokemonEvolutions(data.evolutionChain.url);
    evolucoes.add(dataAux.chain.species.name);
    if (dataAux.chain.evolvesTo.isNotEmpty) {
      for (int i = 0; i < dataAux.chain.evolvesTo.length; i++) {
        evolucoes.add(dataAux.chain.evolvesTo.elementAt(i).species.name);
        if (dataAux.chain.evolvesTo.elementAt(i).evolvesTo.isNotEmpty) {
          for (int j = 0;
              j < dataAux.chain.evolvesTo.elementAt(i).evolvesTo.length;
              j++) {
            evolucoes.add(dataAux.chain.evolvesTo
                .elementAt(i)
                .evolvesTo
                .elementAt(j)
                .species
                .name);
            if (dataAux.chain.evolvesTo
                .elementAt(i)
                .evolvesTo
                .elementAt(j)
                .evolvesTo
                .isNotEmpty) {
              for (int k = 0;
                  k <
                      dataAux.chain.evolvesTo
                          .elementAt(i)
                          .evolvesTo
                          .elementAt(j)
                          .evolvesTo
                          .length;
                  k++) {
                evolucoes.add(dataAux.chain.evolvesTo
                    .elementAt(i)
                    .evolvesTo
                    .elementAt(j)
                    .evolvesTo
                    .elementAt(k)
                    .species
                    .name);
              }
            }
          }
        }
      }
    }
    typeEvolution = List<String>();
    for (int i = 0; i < evolucoes.length; i++) {
      var data = await repository.getPokemon(evolucoes.elementAt(i));
      String types = "(" + capitalize(data.types[0].type.name);
      for (int j = 1; j < data.types.length; j++) {
        types += " / " + capitalize(data.types[j].type.name);
      }
      types += ")";
      typeEvolution.add(types);
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
