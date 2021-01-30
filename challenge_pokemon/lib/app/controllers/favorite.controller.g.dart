// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteController on _FavoriteController, Store {
  final _$pokemonsAtom = Atom(name: '_FavoriteController.pokemons');

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

  final _$getPokemonsFavoritesAsyncAction =
      AsyncAction('_FavoriteController.getPokemonsFavorites');

  @override
  Future<void> getPokemonsFavorites() {
    return _$getPokemonsFavoritesAsyncAction
        .run(() => super.getPokemonsFavorites());
  }

  final _$removeFavoriteAsyncAction =
      AsyncAction('_FavoriteController.removeFavorite');

  @override
  Future<void> removeFavorite(String name) {
    return _$removeFavoriteAsyncAction.run(() => super.removeFavorite(name));
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons}
    ''';
  }
}
