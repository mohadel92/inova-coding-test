import 'package:flutter/material.dart';

import '../../data/models/menu_section.dart';
import '../../helpers/app_constants.dart';
import '../widgets/drink_list_item.dart';

class MenuSectionDetailsScreen extends StatelessWidget {
  const MenuSectionDetailsScreen({Key? key, required this.menuSection})
      : super(key: key);

  final MenuSection menuSection;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuSection.name),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Hero(
                tag: menuSection.id,
                child: Image.asset(
                  menuSection.image,
                  width: 50,
                  height: 50,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: menuSection.drinks.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            var drink = menuSection.drinks[index];
            return DrinkListItem(
              drink: drink,
              onTap: () => Navigator.of(context).pushNamed(
                AppConstants.drinkDetailsPage,
                arguments: drink,
              ),
            );
          },
        ),
      ),
    );
  }
}
