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

  final _$previousAtom = Atom(name: '_PokemonController.previous');

  @override
  String get previous {
    _$previousAtom.reportRead();
    return super.previous;
  }

  @override
  set previous(String value) {
    _$previousAtom.reportWrite(value, super.previous, () {
      super.previous = value;
    });
  }

  final _$nextAtom = Atom(name: '_PokemonController.next');

  @override
  String get next {
    _$nextAtom.reportRead();
    return super.next;
  }

  @override
  set next(String value) {
    _$nextAtom.reportWrite(value, super.next, () {
      super.next = value;
    });
  }

  final _$favoriteAtom = Atom(name: '_PokemonController.favorite');

  @override
  bool get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(bool value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  final _$getPokemonsAsyncAction =
      AsyncAction('_PokemonController.getPokemons');

  @override
  Future<void> getPokemons(String link) {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons(link));
  }

  final _$getEvolutionsAsyncAction =
      AsyncAction('_PokemonController.getEvolutions');

  @override
  Future<void> getEvolutions(String url) {
    return _$getEvolutionsAsyncAction.run(() => super.getEvolutions(url));
  }

  final _$getFavoritesAsyncAction =
      AsyncAction('_PokemonController.getFavorites');

  @override
  Future<void> getFavorites(String name) {
    return _$getFavoritesAsyncAction.run(() => super.getFavorites(name));
  }

  final _$_PokemonControllerActionController =
      ActionController(name: '_PokemonController');

  @override
  void toggleFavorite() {
    final _$actionInfo = _$_PokemonControllerActionController.startAction(
        name: '_PokemonController.toggleFavorite');
    try {
      return super.toggleFavorite();
    } finally {
      _$_PokemonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
previous: ${previous},
next: ${next},
favorite: ${favorite}
    ''';
  }
}
