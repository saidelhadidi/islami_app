import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/ui/sura_details/screen/sura_details.dart';

class SurasItem extends StatelessWidget {
  final SuraModel suraModel;
  final void Function(SuraModel) onSuraTap;

  const SurasItem({super.key, required this.suraModel, required this.onSuraTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            SuraDetails.routeName,
            arguments: suraModel,
          );
          onSuraTap(suraModel);
        },
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AssetsManager.suraNumberFrame, scale: 4),
                Text(
                  "${suraModel.number}",
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraModel.eName,
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${suraModel.verses} Verses",
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Spacer(flex: 1),
            Text(
              suraModel.aName,
              style: TextStyle(
                color: ColorsManager.white,
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
