import 'package:islami_app/model/prayer_item_model.dart';

class PrayerData {
  static List<PrayerItemModel> prayers = [
    PrayerItemModel(prayerName: "Fajr", prayerTime: "05:00", amPm: "AM"),
    PrayerItemModel(prayerName: "Sunrise", prayerTime: "06:25", amPm: "AM"),
    PrayerItemModel(prayerName: "Dhuhr", prayerTime: "12:05", amPm: "PM"),
    PrayerItemModel(prayerName: "Asr", prayerTime: "03:20", amPm: "PM"),
    PrayerItemModel(prayerName: "Maghrib", prayerTime: "05:50", amPm: "PM"),
    PrayerItemModel(prayerName: "Isha", prayerTime: "07:10", amPm: "PM"),
  ];
}