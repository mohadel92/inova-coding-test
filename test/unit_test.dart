// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:inovaexam/data/repositories/menu_sections_repository.dart';
import 'package:inovaexam/data/web_services/menus_web_services.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MenuSectionsRepository menuSectionsRepository;
  MenusWebServices menusWebServices;

  setUp(() {
    menusWebServices = MenusWebServices();
    menuSectionsRepository = MenuSectionsRepository(menusWebServices);
  });

  test("menu sections not empty", () async {
    var menuSection = await menuSectionsRepository.getMenuSections();
    expect(menuSection, isNotEmpty);
  });

  test("each menu section has title", () async {
    var counter = 0;
    var menuSections = await menuSectionsRepository.getMenuSections();
    //!failing case
    // menuSections.first.name = "";
    //!failing case
    for (var section in menuSections) {
      if (section.name.isEmpty) {
        counter++;
      }
    }
    expect(counter, 0);
  });

  test("each menu section has unique id", () async {
    var menuSections = await menuSectionsRepository.getMenuSections();
    //!failing case
    // menuSections.first.id = "ino";
    // menuSections.last.id = "ino";
    //!failing case
    List<String>? menuSectionId = [];
    Set<String>? menuSectionNamesSet = {};

    menuSections.forEach(((element) {
      menuSectionId.add(element.id.toLowerCase().trim());
      menuSectionNamesSet.add(element.id.toLowerCase().trim());
    }));

    expect(true, menuSectionId.length == menuSectionNamesSet.length);
  });


  test("each menu section has drinks", () async {
    var counter = 0;
    var menuSections = await menuSectionsRepository.getMenuSections();

    for (var section in menuSections) {
      if(section.drinks.isEmpty){
        counter++;
      }
    }

    expect(counter, 0);
  });
}
