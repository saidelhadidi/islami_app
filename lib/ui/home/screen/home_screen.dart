import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [QuranTab(), HadethTab(),SebhaTab(),RadioTab(),TimeTab()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorsManager.brown,
          body:IndexedStack(
            index:selectedIndex,
            children: tabs,
          ),
          bottomNavigationBar: NavigationBar(
            labelTextStyle: WidgetStateProperty.all(
              const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            selectedIndex: selectedIndex,
            backgroundColor: ColorsManager.gold,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            indicatorColor: Colors.black.withValues(alpha: 0.2),
            destinations: [
              NavigationDestination(
                selectedIcon: SvgPicture.asset(AssetsManager.sHome),
                icon: SvgPicture.asset(AssetsManager.home),
                label: "Quran",
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(AssetsManager.sHadeth),
                icon: SvgPicture.asset(AssetsManager.hadeth),
                label: "Hadith",
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(AssetsManager.sSebha),
                icon: SvgPicture.asset(AssetsManager.sebha),
                label: "Sebha",
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(AssetsManager.sRadio),
                icon: SvgPicture.asset(AssetsManager.radio),
                label: "Radio",
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(AssetsManager.sTime),
                icon: SvgPicture.asset(AssetsManager.time),
                label: "Time",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
