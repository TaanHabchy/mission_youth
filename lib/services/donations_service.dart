import 'dart:convert';
import 'package:flutter_application_1/models/donation_data.dart';
import 'package:flutter_application_1/models/donation_list.dart';
import 'package:http/http.dart' as http;

//Swagger: https://api.restpoint.io/doc-runs?projectId=75fee493-c544-43e5-acd2-a73266b24025&docId=SwaggerUI&x-api-key=0fb67a538e564c5d810e414ee88c156c&pathId=05aa7b69-4f73-4257-a839-7d5028fdbc70#/donations/post-donations
//JSON:

class DonationService {
  final urlString = 'https://api.restpoint.io/api/donations';
  final endpointKey = '69d536246db54bf49ed09457edcf1e5d';
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
