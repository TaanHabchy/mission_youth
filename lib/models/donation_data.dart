import 'dart:convert';
import 'package:uuid/uuid.dart';

class DonationData {
  DonationData({
    required this.donation,
    required this.min,
    required this.max,
  });
  final String donation;
  final String min;
  final String max;

  factory DonationData.fromJson(Map<String, dynamic> json) {
    return DonationData(
      donation: json['donation'] as String,
      min: json['min'] as String,
      max: json['max'] as String,
    );
  }

  String toJson() {
    final id = const Uuid().v8();
    final data = {
      'id': id,
      'donation': donation,
      'min': min,
      'max': max,
    };
    return jsonEncode(data);
  }
}
