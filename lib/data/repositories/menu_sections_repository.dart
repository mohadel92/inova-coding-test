





import '../interfaces/menui.dart';
import '../models/menu_section.dart';
import '../web_services/menus_web_services.dart';

class MenuSectionsRepository implements MenuInterface{

  final MenusWebServices menusWebServices;

  MenuSectionsRepository(this.menusWebServices);

  @override
@override
  Future<List<MenuSection>> getMenuSections()async {
    final menuSections = await menusWebServices.getMenuSections();
      
    
    return Future.delayed(const Duration(seconds: 2),(() {
      return menuSections.map((section) => MenuSection.fromJson(section)).toList();
    }));
  }

  
}