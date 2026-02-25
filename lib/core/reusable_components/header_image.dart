import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/size_manager.dart';

import '../resources/assets_manager.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset(
          AssetsManager.screenHeader,
          width: SizeManager.getScreenWidth(context) * 0.75,
        ),
      ),
    );
  }
}
