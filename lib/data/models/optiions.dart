class Option {
  Option({
    required this.id,
    required this.name,
    required this.calories,
  });

  late String id;
  late String name;
  late int calories;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        name: json["name"],
        calories: json["calories"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "calories": calories,
      };
}
