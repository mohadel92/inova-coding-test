import 'package:flutter/material.dart';

import '../../data/models/drink.dart';
import '../../helpers/app_colors.dart';

class DrinkDetailsScreen extends StatelessWidget {
  const DrinkDetailsScreen({Key? key, required this.drink}) : super(key: key);

  final Drink drink;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor1.withOpacity(0.8),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.7,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(drink.name),
              background: Hero(
                tag: drink.id,
                child: Image.asset(
                  drink.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  drink.coffeeBased == true
                      ? const Text(
                          "This drink is Coffee based",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 21),
                        )
                      : const Text("This drink doesn't contains Coffee",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 21)),
                  const SizedBox(
                    height: 32,
                  ),
                  Text("Calories: ${drink.baseCalories} Cal",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 21)),
                  const SizedBox(
                    height: 32,
                  ),
                  drink.servedWithMilk
                      ? const Text("This drink can be served with milk",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 21))
                      : const Text("This drink can't be served with milk",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 21)),
                  const SizedBox(
                    height: 32,
                  ),
                  Text("caffine amount : ${drink.caffeine.join(",")}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 21)),
                  const SizedBox(
                    height: 502,
                  ),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
