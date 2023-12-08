import 'dart:convert';

import 'package:uuid/uuid.dart';

///
///returns a prayer data object with a prayer and date
class PrayerData {
  PrayerData({
    required this.prayer,
    required this.date,
  });

  final String prayer;
  final String date;

  factory PrayerData.fromJson(Map<String, dynamic> json) {
    return PrayerData(
      prayer: json['prayer'] as String,
      date: json['date'] as String,
    );
  }

  String toJson() {
    final id = const Uuid().v8();
    final data = {
      'id': id,
      'prayer': prayer,
      'date': date,
    };
    return jsonEncode(data);
  }
}
