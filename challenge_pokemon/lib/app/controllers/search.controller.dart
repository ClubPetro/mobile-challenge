import 'package:challenge_pokemon/app/models/history.model.dart';
import 'package:challenge_pokemon/app/models/pokemonapi.model.dart';
import 'package:challenge_pokemon/app/repositories/history.repository.dart';
import 'package:challenge_pokemon/app/repositories/pokemon.repository.dart';
import 'package:mobx/mobx.dart';
part 'search.controller.g.dart';

class SearchController = _SearchController with _$SearchController;

abstract class _SearchController with Store {
  final PokemonRepository repository = PokemonRepository();
  final HistoryRepository repositoryHistory = HistoryRepository();

  @observable
  ObservableList<PokemonAPIModel> pokemonsSearch =
      ObservableList<PokemonAPIModel>();

  @observable
  bool showSearch = false;

  @observable
  ObservableList<HistoryModel> histories = ObservableList<HistoryModel>();

  @action
  Future<void> getHistories() async {
    histories.clear();
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
    var data = await repository.getAllPokemons();
    for (int i = 0; i < data.results.length; i++) {
      if (term.toLowerCase().contains(data.results[i].name) ||
          data.results[i].name.contains(term.toLowerCase())) {
        var data2 = await repository.getPokemon(data.results[i].name);
        pokemonsSearch.add(data2);
      }
    }
  }
}
