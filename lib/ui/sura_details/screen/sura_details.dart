import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/sura_model.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  static const String routeName = "sura_details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];
  Future<void> readFile(int suraNumber) async {
    String sureTextFile = await rootBundle.loadString(
      "assets/suras/$suraNumber.txt",
    );
    verses = sureTextFile.split("\n");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      readFile(suraModel.number);
    }
    return Scaffold(
      backgroundColor: ColorsManager.brown,
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: ColorsManager.gold),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          suraModel.eName,
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
                      Text(
                        suraModel.aName,
                        style: TextStyle(
                          color: ColorsManager.gold,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(AssetsManager.rightCorner),
                    ],
                  ),
                  Expanded(
                    child: verses.isEmpty
                        ? Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.gold,
                      ),
                    )
                        : SingleChildScrollView(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            for (int i = 0; i < verses.length; i++) ...[
                              TextSpan(
                                text: verses[i],
                                style: TextStyle(
                                  color: ColorsManager.gold,
                                  fontSize: 24,
                                  height: 2.5,
                                ),
                              ),
                              TextSpan(
                                text: "[${i + 1}] ",
                                style: TextStyle(
                                  color: ColorsManager.offWhite,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]
                          ],
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
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
