import 'package:flutter_application_1/models/donation_data.dart';

class DonationList {
  DonationList(this.data);

  final List<DonationData> data;

  factory DonationList.fromJson(List<dynamic> json) {
    final list = json;
    final mapped =
        list.map((e) => DonationData.fromJson(e as Map<String, dynamic>));
    final retList = mapped.toList();
    return DonationList(retList);
  }

  factory DonationList.fromFullJson(dynamic json) {
    // final jsonMap = json as Map<String, dynamic>;
    final list = json['data'] as List<dynamic>;
    return DonationList.fromJson(list);
  }
}
