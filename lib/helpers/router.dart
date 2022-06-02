import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/cubit/menu_sections_cubit.dart';
import '../data/models/drink.dart';
import '../data/models/menu_section.dart';
import '../data/repositories/menu_sections_repository.dart';
import '../data/web_services/menus_web_services.dart';
import '../helpers/app_constants.dart';
import '../presentation/screens/drink_details_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/section_details_screen.dart';

class AppRouter {
  late MenuSectionsRepository menuSectionsRepository;
  late MenuSectionsCubit menuSectionsCubit;

  AppRouter() {
    menuSectionsRepository = MenuSectionsRepository(MenusWebServices());
    menuSectionsCubit = MenuSectionsCubit(menuSectionsRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.homePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: ((context) => menuSectionsCubit),
                  child: const HomeScreen(),
                ));

      case AppConstants.menuDetailsPage:
        final section = settings.arguments as MenuSection;
        return MaterialPageRoute(
            builder: (_) => MenuSectionDetailsScreen(menuSection: section));

      case AppConstants.drinkDetailsPage:
        final drink = settings.arguments as Drink;
        return MaterialPageRoute(
            builder: (_) => DrinkDetailsScreen(drink: drink));

      default:
    }
    return null;
  }
}
