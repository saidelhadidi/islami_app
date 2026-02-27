import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/reusable_components/header_image.dart';
import 'package:islami_app/model/landing_data.dart';
import 'package:islami_app/ui/home/screen/home_screen.dart';
import 'package:islami_app/ui/landing/widget/landing_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingScreen extends StatefulWidget {
  static const String routeName = "landing_screen";

  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.brown,
      body: SafeArea(
        child: Column(
          children: [
            HeaderImage(),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) {
                  return LandingItem(screenDate: LandingData.landingPages[index]);
                },
                itemCount: LandingData.landingPages.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.pressed)) {
                          return ColorsManager.gold.withValues(alpha: 0.2);
                        }
                        return null;
                      }),
                    ),
                    onPressed: () async {
                      if (currentIndex > 0) {
                        pageController.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          HomeScreen.routeName,
                        );
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool('isFirstTime', false);
                      }
                    },
                    child: Text(
                      currentIndex > 0 ? "Back" : "Skip",
                      style: TextStyle(
                        color: ColorsManager.gold,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: LandingData.landingPages.length,
                    effect: WormEffect(activeDotColor: ColorsManager.gold),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.pressed)) {
                          return ColorsManager.gold.withValues(alpha: 0.2);
                        }
                        return null;
                      }),
                    ),

                    onPressed: () async {
                      if (currentIndex < LandingData.landingPages.length - 1) {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          HomeScreen.routeName,
                        );
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool('isFirstTime', false);
                      }
                    },
                    child: Text(
                      currentIndex == LandingData.landingPages.length - 1
                          ? "Finish"
                          : "Next",
                      style: TextStyle(
                        color: ColorsManager.gold,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
