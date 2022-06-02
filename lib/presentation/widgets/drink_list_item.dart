

import 'package:flutter/material.dart';

import '../../data/models/drink.dart';
import '../../helpers/app_colors.dart';

class DrinkListItem extends StatelessWidget {
  const DrinkListItem({
    Key? key,
    required this.drink, this.onTap,
  }) : super(key: key);

  final Drink drink;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration:  BoxDecoration(color: AppColors.secondaryColor1.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.secondaryColor2.withOpacity(0.1),width: 3)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: ListTile(
              leading: Hero(
                tag: drink.id,
                child: Image.asset(drink.image)),
              title: Text(drink.name,style: const TextStyle(color: AppColors.purple,fontWeight: FontWeight.w500),),
            ),
          ),
        ),
      ),
    );
  }
}
