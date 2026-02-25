import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/model/zikr_model.dart';

class ZikrData {
  static List<ZikrModel> azkar = [
    ZikrModel(title: "Evening Azkar", image: AssetsManager.eveningZikr),
    ZikrModel(title: "Morning Azkar", image: AssetsManager.morningZikr),
    ZikrModel(title: "Waking Azkar", image: AssetsManager.wakingZikr),
    ZikrModel(title: "Sleeping Azkar", image:AssetsManager.sleepingZikr),
  ];
}
