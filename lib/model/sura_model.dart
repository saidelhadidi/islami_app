import 'package:islami_app/model/sura_data.dart';

class SuraModel {
  final int number;
  final String eName;
  final String aName;
  final int verses;

  SuraModel({
    required this.number,
    required this.eName,
    required this.aName,
    required this.verses,
  });

  // getSuraList(){
  //   for(int i=0; i<)
  // }

  static List<SuraModel> getSuraList() {
    return [
      for (int i = 0; i < SuraData.dataLength; i++)
        SuraModel(
          number: i + 1,
          eName: SuraData.englishNames[i],
          aName: SuraData.arabicNames[i],
          verses: SuraData.versesNumber[i],
        ),
    ];
  }
}
