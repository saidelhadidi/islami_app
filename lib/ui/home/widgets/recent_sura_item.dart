import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/sura_model.dart';

import '../../sura_details/screen/sura_details.dart';

class RecentSuraItem extends StatelessWidget {
  final SuraModel suraModel;
  final void Function (SuraModel) onRecentSuraTab;
  const RecentSuraItem({required this.onRecentSuraTab, super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetails.routeName,
          arguments: suraModel,
        );
        onRecentSuraTab(suraModel);

      },
      child: Container(
        height: 150,
        width: 290,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      suraModel.eName,
                      style: TextStyle(color: ColorsManager.brown, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      suraModel.aName,
                      style: TextStyle(color: ColorsManager.brown, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "${suraModel.verses} Verses",
                    style: TextStyle(color: ColorsManager.brown, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Image.asset(AssetsManager.quranSura,fit: BoxFit.fill,),
          ],
        ),
      ),
    );
  }
}
