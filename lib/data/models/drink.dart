class Drink {
  Drink(
      {required this.id,
      required this.name,
      required this.caffeine,
      required this.coffeeBased,
      required this.baseCalories,
      required this.servedWithMilk,
      required this.image});

  late String id;
  late String name;
  late List<int> caffeine;
  late bool coffeeBased;
  late bool servedWithMilk;
  late int baseCalories;
  late String image;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        id: json["id"],
        name: json["name"],
        caffeine: List<int>.from(json["caffeine"].map((x) => x)),
        coffeeBased: json["coffeeBased"],
        servedWithMilk: json["servedWithMilk"],
        baseCalories: json["baseCalories"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "caffeine": List<dynamic>.from(caffeine.map((x) => x)),
        "coffeeBased": coffeeBased,
        "servedWithMilk": servedWithMilk,
        "baseCalories": baseCalories,
        "image": image ,
      };
}
