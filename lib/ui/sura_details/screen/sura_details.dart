import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/sura_model.dart';

class SuraDetails extends StatelessWidget {
  const SuraDetails({super.key});

  static const String routeName = "sura_details";

  @override
  Widget build(BuildContext context) {

    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;

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
          style: TextStyle(color: ColorsManager.gold,fontWeight: FontWeight.bold),
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
                       style: TextStyle(color: ColorsManager.gold, fontSize: 26,fontWeight: FontWeight.bold),
                     ),
                     Image.asset(AssetsManager.rightCorner),
                   ],
                 ),
                 Expanded(
                   child: SingleChildScrollView(
                     child: Text(
                       "يَا أَيُّهَا النَّاسُ اتَّقُوا رَبَّكُمُ الَّذِي خَلَقَكُم مِّن نَّفْسٍ وَاحِدَةٍ وَخَلَقَ مِنْهَا زَوْجَهَا وَبَثَّ مِنْهُمَا رِجَالًا كَثِيرًا وَنِسَاءً ۚ وَاتَّقُوا اللَّهَ الَّذِي تَسَاءَلُونَ بِهِ وَالْأَرْحَامَ ۚ إِنَّ اللَّهَ كَانَ عَلَيْكُمْ رَقِيبًا (1) وَآتُوا الْيَتَامَىٰ أَمْوَالَهُمْ ۖ وَلَا تَتَبَدَّلُوا الْخَبِيثَ بِالطَّيِّبِ ۖ وَلَا تَأْكُلُوا أَمْوَالَهُمْ إِلَىٰ أَمْوَالِكُمْ ۚ إِنَّهُ كَانَ حُوبًا كَبِيرًا (2) وَإِنْ خِفْتُمْ أَلَّا تُقْسِطُوا فِي الْيَتَامَىٰ فَانكِحُوا مَا طَابَ لَكُم مِّنَ النِّسَاءِ مَثْنَىٰ وَثُلَاثَ وَرُبَاعَ ۖ فَإِنْ خِفْتُمْ أَلَّا تَعْدِلُوا فَوَاحِدَةً أَوْ مَا مَلَكَتْ أَيْمَانُكُمْ ۚ ذَٰلِكَ أَدْنَىٰ أَلَّا تَعُولُوا (3) وَآتُوا النِّسَاءَ صَدُقَاتِهِنَّ نِحْلَةً ۚ فَإِن طِبْنَ لَكُمْ عَن شَيْءٍ مِّنْهُ نَفْسًا فَكُلُوهُ هَنِيئًا مَّرِيئًا (4) وَلَا تُؤْتُوا السُّفَهَاءَ أَمْوَالَكُمُ الَّتِي جَعَلَ اللَّهُ لَكُمْ قِيَامًا وَارْزُقُوهُمْ فِيهَا وَاكْسُوهُمْ وَقُولُوا لَهُمْ قَوْلًا مَّعْرُوفًا (5)",
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
