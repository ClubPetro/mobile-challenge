import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key key, this.namePokemon}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();

  final String namePokemon;
}

class _SearchViewState extends State<SearchView> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Text(""),
        ),
      ),
    );
  }
}
