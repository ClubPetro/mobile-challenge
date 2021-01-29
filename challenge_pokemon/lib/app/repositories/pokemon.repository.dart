import 'package:challenge_pokemon/app/models/allpokemonapi.model.dart';
import 'package:challenge_pokemon/app/models/pokemonapi.model.dart';
import 'package:challenge_pokemon/app/models/pokemonapievolutions.model.dart';
import 'package:challenge_pokemon/app/models/pokemonapispecie.dart';
import 'package:dio/dio.dart';

class PokemonRepository {
  Dio _dio;

  PokemonRepository() {
    BaseOptions options = new BaseOptions(
      baseUrl: "",
      connectTimeout: 5000,
    );
    _dio = new Dio(options);
  }

  Future<AllPokemonAPIModel> getPokemons(String link) async {
    try {
      Response response;
      if (link == null) {
        response = await _dio
            .get("https://pokeapi.co/api/v2/pokemon?offset=0&limit=10");
      } else {
        response = await _dio.get(link);
      }
      return AllPokemonAPIModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<PokemonAPIModel> getPokemon(String name) async {
    try {
      Response response =
          await _dio.get("https://pokeapi.co/api/v2/pokemon/" + name);
      return PokemonAPIModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<List<PokemonAPIModel>> search(String term) async {
    return <PokemonAPIModel>[];
  }

  Future<PokemonAPISpecieModel> getPokemonSpecie(String url) async {
    try {
      Response response = await _dio.get(url);
      return PokemonAPISpecieModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<PokemonAPIEvolutionsModel> getPokemonEvolutions(String url) async {
    try {
      Response response = await _dio.get(url);
      return PokemonAPIEvolutionsModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
