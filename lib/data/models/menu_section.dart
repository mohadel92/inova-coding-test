import 'drink.dart';

class MenuSection {
    MenuSection({
        required this.id,
        required this.name,
        required  this.image,
        required this.drinks,
    });

    late String id;
    late String name;
    late String image;
     late List<Drink> drinks;

    factory MenuSection.fromJson(Map<String, dynamic> json) => MenuSection(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
    };
}