import 'package:challenge_pokemon/app/controllers/favorite.controller.dart';
import 'package:challenge_pokemon/app/models/pokemonapi.model.dart';
import 'package:challenge_pokemon/app/views/android/detail/detail.view.dart';
import 'package:flutter/material.dart';

class PokemonItemWidget extends StatefulWidget {
  final PokemonAPIModel model;
  final FavoriteController controller;

  PokemonItemWidget({
    @required this.model,
    this.controller,
  });

  @override
  _PokemonItemWidgetState createState() => _PokemonItemWidgetState();
}

class _PokemonItemWidgetState extends State<PokemonItemWidget> {
  String capitalize(String term) {
    return "${term[0].toUpperCase()}${term.substring(1)}";
  }

  @override
  Widget build(BuildContext context) {
    String types = capitalize(widget.model.types[0].type.name);
    for (int i = 1; i < widget.model.types.length; i++) {
      types += ", " + capitalize(widget.model.types[i].type.name);
    }
    return ListTile(
      leading: SizedBox(
        width: 52,
        height: 52,
        child: CircleAvatar(
          backgroundColor: Color(0xFFFD1A55),
          child: SizedBox(
            width: 47,
            height: 47,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: widget.model.sprites.frontDefault != null ||
                      widget.model.sprites.other.officialArtwork.frontDefault !=
                          null
                  ? NetworkImage(
                      widget.model.sprites.other.officialArtwork.frontDefault !=
                              null
                          ? "${widget.model.sprites.other.officialArtwork.frontDefault}"
                          : "${widget.model.sprites.frontDefault}",
                      scale: 1,
                    )
                  : null,
            ),
          ),
        ),
      ),
      title: Text(
        capitalize(widget.model.name),
        style: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFD1A55)),
      ),
      subtitle: Text(
        "Tipo: " + types,
        style: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF4F4F4F),
        ),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFFFD1A55),
          size: 30,
        ),
        onPressed: () {
          if (widget.controller == null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailView(
                  model: widget.model,
                ),
              ),
            );
          } else {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => DetailView(
                  model: widget.model,
                ),
              ),
            )
                .then((value) {
              if (!value) {
                widget.controller.removeFavorite(widget.model.name);
              }
            });
          }
        },
      ),
    );
  }
}
