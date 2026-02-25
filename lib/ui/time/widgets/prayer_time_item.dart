import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/prayer_item_model.dart';

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({super.key, required this.prayer});

  final PrayerItemModel prayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [ColorsManager.brown, ColorsManager.brown.withValues(alpha: 0.3),],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: ColorsManager.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(prayer.prayerName),
            Text(prayer.prayerTime, style: TextStyle(fontSize: 30),),
            Text(prayer.amPm),
          ],
        ),
      ),
    );
  }
}
