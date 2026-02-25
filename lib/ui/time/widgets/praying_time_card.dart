import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islami_app/model/prayer_time_data.dart';
import 'package:islami_app/ui/time/widgets/prayer_time_item.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/size_manager.dart';

class PrayingTimeCard extends StatelessWidget {
  const PrayingTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: SizeManager.getScreenHeight(context) * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: ColorsManager.clayBrown,
        image: DecorationImage(
          image: AssetImage(AssetsManager.prayingTimeBackGround),
          fit: BoxFit.cover,
        ),
      ),

      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: constraints.maxHeight * 0.24,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8,right: 8,left: 8),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 15,
                        child: Text(
                          textAlign: TextAlign.center,
                          "16 Jul,\n2024",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.white,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Column(
                            spacing: 5,
                            children: [
                              Text(
                                "Pray Time",
                                style: TextStyle(
                                  color: ColorsManager.brown.withValues(
                                    alpha: 0.7,
                                  ),
                                ),
                              ),
                              Text(
                                "Sunday",
                                style: TextStyle(
                                  color: ColorsManager.brown.withValues(
                                    alpha: 0.9,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 15,
                        child: Text(
                          textAlign: TextAlign.center,
                          "09 Muh,\n1446",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              CarouselSlider.builder(
                itemCount: PrayerData.prayers.length,
                itemBuilder:
                    (BuildContext context, int index, int realIndex) {
                      return PrayerTimeItem(
                        prayer: PrayerData.prayers[index],
                      );
                    },
                options: CarouselOptions(
                  height: constraints.maxHeight*0.5,
                  viewportFraction: 0.28,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  enlargeFactor: 0.18,
                  initialPage: 2,
                  enableInfiniteScroll: false,
                  scrollPhysics: const BouncingScrollPhysics(),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.volume_up,
                          color: ColorsManager.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Next Pray",
                              style: TextStyle(
                                color: ColorsManager.brown.withValues(
                                  alpha: 0.7,
                                ),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: " - 02:32",
                              style: TextStyle(
                                color: ColorsManager.brown.withValues(
                                  alpha: 0.9,
                                ),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
