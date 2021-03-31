import 'package:challenge_pokemon/app/controllers/favorite.controller.dart';
import 'package:challenge_pokemon/app/views/android/common_widgets/pokemonitem.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FavoriteView extends StatefulWidget {
  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final FavoriteController controller = FavoriteController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF02005B),
        ),
        title: Text(
          "Favoritos",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            fontFamily: "OpenSans",
            color: Color(0xFF02005B),
          ),
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: FutureBuilder(
          future: controller.getPokemonsFavorites(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Aconteceu algo de inesperado.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "Sem conexão com a internet",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "ou conexão lenta.",
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
                        return PokemonItemWidget(
                            model: controller.pokemons[i],
                            controller: controller);
                      },
                    );
                    if (controller.pokemons.isEmpty) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Você não possui nenhum",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            "Pokémon Favoritado",
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
