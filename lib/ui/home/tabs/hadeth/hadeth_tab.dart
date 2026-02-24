import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islami_app/core/reusable_components/header_image.dart';
import 'package:islami_app/model/hadeth_data.dart';
import 'package:islami_app/ui/hadeth_item/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsManager.hadethBack,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Column(
            children: [
              HeaderImage(),
              Expanded(
                child: CarouselSlider(
                  items: HadethData.hadethList
                      .map((model) => HadethItem(hadeth: model))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    aspectRatio: 0.7,
                    enlargeCenterPage: true,
                    viewportFraction: 0.75,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
