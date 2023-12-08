// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/pages/donations_page.dart';
import '../services/prayer_service.dart';

// the keyboard needs to be closed
class DonePrayer extends StatelessWidget {
  DonePrayer({super.key, required this.prayer, required this.date});

  final service = PrayerService();

  final String prayer;
  final String date;

  get builder => null;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: regnumBrown,
      onPressed: () {
        if (prayer != "" && date != "") {
          service.insertPrayer(prayer, date);
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
