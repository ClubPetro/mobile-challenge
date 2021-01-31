import 'package:challenge_pokemon/app/models/pokemonapi.model.dart';
import 'package:challenge_pokemon/app/repositories/favorite.repository.dart';
import 'package:challenge_pokemon/app/repositories/pokemon.repository.dart';
import 'package:mobx/mobx.dart';
part 'favorite.controller.g.dart';

class FavoriteController = _FavoriteController with _$FavoriteController;

abstract class _FavoriteController with Store {
  final PokemonRepository repository = PokemonRepository();
  final FavoriteRepository repositoryFavorite = FavoriteRepository();

  @observable
  ObservableList<PokemonAPIModel> pokemons = ObservableList<PokemonAPIModel>();

  @action
  Future<void> getPokemonsFavorites() async {
    pokemons = ObservableList<PokemonAPIModel>();
    var data = await repositoryFavorite.getFavorites();
    var data2 = await repository.getAllPokemons();
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data2.results.length; j++) {
        if (data[i].name == data2.results[j].name) {
          var data3 = await repository.getPokemon(data[i].name);
          pokemons.add(data3);
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
