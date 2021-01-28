import 'package:challenge_pokemon/app/models/pokemonapi.model.dart';
import 'package:flutter/material.dart';

class PokemonItemWidget extends StatefulWidget {
  final PokemonAPIModel model;

  PokemonItemWidget({
    @required this.model,
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
              backgroundImage: NetworkImage(
                "${widget.model.sprites.frontDefault}",
                scale: 1,
              ),
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
        "Tipo: " + capitalize(widget.model.types[0].type.name),
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
        onPressed: null,
      ),
    );
  }
}
