import 'package:challenge_pokemon/app/models/pokemonapi.model.dart';
import 'package:challenge_pokemon/app/repositories/pokemon.repository.dart';
import 'package:mobx/mobx.dart';
part 'search.controller.g.dart';

class SearchController = _SearchController with _$SearchController;

abstract class _SearchController with Store {
  final PokemonRepository repository = PokemonRepository();

  @observable
  ObservableList<PokemonAPIModel> pokemons;

  @action
  Future<void> search(String term) async {
    pokemons = ObservableList<PokemonAPIModel>();
    var data = await repository.getAllPokemons();
    for (int i = 0; i < data.results.length; i++) {
      if (term.toLowerCase().contains(data.results[i].name) ||
          data.results[i].name.contains(term.toLowerCase())) {
        var data2 = await repository.getPokemon(data.results[i].name);
        pokemons.add(data2);
      }
    }
  }
}
