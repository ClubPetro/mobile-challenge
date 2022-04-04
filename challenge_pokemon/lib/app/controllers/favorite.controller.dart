import 'package:challenge_pokemon/app/models/pokemonapi.model.dart';
import 'package:challenge_pokemon/app/repositories/favorite.repository.dart';
import 'package:challenge_pokemon/app/repositories/pokemon.repository.dart';
import 'package:mobx/mobx.dart';
part 'favorite.controller.g.dart';

class FavoriteController = _FavoriteController with _$FavoriteController;

abstract class _FavoriteController with Store {
  final PokemonRepository repositoryPokemon = PokemonRepository();
  final FavoriteRepository repositoryFavorite = FavoriteRepository();

  @observable
  ObservableList<PokemonAPIModel> pokemons;

  @action
  Future<void> getPokemonsFavorites() async {
    pokemons = ObservableList<PokemonAPIModel>();
    var favoritesPokemons = await repositoryFavorite.getFavorites();
    var allPokemons = await repositoryPokemon.getAllPokemons();
    for (int i = 0; i < favoritesPokemons.length; i++) {
      for (int j = 0; j < allPokemons.results.length; j++) {
        if (favoritesPokemons[i].name == allPokemons.results[j].name) {
          var specificPokemon =
              await repositoryPokemon.getPokemon(favoritesPokemons[i].name);
          pokemons.add(specificPokemon);
          break;
        }
      }
    }
  }

  @action
  Future<void> removeFavorite(String name) async {
    for (int i = 0; i < pokemons.length; i++) {
      if (pokemons[i].name == name) {
        pokemons.removeAt(i);
        break;
      }
    }
  }
}
