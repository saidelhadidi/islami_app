import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/ui/hadeth_item/hadeth_details.dart';
import 'package:islami_app/ui/home/screen/home_screen.dart';
import 'package:islami_app/ui/landing/screen/landing_screen.dart';
import 'package:islami_app/ui/sura_details/screen/sura_details.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirstTime});
  final bool isFirstTime;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Janna LT',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorsManager.offWhite,
        ),
      ),
      title: "Islami",
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetails.routeName:(_) => HadethDetails(),
        LandingScreen.routeName:(_) => LandingScreen(),
      },
      initialRoute: isFirstTime? LandingScreen.routeName : HomeScreen.routeName ,
      debugShowCheckedModeBanner: false,
    );
  }
}
