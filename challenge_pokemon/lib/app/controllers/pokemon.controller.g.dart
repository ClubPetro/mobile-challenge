// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonController on _PokemonController, Store {
  final _$pokemonsAtom = Atom(name: '_PokemonController.pokemons');

  @override
  ObservableList<PokemonAPIModel> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<PokemonAPIModel> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_PokemonController.search');

  @override
  Future<void> search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  final _$getPokemonsAsyncAction =
      AsyncAction('_PokemonController.getPokemons');

  @override
  Future<void> getPokemons() {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons());
  }

  final _$getPokemonsNextAsyncAction =
      AsyncAction('_PokemonController.getPokemonsNext');

  @override
  Future<void> getPokemonsNext(String link) {
    return _$getPokemonsNextAsyncAction.run(() => super.getPokemonsNext(link));
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons}
    ''';
  }
}
