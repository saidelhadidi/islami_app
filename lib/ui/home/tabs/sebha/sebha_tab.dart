import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/resources/size_managers.dart';
import 'package:islami_app/core/reusable_components/header_image.dart';
import 'package:islami_app/model/azkar_data.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int currentIndex = 0;
  double turns = 0.0;

  void onSebhaClick() {
    setState(() {
      counter++;
      if (counter == AzkarData.azkar[currentIndex].target) {
        counter = 0;
        currentIndex++;
      }
      if (currentIndex == AzkarData.azkar.length) {
        currentIndex = 0;
      }
      turns += 1 / 33;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBack),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          HeaderImage(),
          SizedBox(
            height: SizeManagers.getScreenHeight(context) * 0.1,
            width: SizeManagers.getScreenHeight(context) * 0.8,
            child: Center(
              child: Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                style: TextStyle(
                  color: ColorsManager.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          InkWell(
              onTap: (){
                setState(() {
                  counter=0;
                  turns=0;
                });
              },
              onDoubleTap: (){setState(() {
                counter=0;
                turns=0;
               if(currentIndex==AzkarData.azkar.length-1){
                 currentIndex=0;
               }else{
                 currentIndex++;
               }
              });},
              child: Image.asset(AssetsManager.sebhaHead, scale: 4)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Stack(
              alignment: Alignment.center,
              children: [
                InkWell(
                  onTap: () {
                    onSebhaClick();
                  },
                  child: AnimatedRotation(
                    turns: turns,
                    duration: Duration(milliseconds: 200),
                    child: Image.asset(
                      alignment: Alignment.center,
                      AssetsManager.sebhaBody,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 20,
                  children: [
                    Text(
                      AzkarData.azkar[currentIndex].zekrName,
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      counter.toString(),
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
