class FavoriteModel {
  String name;

  FavoriteModel({
    this.name,
  });

  Map<String, dynamic> toMap() => {
        "name": name,
      };

  factory FavoriteModel.fromMap(Map<String, dynamic> json) => FavoriteModel(
        name: json["name"],
      );
}
