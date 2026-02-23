import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/hadeth_model.dart';
import 'package:islami_app/ui/hadeth_item/hadeth_details.dart';

class HadethItem extends StatelessWidget {
  const HadethItem({super.key, required this.hadeth});

  final HadethModel hadeth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.routeName,arguments: hadeth);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.gold,
        ),

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: Row(
                children: [
                  Image.asset(
                    AssetsManager.leftCorner,
                    color: ColorsManager.black,
                  ),

                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      hadeth.title,
                      style: TextStyle(
                        color: ColorsManager.brown,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image.asset(
                    AssetsManager.rightCorner,
                    color: ColorsManager.black,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        AssetsManager.hadethCardBack,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      AssetsManager.hadethCardBottom,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          hadeth.content,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.brown,

                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
