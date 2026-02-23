import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/reusable_components/header_image.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsManager.radioBack),fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          HeaderImage(),
        ],
      ),
    );
  }
}
