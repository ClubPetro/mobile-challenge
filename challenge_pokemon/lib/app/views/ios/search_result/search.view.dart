import 'package:challenge_pokemon/app/controllers/search.controller.dart';
import 'package:challenge_pokemon/app/models/history.model.dart';
import 'package:challenge_pokemon/app/repositories/history.repository.dart';
import 'package:challenge_pokemon/app/views/android/common_widgets/pokemonitem.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key key, this.namePokemon}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();

  final String namePokemon;
}

class _SearchViewState extends State<SearchView> {
  final HistoryRepository repositoryHistory = HistoryRepository();
  String auxNamePokemon = "";
  String auxNamePokemon2 = "";
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
          title: Observer(
            builder: (_) {
              if (controller.showSearch) {
                return Text(
                  "Pesquisar",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: "OpenSans",
                    color: Color(0xFF02005B),
                  ),
                );
              } else {
                return Text(
                  "Resultado da Pesquisa",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: "OpenSans",
                    color: Color(0xFF02005B),
                  ),
                );
              }
            },
          ),
          actions: [
            Observer(builder: (_) {
              return IconButton(
                icon: Icon(
                  controller.showSearch ? Icons.close : Icons.search,
                ),
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (controller.showSearch) {
                    if (MediaQuery.of(context).viewInsets.bottom != 0) {
                      await Future.delayed(Duration(milliseconds: 300));
                    }
                    auxNamePokemon2 = "";
                  } else {
                    if (auxNamePokemon.isEmpty) {
                      auxNamePokemon2 = widget.namePokemon;
                    } else {
                      auxNamePokemon2 = auxNamePokemon;
                    }
                  }
                  controller.toggleSearch();
                },
              );
            })
          ],
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(
                builder: (_) {
                  if (controller.showSearch) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: NavigationToolbar.kMiddleSpacing,
                        bottom: 5,
                        right: 10,
                      ),
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width -
                                  NavigationToolbar.kMiddleSpacing -
                                  120,
                              height: 30,
                              child: TextFormField(
                                onChanged: (val) {
                                  auxNamePokemon2 = val;
                                  if (val.length == 0 || val.length == 1) {
                                    setState(() {});
                                  }
                                },
                                initialValue: auxNamePokemon.isEmpty
                                    ? widget.namePokemon
                                    : auxNamePokemon,
                                autocorrect: false,
                                autofocus: true,
                                enableSuggestions: false,
                                textCapitalization: TextCapitalization.words,
                                cursorColor: Color(0xFF02005B),
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF02005B),
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Digite o nome do pokémon...',
                                  hintStyle: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xFFBDBDBD),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.clear,
                                      color: Color(0xFFBDBDBD),
                                      size: 15,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFBDBDBD)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              child: RaisedButton(
                                onPressed: auxNamePokemon2.isEmpty
                                    ? null
                                    : () async {
                                        FocusScope.of(context).unfocus();
                                        auxNamePokemon = auxNamePokemon2;
                                        await controller
                                            .search(auxNamePokemon2);
                                        controller.toggleSearch();
                                        var data = await repositoryHistory
                                            .getHistories();
                                        bool aux = true;
                                        for (int i = 0; i < data.length; i++) {
                                          if (data[i].history ==
                                              auxNamePokemon2) {
                                            await repositoryHistory
                                                .delete(data[i].history);
                                            await repositoryHistory.create(
                                                HistoryModel(
                                                    history: auxNamePokemon2));
                                            aux = false;
                                          }
                                        }
                                        if (aux) {
                                          await repositoryHistory.create(
                                              HistoryModel(
                                                  history: auxNamePokemon2));

                                          if (data.length > 3) {
                                            await repositoryHistory
                                                .delete(data[0].history);
                                          }
                                        }
                                      },
                                color: Color(0xFF02005B),
                                padding: EdgeInsets.all(0.0),
                                child: Container(
                                  height: 25,
                                  width: 65,
                                  child: Center(
                                    child: Text(
                                      'PESQUISAR',
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: NavigationToolbar.kMiddleSpacing + 56,
                        bottom: (120 -
                                kToolbarHeight -
                                MediaQuery.of(context).padding.top) /
                            2,
                      ),
                      child: Text(
                        auxNamePokemon.isEmpty
                            ? widget.namePokemon
                            : auxNamePokemon,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: "OpenSans",
                          color: Color(0xFF828282),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          backgroundColor: Theme.of(context).accentColor,
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.showSearch) {
            return SafeArea(
              child: Align(
                widthFactor: double.infinity,
                heightFactor: double.infinity,
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 215,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFFF2F2F2),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 18, bottom: 18),
                    child: FutureBuilder(
                      future: controller.getHistories(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Aconteceu algo",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  "de inesperado.",
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
                                if (controller.histories.length == 1) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 28, right: 17),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Pesquisados recentemente",
                                          style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Color(0xFF02005B),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 24,
                                        ),
                                        Text(
                                          "Você não realizou nenhuma",
                                          style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontSize: 14,
                                            color: Color(0xFF828282),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "pesquisa até o momento.",
                                          style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontSize: 14,
                                            color: Color(0xFF828282),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 28, right: 17),
                                          child: Text(
                                            "Pesquisados recentemente",
                                            style: TextStyle(
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Color(0xFF02005B),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 24,
                                        ),
                                        for (int i =
                                                controller.histories.length - 1;
                                            i > 0;
                                            i--)
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 28, right: 17),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      controller
                                                          .histories[i - 1]
                                                          .history,
                                                      style: TextStyle(
                                                        fontFamily: "OpenSans",
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF828282),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Icon(Icons.history,
                                                        color:
                                                            Color(0xFFBDBDBD),
                                                        size: 22)
                                                  ],
                                                ),
                                              ),
                                              if (i != 1)
                                                Divider(
                                                  color: Color(0xFFE0E0E0),
                                                  thickness: 1,
                                                  height: 20,
                                                )
                                            ],
                                          ),
                                      ],
                                    ),
                                  );
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
                      },
                    ),
                  ),
                ),
              ),
            );
          } else {
            return FutureBuilder(
                future: auxNamePokemon.isEmpty
                    ? controller.search(widget.namePokemon)
                    : controller.search(auxNamePokemon),
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
                            itemCount: controller.pokemonsSearch.length,
                            itemBuilder: (ctx, i) {
                              return PokemonItemWidget(
                                  model: controller.pokemonsSearch[i]);
                            },
                          );
                          if (controller.pokemonsSearch.isEmpty) {
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
                });
          }
        },
      ),
    );
  }
}
