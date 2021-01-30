import 'dart:async';
import 'package:challenge_pokemon/app/controllers/pokemon.controller.dart';
import 'package:challenge_pokemon/app/models/favorite.model.dart';
import 'package:challenge_pokemon/app/models/pokemonapi.model.dart';
import 'package:challenge_pokemon/app/repositories/favorite.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DetailView extends StatefulWidget {
  final PokemonAPIModel model;

  DetailView({
    @required this.model,
  });

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final _repository = FavoriteRepository();
  final PokemonController controller = PokemonController();
  String capitalize(String term) {
    return "${term[0].toUpperCase()}${term.substring(1)}";
  }

  @override
  Widget build(BuildContext context) {
    String types = capitalize(widget.model.types[0].type.name);
    for (int i = 1; i < widget.model.types.length; i++) {
      types += ", " + capitalize(widget.model.types[i].type.name);
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.26),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Theme.of(context).accentColor,
          ),
          leading: IconButton(
            padding: EdgeInsets.only(left: 30),
            icon: Icon(
              Icons.clear,
              size: 40,
            ),
            onPressed: () {
              Navigator.of(context).pop(controller.favorite);
            },
          ),
          backgroundColor: Theme.of(context).primaryColor,
          flexibleSpace: Stack(
            children: [
              Positioned(
                bottom: 5,
                right: 5,
                child: FutureBuilder(
                  future: controller.getFavorites(widget.model.name),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Icon(
                            Icons.error_outline,
                            color: Theme.of(context).accentColor,
                            size: 45,
                          ),
                        );
                      } else {
                        return Observer(builder: (_) {
                          return IconButton(
                            padding: EdgeInsets.only(bottom: 40, right: 40),
                            alignment: Alignment.bottomRight,
                            icon: Icon(
                              controller.favorite
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Theme.of(context).accentColor,
                              size: 45,
                            ),
                            onPressed: () {
                              if (controller.favorite) {
                                _repository
                                    .delete(widget.model.name.toLowerCase());
                                Timer timer =
                                    Timer(Duration(milliseconds: 1500), () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                });
                                showDialog(
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (ctx) {
                                      return Stack(children: [
                                        Positioned(
                                          top: height * 0.80,
                                          right: width * 0.1,
                                          left: width * 0.1,
                                          child: AlertDialog(
                                            elevation: 0,
                                            titlePadding: EdgeInsets.symmetric(
                                                vertical: 2, horizontal: 0),
                                            title: SizedBox(
                                              height: height * 0.04,
                                              width: width * 0.5,
                                              child: Center(
                                                child: Text(
                                                  'Pokémon Desfavoritado',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "OpenSans",
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            backgroundColor: Color(0xFF333333)
                                                .withOpacity(0.7),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30.0))),
                                          ),
                                        ),
                                      ]);
                                    }).then((value) {
                                  timer?.cancel();
                                  timer = null;
                                });
                              } else {
                                _repository.create(FavoriteModel(
                                    name: widget.model.name.toLowerCase()));
                                Timer timer =
                                    Timer(Duration(milliseconds: 1500), () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                });
                                showDialog(
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (ctx) {
                                      return Stack(children: [
                                        Positioned(
                                          top: height * 0.80,
                                          right: width * 0.1,
                                          left: width * 0.1,
                                          child: AlertDialog(
                                            elevation: 0,
                                            titlePadding: EdgeInsets.symmetric(
                                                vertical: 2, horizontal: 0),
                                            title: SizedBox(
                                              height: height * 0.04,
                                              width: width * 0.5,
                                              child: Center(
                                                child: Text(
                                                  'Pokémon Favoritado',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "OpenSans",
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            backgroundColor: Color(0xFF333333)
                                                .withOpacity(0.7),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30.0))),
                                          ),
                                        ),
                                      ]);
                                    }).then((value) {
                                  timer?.cancel();
                                  timer = null;
                                });
                              }
                              controller.toggleFavorite();
                            },
                          );
                        });
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
                  },
                ),
              ),
              Positioned(
                left: 30,
                top: MediaQuery.of(context).padding.top + kToolbarHeight + 10,
                child: Row(
                  children: [
                    SizedBox(
                      width: height * 0.14,
                      height: height * 0.14,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: SizedBox(
                          width: height * 0.13,
                          height: height * 0.13,
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            backgroundImage: NetworkImage(
                              "${widget.model.sprites.other.officialArtwork.frontDefault}",
                              scale: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          capitalize(widget.model.name),
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Tipo: " + types,
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
          future: controller.getEvolutions(widget.model.species.url),
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
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Características",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF02005B),
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Peso",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF02005B),
                                  ),
                                ),
                                Text(
                                  widget.model.weight.toString().substring(
                                          0,
                                          widget.model.weight
                                                  .toString()
                                                  .length -
                                              1) +
                                      "," +
                                      widget.model.weight.toString().substring(
                                          widget.model.weight
                                                  .toString()
                                                  .length -
                                              1) +
                                      " kg",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Altura",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF02005B),
                                  ),
                                ),
                                Text(
                                  widget.model.height.toString() + "0 cm",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          "Evoluções",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF02005B),
                          ),
                        ),
                        for (var i = 0; i < controller.evolucoes.length; i++)
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      capitalize(controller.evolucoes[i]) + " ",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: capitalize(controller.typeEvolution[i]),
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          "Status base",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF02005B),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (var i = 0;
                                  i < widget.model.stats.length;
                                  i++)
                                if (widget.model.stats.elementAt(i).stat.name !=
                                        "special-attack" &&
                                    widget.model.stats.elementAt(i).stat.name !=
                                        "special-defense")
                                  Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          widget.model.stats
                                              .elementAt(i)
                                              .baseStat
                                              .toString(),
                                          style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          capitalize(widget.model.stats
                                              .elementAt(i)
                                              .stat
                                              .name),
                                          style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          "Habilidades",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF02005B),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        for (var i = 0; i < widget.model.moves.length; i++)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Text(
                                    capitalize(widget.model.moves
                                        .elementAt(i)
                                        .move
                                        .name),
                                    style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 14,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
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
