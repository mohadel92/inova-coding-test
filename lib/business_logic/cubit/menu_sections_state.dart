part of 'menu_sections_cubit.dart';

@immutable
abstract class MenuSectionsState {}

class MenuSectionsInitial extends MenuSectionsState {}

class MenusSectionsError extends MenuSectionsState {
  final String error;

  MenusSectionsError(this.error);
}

class MenusSectionsLoaded extends MenuSectionsState {
  final List<MenuSection> menuSection;

  MenusSectionsLoaded(this.menuSection);
}
