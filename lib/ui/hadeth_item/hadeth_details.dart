import 'package:flutter/material.dart';
import 'package:islami_app/model/hadeth_data.dart';
import 'package:islami_app/model/hadeth_model.dart';
import '../../core/resources/assets_manager.dart';
import '../../core/resources/colors_manager.dart';

class HadethDetails extends StatelessWidget {
  const HadethDetails({super.key});

  static const String routeName = "hadeth_details";

  @override
  Widget build(BuildContext context) {
    HadethModel hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethModel;
    int index = HadethData.hadethList.indexOf(hadeth);
    return Scaffold(
      backgroundColor: ColorsManager.brown,
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: ColorsManager.gold),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Hadeth ${index + 1} ",
          style: TextStyle(
            color: ColorsManager.gold,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.leftCorner),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          hadeth.title,
                          style: TextStyle(
                            color: ColorsManager.gold,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Image.asset(AssetsManager.rightCorner),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadeth.content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 2.5,
                          color: ColorsManager.gold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.bottom),
        ],
      ),
    );
  }
}
