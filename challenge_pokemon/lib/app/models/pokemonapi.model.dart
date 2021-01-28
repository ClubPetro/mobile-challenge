class PokemonAPIModel {
  int height;
  int id;
  List<Moves> moves;
  String name;
  Sprites sprites;
  List<Stats> stats;
  List<Types> types;
  int weight;

  PokemonAPIModel(
      {this.height,
      this.id,
      this.moves,
      this.name,
      this.sprites,
      this.stats,
      this.types,
      this.weight});

  PokemonAPIModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    id = json['id'];
    if (json['moves'] != null) {
      moves = new List<Moves>();
      json['moves'].forEach((v) {
        moves.add(new Moves.fromJson(v));
      });
    }
    name = json['name'];
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      stats = new List<Stats>();
      json['stats'].forEach((v) {
        stats.add(new Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = new List<Types>();
      json['types'].forEach((v) {
        types.add(new Types.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['id'] = this.id;
    if (this.moves != null) {
      data['moves'] = this.moves.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    if (this.sprites != null) {
      data['sprites'] = this.sprites.toJson();
    }
    if (this.stats != null) {
      data['stats'] = this.stats.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    data['weight'] = this.weight;
    return data;
  }
}

class Moves {
  Move move;

  Moves({this.move});

  Moves.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null ? new Move.fromJson(json['move']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.move != null) {
      data['move'] = this.move.toJson();
    }
    return data;
  }
}

class Move {
  String name;

  Move({this.name});

  Move.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Sprites {
  String frontDefault;

  Sprites({this.frontDefault});

  Sprites.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    return data;
  }
}

class Stats {
  int baseStat;
  int effort;
  Stat stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? new Stat.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_stat'] = this.baseStat;
    data['effort'] = this.effort;
    if (this.stat != null) {
      data['stat'] = this.stat.toJson();
    }
    return data;
  }
}

class Stat {
  String name;
  String url;

  Stat({this.name, this.url});

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Types {
  int slot;
  Stat type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? new Stat.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    return data;
  }
}
