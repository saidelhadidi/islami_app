import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

import '../../../core/resources/size_manager.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({
    super.key,
    required this.title,
    required this.isPlayed,
    required this.onPlay,
  });

  final String title;
  final bool isPlayed;
  final void Function(bool) onPlay;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: SizeManager.getScreenHeight(context) * 0.14,
        decoration: BoxDecoration(
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            opacity: 0.4,
            alignment: Alignment.bottomCenter,
            image: isPlayed
                ? AssetImage(AssetsManager.radioPlay)
                : AssetImage(AssetsManager.radioStop),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: ColorsManager.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 45),

                  GestureDetector(
                    onTap: () {
                      onPlay(!isPlayed);
                    },
                    child: Icon(
                      isPlayed ? Icons.pause : Icons.play_arrow_sharp,
                      size: 50,
                      color: ColorsManager.black,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    isPlayed ? Icons.volume_up : Icons.volume_off,
                    size: 30,
                    color: ColorsManager.black,
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
