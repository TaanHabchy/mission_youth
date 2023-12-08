// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/pages/donations_page.dart';
import 'package:flutter_application_1/services/donations_service.dart';

// the keyboard needs to be closed
class DoneDonation extends StatelessWidget {
  DoneDonation(
      {super.key,
      required this.donation,
      required this.min,
      required this.max});

  final service = DonationService();

  final String donation;
  final String min;
  final String max;

  get builder => null;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: regnumBrown,
      onPressed: () {
        if (donation != "" && min != "" && max != "") {
          service.insertDonation(donation, min, max);
        } else if (int.parse(min) > int.parse(max)) {
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.black,
                  title: Text(
                    'Minimum cannot be greater than the maximum)',
                    style: myStyle,
                  ),
                  actions: [
                    TextButton(
                        child: Text(
                          'Close',
                          style: myStyle,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                );
              });
        } else {
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.black,
                  title: Text(
                    'Sorry small bug, please close the keyboard before pressing done:)',
                    style: myStyle,
                  ),
                  actions: [
                    TextButton(
                        child: Text(
                          'Close',
                          style: myStyle,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                );
              });
        }
      },
      child: const Text("Done"),
    );
  }
}
