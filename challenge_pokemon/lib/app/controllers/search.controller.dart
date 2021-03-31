import 'package:challenge_pokemon/app/models/history.model.dart';
import 'package:challenge_pokemon/app/models/pokemonapi.model.dart';
import 'package:challenge_pokemon/app/repositories/history.repository.dart';
import 'package:challenge_pokemon/app/repositories/pokemon.repository.dart';
import 'package:mobx/mobx.dart';
part 'search.controller.g.dart';

class SearchController = _SearchController with _$SearchController;

abstract class _SearchController with Store {
  final PokemonRepository repositoryPokemon = PokemonRepository();
  final HistoryRepository repositoryHistory = HistoryRepository();

  @observable
  ObservableList<PokemonAPIModel> pokemonsSearch;

  @observable
  bool showSearch = false;

  @observable
  ObservableList<HistoryModel> histories;

  @action
  Future<void> getHistories() async {
    histories = ObservableList<HistoryModel>();
    var data = await repositoryHistory.getHistories();
    histories.addAll(data);
  }

  @action
  void toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  Future<void> search(String term) async {
    pokemonsSearch = ObservableList<PokemonAPIModel>();
    var allPokemons = await repositoryPokemon.getAllPokemons();
    term = term.toLowerCase();
    for (int i = 0; i < allPokemons.results.length; i++) {
      if (term.contains(allPokemons.results[i].name) ||
          allPokemons.results[i].name.contains(term)) {
        var specificPokemon =
            await repositoryPokemon.getPokemon(allPokemons.results[i].name);
        pokemonsSearch.add(specificPokemon);
      }
    }
  }
}
