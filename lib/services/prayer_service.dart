// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter_application_1/models/prayer_data.dart';
import 'package:flutter_application_1/models/prayer_list.dart';
import 'package:http/http.dart' as http;

//Swagger: https://api.restpoint.io/doc-runs?docId=SwaggerUI&x-endpoint-key=b20cf86d62b1491a8fc3b610a7459074
//JSON:    https://api.restpoint.io/api/prayers?docId=SwaggerUI&x-endpoint-key=b20cf86d62b1491a8fc3b610a7459074

class PrayerService {
  final urlString = 'https://api.restpoint.io/api/prayers';
  final endpointKey = 'b20cf86d62b1491a8fc3b610a7459074';
  final headerKey = 'x-endpoint-key';

  Future<void> insertPrayer(String myPrayer, String myDate) async {
    final prayerData = PrayerData(prayer: myPrayer, date: myDate);
    print('Prayer is $myPrayer');
    print('date is: $myDate');
    final body = prayerData.toJson();
    final response = await http.post(
      Uri.parse(urlString),
      headers: {
        headerKey: endpointKey,
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: body,
    );
    if (response.statusCode != 200) {
      throw (Exception('failed to insert ${response.statusCode}'));
    }
  }

  Future<PrayerList> fetchList() async {
    final response = await http.get(Uri.parse(urlString), headers: {
      headerKey: endpointKey,
    });
    if (response.statusCode != 200) {
      throw Exception('failed to fetch ${response.statusCode}');
    }
    final jsonBody = response.body;
    final json = jsonDecode(jsonBody);
    return PrayerList.fromFullJson(json);
  }
}
