// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchController on _SearchController, Store {
  final _$pokemonsAtom = Atom(name: '_SearchController.pokemons');

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

  final _$searchAsyncAction = AsyncAction('_SearchController.search');

  @override
  Future<void> search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons}
    ''';
  }
}
