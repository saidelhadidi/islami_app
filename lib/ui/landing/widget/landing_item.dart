import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/model/landing_model.dart';

class LandingItem extends StatelessWidget {
  const LandingItem({super.key, required this.screenDate});

  final LandingModel screenDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(screenDate.image)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Text(
                screenDate.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorsManager.gold,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (screenDate.subTitle.isNotEmpty)
                Text(
                  textAlign: TextAlign.center,
                  screenDate.subTitle,
                  style: TextStyle(
                    color: ColorsManager.gold,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
