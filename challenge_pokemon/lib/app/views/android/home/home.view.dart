import 'dart:ui';
import 'package:challenge_pokemon/app/models/history.model.dart';
import 'package:challenge_pokemon/app/repositories/history.repository.dart';
import 'package:challenge_pokemon/app/views/android/favorite/favorite.view.dart';
import 'package:challenge_pokemon/app/views/android/list_pokemons/listpokemon.view.dart';
import 'package:challenge_pokemon/app/views/android/search_result/search.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HistoryRepository repositoryHistory = HistoryRepository();
  FocusNode fieldNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.075,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.64,
                child: Image.asset(
                  'assets/images/logo_pokemon.png',
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.86,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFE6245C),
                                border: Border.all(
                                    width: 2, color: Color(0xFF052595)),
                              ),
                            ),
                            Positioned(
                              top: 3,
                              left: 7,
                              child: Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF1EE71),
                                border: Border.all(
                                    width: 2, color: Color(0xFF052595)),
                              ),
                            ),
                            Positioned(
                              top: 3,
                              left: 7,
                              child: Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF7AFC90),
                                border: Border.all(
                                    width: 2, color: Color(0xFF052595)),
                              ),
                            ),
                            Positioned(
                              top: 3,
                              left: 7,
                              child: Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.68,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.08 *
                                  0.68,
                            ),
                            Text(
                              "Conheça a Pokédex",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF02005B),
                                fontSize: 22,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Utilize a pokédex para encontrar mais informações sobre os seus pokémons.",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF02005B),
                                fontSize: 16,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.08 *
                                  0.68,
                            ),
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 8,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: textEditingController,
                                focusNode: fieldNode,
                                autocorrect: false,
                                enableSuggestions: false,
                                textCapitalization: TextCapitalization.words,
                                cursorColor: Color(0xFFBDBDBD),
                                decoration: InputDecoration(
                                  isDense: true,
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFBDBDBD)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                  hintText: 'Digite o nome do pokémon...',
                                  hintStyle: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xFFBDBDBD),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: fieldNode.hasFocus
                                        ? Color(0xFF02005B)
                                        : Color(0xFFBDBDBD),
                                    size: 27,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xFFBDBDBD),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xFFBDBDBD),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF4F4F4F),
                                ),
                                onChanged: (val) {
                                  if (val.length == 0 || val.length == 1) {
                                    setState(() {});
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.15 *
                                  0.68,
                            ),
                            RaisedButton(
                              onPressed: textEditingController.text.isEmpty
                                  ? null
                                  : () async {
                                      FocusScope.of(context).unfocus();
                                      var data = await repositoryHistory
                                          .getHistories();
                                      bool aux = true;
                                      for (int i = 0; i < data.length; i++) {
                                        if (data[i].history ==
                                            textEditingController.text) {
                                          await repositoryHistory
                                              .delete(data[i].history);
                                          await repositoryHistory.create(
                                              HistoryModel(
                                                  history: textEditingController
                                                      .text));
                                          aux = false;
                                        }
                                      }
                                      if (aux) {
                                        await repositoryHistory.create(
                                            HistoryModel(
                                                history: textEditingController
                                                    .text));

                                        if (data.length > 3) {
                                          await repositoryHistory
                                              .delete(data[0].history);
                                        }
                                      }
                                      if (MediaQuery.of(context)
                                              .viewInsets
                                              .bottom !=
                                          0) {
                                        await Future.delayed(
                                            Duration(milliseconds: 300));
                                      }
                                      Navigator.of(context)
                                          .push(
                                        MaterialPageRoute(
                                          builder: (context) => SearchView(
                                            namePokemon:
                                                textEditingController.text,
                                          ),
                                        ),
                                      )
                                          .then((value) {
                                        setState(() {});
                                        textEditingController.text = "";
                                      });
                                    },
                              padding: EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: textEditingController.text.isEmpty
                                        ? Color(0xFFBDBDBD)
                                        : Color(0xFF02005B),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 8,
                                        offset: Offset(0, 5.0),
                                      )
                                    ]),
                                child: Center(
                                  child: Text(
                                    'PESQUISAR',
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.05 *
                                  0.68,
                            ),
                            RaisedButton(
                              onPressed: () async {
                                if (MediaQuery.of(context).viewInsets.bottom !=
                                    0) {
                                  FocusScope.of(context).unfocus();
                                  await Future.delayed(
                                      Duration(milliseconds: 300));
                                }
                                Navigator.of(context)
                                    .push(
                                  MaterialPageRoute(
                                    builder: (context) => FavoriteView(),
                                  ),
                                )
                                    .then((value) {
                                  setState(() {});
                                  textEditingController.text = "";
                                });
                              },
                              padding: EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFFCB05),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 8,
                                        offset: Offset(0, 5.0),
                                      )
                                    ]),
                                child: Center(
                                  child: Text(
                                    'VER FAVORITOS',
                                    style: TextStyle(
                                      color: Color(0xFF02005B),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.05 *
                                  0.68,
                            ),
                            RaisedButton(
                              onPressed: () async {
                                if (MediaQuery.of(context).viewInsets.bottom !=
                                    0) {
                                  FocusScope.of(context).unfocus();
                                  await Future.delayed(
                                      Duration(milliseconds: 300));
                                }
                                Navigator.of(context)
                                    .push(
                                  MaterialPageRoute(
                                    builder: (context) => ListPokemonView(),
                                  ),
                                )
                                    .then((value) {
                                  setState(() {});
                                  textEditingController.text = "";
                                });
                              },
                              padding: EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Color(0xFF7AFC90),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 8,
                                        offset: Offset(0, 5.0),
                                      )
                                    ]),
                                child: Center(
                                  child: Text(
                                    'LISTAR POKÉMONS',
                                    style: TextStyle(
                                      color: Color(0xFF02005B),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.05 *
                                  0.68,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
