import 'menu_section.dart';
import 'optiions.dart';

class CoffeShop {
  CoffeShop({
    required this.sections,
    required this.milkOptions,
    required this.syrupOptions,
  });

  late List<MenuSection> sections;
  late List<Option> milkOptions;
  late List<Option> syrupOptions;

  factory CoffeShop.fromJson(Map<String, dynamic> json) => CoffeShop(
        sections: List<MenuSection>.from(
            json["sections"].map((x) => MenuSection.fromJson(x))),
        milkOptions: List<Option>.from(
            json["milkOptions"].map((x) => Option.fromJson(x))),
        syrupOptions: List<Option>.from(
            json["syrupOptions"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
        "milkOptions": List<dynamic>.from(milkOptions.map((x) => x.toJson())),
        "syrupOptions": List<dynamic>.from(syrupOptions.map((x) => x.toJson())),
      };
}
