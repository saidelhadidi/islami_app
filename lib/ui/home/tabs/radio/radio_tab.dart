import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/reusable_components/header_image.dart';
import 'package:islami_app/model/audio_data.dart';
import 'package:islami_app/ui/home/widgets/toggle_switch.dart';

import '../../../radio/widget/radio_item.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool isRadioSelected = true;
  int? playingIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.radioBack),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            HeaderImage(),
            SizedBox(height: 10),
            ToggleSwitch(
              isRadioSelected: isRadioSelected,
              onTab: (bool value) {
                setState(() {
                  isRadioSelected = value;
                  playingIndex=null;
                });
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: isRadioSelected
                  ? ListView.separated(
                      padding: EdgeInsets.only(top: 20),
                      itemCount: AudioData.radio.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15),
                      itemBuilder: (context, index) {
                        return RadioItem(
                          title:AudioData.radio[index].title,
                          isPlayed: playingIndex == index ,
                          onPlay: (isPlayed) {
                            setState(() {
                              if (isPlayed) {
                                playingIndex = index;
                              } else {
                                playingIndex = null;
                              }
                            });
                          },
                        );
                      },
                    )
                  : ListView.separated(
                      padding: EdgeInsets.only(top: 20),
                      itemCount: AudioData.recites.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15),
                      itemBuilder: (context, index) {
                        return RadioItem(
                          title: AudioData.recites[index].title,
                          isPlayed: playingIndex == index,
                          onPlay: (isPlayed) {
                            setState(() {
                              if (isPlayed) {
                                playingIndex = index;
                              } else {
                                playingIndex = null;
                              }
                            });
                          },
                        );
                      },
                    ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
