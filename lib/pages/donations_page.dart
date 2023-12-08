import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/models/donation_data.dart';
import 'package:flutter_application_1/services/donations_service.dart';
import 'package:flutter_application_1/widgets/donate_tile.dart';
import 'package:flutter_application_1/widgets/request_donation.dart';

class DonationsPage extends StatefulWidget {
  const DonationsPage({super.key});

  @override
  DonationsPageState createState() => DonationsPageState();
}

TextStyle myStyle = const TextStyle(color: Colors.white);

class DonationsPageState extends State<DonationsPage> {
  final service = DonationService();
  List<DonationData> list = []; // list of prayers and their dates

  @override
  void initState() {
    super.initState();
    service.fetchList().then((fetchedList) {
      setState(() {
        list = fetchedList.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("${list.length} Donations"),
      ),
      backgroundColor: regnumBrown,
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return DonateTile(list[index]);
        },
      ),
      floatingActionButton: RequestDonation(),
    );
  }
}
