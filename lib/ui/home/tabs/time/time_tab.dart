import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/reusable_components/header_image.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsManager.timeBack),fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          HeaderImage(),
        ],
      ),
    );
  }
}
