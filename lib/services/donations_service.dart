import 'dart:convert';
import 'package:flutter_application_1/models/donation_data.dart';
import 'package:flutter_application_1/models/donation_list.dart';
import 'package:http/http.dart' as http;

//Swagger: https://api.restpoint.io/doc-runs?docId=SwaggerUI&x-endpoint-key=69d536246db54bf49ed09457edcf1e5d
//JSON:    https://api.restpoint.io/api/donations?docId=SwaggerUI&x-endpoint-key=69d536246db54bf49ed09457edcf1e5d

class DonationService {
  final urlString = 'https://api.restpoint.io/api/donations';
  final endpointKey = '9d159a23e43b4992bd17a0186f43ac62';
  final headerKey = 'x-endpoint-key';

  Future<void> insertDonation(String donation, String min, String max) async {
    final donationData = DonationData(donation: donation, min: min, max: max);
    final body = donationData.toJson();
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

  Future<DonationList> fetchList() async {
    final response = await http.get(Uri.parse(urlString), headers: {
      headerKey: endpointKey,
    });
    if (response.statusCode != 200) {
      throw Exception('failed to fetch ${response.statusCode}');
    }
    final jsonBody = response.body;
    final json = jsonDecode(jsonBody);
    return DonationList.fromFullJson(json);
  }
}
