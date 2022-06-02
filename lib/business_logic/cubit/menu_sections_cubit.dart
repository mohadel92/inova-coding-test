import 'package:bloc/bloc.dart';
import '../../data/interfaces/menui.dart';
import '../../data/models/menu_section.dart';
import '../../data/repositories/menu_sections_repository.dart';
import 'package:meta/meta.dart';

part 'menu_sections_state.dart';

class MenuSectionsCubit extends Cubit<MenuSectionsState>  with MenuInterface{
  MenuSectionsCubit(this.menuSectionsRepository) : super(MenuSectionsInitial());


   late List<MenuSection> menuSections;

  final MenuSectionsRepository menuSectionsRepository;

  @override
  
  Future<List<MenuSection>> getMenuSections() async {

    menuSections = await  menuSectionsRepository.getMenuSections();
    emit(MenusSectionsLoaded(menuSections));
    
    
     return menuSections;
  }
  


}
