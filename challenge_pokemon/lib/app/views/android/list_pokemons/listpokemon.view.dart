import 'package:challenge_pokemon/app/controllers/pokemon.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'pokemonitem.widget.dart';

class ListPokemonView extends StatefulWidget {
  @override
  _ListPokemonViewState createState() => _ListPokemonViewState();
}

class _ListPokemonViewState extends State<ListPokemonView> {
  final PokemonController controller = PokemonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF02005B),
        ),
        title: Text(
          "Lista de Pokémons",
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
          future: controller.getPokemons(),
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
                            "Nenhum Item na Lista",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            "Encotrado",
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
