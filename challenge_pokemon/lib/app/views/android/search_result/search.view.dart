import 'package:challenge_pokemon/app/controllers/search.controller.dart';
import 'package:challenge_pokemon/app/views/android/list_pokemons/pokemonitem.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key key, this.namePokemon}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();

  final String namePokemon;
}

class _SearchViewState extends State<SearchView> {
  final SearchController controller = SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(120 - MediaQuery.of(context).padding.top),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Color(0xFF02005B),
          ),
          title: Text(
            "Resultado da Pesquisa",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              fontFamily: "OpenSans",
              color: Color(0xFF02005B),
            ),
          ),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: NavigationToolbar.kMiddleSpacing + 56,
                  bottom: (120 -
                          kToolbarHeight -
                          MediaQuery.of(context).padding.top) /
                      2,
                ),
                child: Text(
                  widget.namePokemon,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: "OpenSans",
                    color: Color(0xFF828282),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).accentColor,
        ),
      ),
      body: FutureBuilder(
          future: controller.search(widget.namePokemon),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Aconteceu Algo de ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "Inesperado",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ));
              } else {
                return Observer(
                  builder: (_) {
                    var listView = ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Color(0xFF4F4F4F).withOpacity(0.05),
                        thickness: 3,
                      ),
                      itemCount: controller.pokemons.length,
                      itemBuilder: (ctx, i) {
                        return PokemonItemWidget(model: controller.pokemons[i]);
                      },
                    );
                    if (controller.pokemons.isEmpty) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Nenhum Pokémon",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            "foi encontrado",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ));
                    } else {
                      return listView;
                    }
                  },
                );
              }
            } else {
              return Center(
                child: ShaderMask(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  ),
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor,
                      ],
                      stops: [
                        0.0,
                        0.7,
                      ],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcATop,
                ),
              );
            }
          }),
    );
  }
}
