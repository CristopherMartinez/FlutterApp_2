class GameModel {
  final int id;
  final String name;
  final String description;
  final int price;
  final String image;

  const GameModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image});

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      image: json["image"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": image
      };
  GameModel copy() => GameModel(
      id: id, name: name, description: description, price: price, image: image);
}
