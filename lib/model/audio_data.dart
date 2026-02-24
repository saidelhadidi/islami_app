import 'package:islami_app/model/audio_model.dart';

abstract class AudioData {
  static List<AudioModel> radio = [
    AudioModel(title: "إذاعة القرآن الكريم من القاهرة"),
    AudioModel(title: "إذاعة السنة النبوية"),
    AudioModel(title: "إذاعة التلاوات الخاشعة"),
    AudioModel(title: "إذاعة الفتاوى"),
    AudioModel(title: "إذاعة تفسير القرآن"),
  ];

  static List<AudioModel> recites = [

    AudioModel(title: "الشيخ عبد الباسط عبد الصمد"),
    AudioModel(title: "الشيخ محمد صديق المنشاوي"),
    AudioModel(title: "الشيخ محمود خليل الحصري"),
    AudioModel(title: "الشيخ مشاري راشد العفاسي"),
    AudioModel(title: "الشيخ ياسر الدوسري"),
    AudioModel(title: "الشيخ ماهر المعيقلي"),
    AudioModel(title: "الشيخ عبد الرحمن السديس"),
  ];
}
