// import 'dart:convert';

import 'package:flutter_application_1/models/prayer_data.dart';

class PrayerList {
  PrayerList(this.data);

  final List<PrayerData> data;

  factory PrayerList.fromJson(List<dynamic> json) {
    final list = json;
    final mapped =
        list.map((e) => PrayerData.fromJson(e as Map<String, dynamic>));
    final retList = mapped.toList();
    return PrayerList(retList);
  }

  factory PrayerList.fromFullJson(dynamic json) {
    // final jsonMap = json as Map<String, dynamic>;
    final list = json['data'] as List<dynamic>;
    return PrayerList.fromJson(list);
  }
}
