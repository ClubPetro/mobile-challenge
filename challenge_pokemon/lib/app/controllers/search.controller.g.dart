// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchController on _SearchController, Store {
  final _$pokemonsSearchAtom = Atom(name: '_SearchController.pokemonsSearch');

  @override
  ObservableList<PokemonAPIModel> get pokemonsSearch {
    _$pokemonsSearchAtom.reportRead();
    return super.pokemonsSearch;
  }

  @override
  set pokemonsSearch(ObservableList<PokemonAPIModel> value) {
    _$pokemonsSearchAtom.reportWrite(value, super.pokemonsSearch, () {
      super.pokemonsSearch = value;
    });
  }

  final _$showSearchAtom = Atom(name: '_SearchController.showSearch');

  @override
  bool get showSearch {
    _$showSearchAtom.reportRead();
    return super.showSearch;
  }

  @override
  set showSearch(bool value) {
    _$showSearchAtom.reportWrite(value, super.showSearch, () {
      super.showSearch = value;
    });
  }

  final _$historiesAtom = Atom(name: '_SearchController.histories');

  @override
  ObservableList<HistoryModel> get histories {
    _$historiesAtom.reportRead();
    return super.histories;
  }

  @override
  set histories(ObservableList<HistoryModel> value) {
    _$historiesAtom.reportWrite(value, super.histories, () {
      super.histories = value;
    });
  }

  final _$getHistoriesAsyncAction =
      AsyncAction('_SearchController.getHistories');

  @override
  Future<void> getHistories() {
    return _$getHistoriesAsyncAction.run(() => super.getHistories());
  }

  final _$searchAsyncAction = AsyncAction('_SearchController.search');

  @override
  Future<void> search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  final _$_SearchControllerActionController =
      ActionController(name: '_SearchController');

  @override
  void toggleSearch() {
    final _$actionInfo = _$_SearchControllerActionController.startAction(
        name: '_SearchController.toggleSearch');
    try {
      return super.toggleSearch();
    } finally {
      _$_SearchControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonsSearch: ${pokemonsSearch},
showSearch: ${showSearch},
histories: ${histories}
    ''';
  }
}
