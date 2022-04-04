import 'package:challenge_pokemon/app/controllers/pokemon.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../common_widgets/pokemonitem.widget.dart';

class ListPokemonView extends StatefulWidget {
  @override
  _ListPokemonViewState createState() => _ListPokemonViewState();
}

class _ListPokemonViewState extends State<ListPokemonView> {
  final PokemonController controller = PokemonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(180 - MediaQuery.of(context).padding.top),
        child: AppBar(
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
          backgroundColor: Theme.of(context).colorScheme.secondary,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10,
                        top: (160 -
                            kToolbarHeight -
                            MediaQuery.of(context).padding.top),
                        bottom: 20),
                    child: Column(
                      children: [
                        Observer(builder: (_) {
                          if (controller.previous != null) {
                            return RawMaterialButton(
                              onPressed: () {
                                controller.getPokemons(controller.previous);
                              },
                              elevation: 5.0,
                              fillColor: Theme.of(context).primaryColor,
                              child: Icon(
                                Icons.arrow_back,
                                size: 20.0,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            );
                          } else {
                            return RawMaterialButton(
                              onPressed: null,
                              elevation: 5.0,
                              fillColor: Colors.grey,
                              child: Icon(
                                Icons.arrow_back,
                                size: 20.0,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            );
                          }
                        }),
                        Text(
                          "Página anterior",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF02005B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: 10,
                        top: (160 -
                            kToolbarHeight -
                            MediaQuery.of(context).padding.top),
                        bottom: 20),
                    child: Column(
                      children: [
                        Observer(builder: (_) {
                          if (controller.next != null) {
                            return RawMaterialButton(
                              onPressed: () {
                                controller.getPokemons(controller.next);
                              },
                              elevation: 5.0,
                              fillColor: Theme.of(context).primaryColor,
                              child: Icon(
                                Icons.arrow_forward,
                                size: 20.0,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            );
                          } else {
                            return RawMaterialButton(
                              onPressed: null,
                              elevation: 5.0,
                              fillColor: Colors.grey,
                              child: Icon(
                                Icons.arrow_forward,
                                size: 20.0,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            );
                          }
                        }),
                        Text(
                          "Próxima Página",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF02005B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
          future: controller.getPokemons(null),
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
                        return PokemonItemWidget(model: controller.pokemons[i]);
                      },
                    );
                    if (controller.pokemons.isEmpty) {
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
