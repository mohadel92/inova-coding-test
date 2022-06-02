import 'package:flutter/material.dart';

import '../../data/models/menu_section.dart';
import '../../helpers/app_colors.dart';


class MenuItem extends StatelessWidget {
  const MenuItem({Key? key, this.menuSection, this.onTap}) : super(key: key);

  final MenuSection? menuSection;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.secondaryColor1.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: AppColors.secondaryColor2.withOpacity(0.1), width: 3)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Hero(
                    tag: menuSection?.id ?? "",
                    child: Image.asset(menuSection?.image ?? "")),
              ),
              // const SizedBox(height: 16,),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(0.7),
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20))),
                alignment: Alignment.bottomCenter,
                child: Center(
                    child: Text(
                  menuSection?.name ?? "",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
