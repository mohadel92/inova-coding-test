import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helpers/app_constants.dart';
import '../../business_logic/cubit/menu_sections_cubit.dart';
import '../../presentation/widgets/menu_list_item.dart';

import '../../data/models/menu_section.dart';
import '../../helpers/app_colors.dart';
import '../widgets/menu_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late List<MenuSection> menuSection;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MenuSectionsCubit>(context)
        .getMenuSections()
        .then((value) => {menuSection = value});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(AppConstants.appName,
                style: TextStyle(color: AppColors.secondaryColor3))),
        body: BlocBuilder<MenuSectionsCubit, MenuSectionsState>(
          builder: (context, state) {
            if (state is MenusSectionsLoaded) {
              menuSection = (state).menuSection;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: menuSection.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.78,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1),
                    itemBuilder: (_, index) {
                      var menuItem = menuSection[index];
                      return MenuItem(
                        menuSection: menuItem,
                        onTap: () => Navigator.of(context).pushNamed(
                            AppConstants.menuDetailsPage,
                            arguments: menuItem),
                      );
                    }),
              );
            } else if (state is MenusSectionsError) {
              return Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(state.error),
                ],
              ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
