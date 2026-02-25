import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/size_manager.dart';

class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch({super.key, required this.isRadioSelected, required this.onTab});
  final bool isRadioSelected;
  final void Function(bool) onTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeManager.getScreenHeight(context) * 0.04,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsManager.black.withValues(alpha: 0.5),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            alignment: Alignment.center,
            children: [
              AnimatedAlign(
                alignment: isRadioSelected
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                duration: Duration(milliseconds: 200),
                child: Container(
                  width: constraints.maxWidth / 2,
                  decoration: BoxDecoration(
                    color: ColorsManager.gold,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                       onTab(true);
                      },
                      child: Text(
                        textAlign: TextAlign.center,
                        "Radio",
                        style: TextStyle(
                          color: isRadioSelected?ColorsManager.black:ColorsManager.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                      onTab(false);
                      },
                      child: Text(
                        textAlign: TextAlign.center,
                        "Reciters",
                        style: TextStyle(
                          color: isRadioSelected?ColorsManager.white:ColorsManager.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
