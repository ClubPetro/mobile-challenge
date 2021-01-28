import 'package:challenge_pokemon/app/models/pokemonapi.model.dart';
import 'package:challenge_pokemon/app/repositories/pokemon.repository.dart';
import 'package:mobx/mobx.dart';
part 'pokemon.controller.g.dart';

class PokemonController = _PokemonController with _$PokemonController;

abstract class _PokemonController with Store {
  final PokemonRepository repository = PokemonRepository();

  @observable
  ObservableList<PokemonAPIModel> pokemons;

  @action
  Future<void> search(String term) async {
    pokemons = ObservableList<PokemonAPIModel>();
    var data = await repository.search(term);
    pokemons.addAll(data);
  }

  @action
  Future<void> getPokemons() async {
    pokemons = ObservableList<PokemonAPIModel>();
    var data = await repository.getPokemons(null);
    for (int i = 0; i < data.results.length; i++) {
      var data2 = await repository.getPokemon(data.results[i].name);
      pokemons.add(data2);
    }
  }

  @action
  Future<void> getPokemonsNext(String link) async {
    pokemons = ObservableList<PokemonAPIModel>();
    var data = await repository.getPokemons(link);
    //pokemons.addAll(data);
  }
}
