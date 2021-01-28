import 'package:flutter/material.dart';

class FavoriteView extends StatefulWidget {
  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
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
    );
  }
}
