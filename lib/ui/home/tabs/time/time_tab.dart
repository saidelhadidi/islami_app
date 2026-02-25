import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/zikr_data.dart';
import 'package:islami_app/ui/time/widgets/praying_time_card.dart';
import 'package:islami_app/ui/time/widgets/zikr_item.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/reusable_components/header_image.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.timeBack),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            HeaderImage(),
            PrayingTimeCard(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Azkar",
                  style: TextStyle(
                    color: ColorsManager.offWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(top: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.65,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: ZikrData.azkar.length,
                itemBuilder: (context, index) {
                  return ZikrItem(zikr: ZikrData.azkar[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
