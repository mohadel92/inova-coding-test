import 'package:flutter/material.dart';
import 'package:inovaexam/helpers/app_constants.dart';
import '../helpers/app_colors.dart';
import '../helpers/router.dart';

void main() {
  runApp(CoffeeShopApp(
    appRouter: AppRouter(),
  ));
}

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors.purple,
          // ignore: deprecated_member_use
          accentColor: AppColors.purple,
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.purple, centerTitle: true),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style:
                  ElevatedButton.styleFrom(primary: AppColors.secondaryColor2)),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: AppColors.purple)),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
