// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/done_donation.dart';

///Prayer
///Date

class RequestDonation extends StatelessWidget {
  RequestDonation({super.key});

  TextEditingController donationController = TextEditingController();
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(bottom: 20)),
                    TextField(
                      controller: donationController,
                      decoration: const InputDecoration(
                        label: Text("Specific Donation"),
                      ),
                    ),
                    TextField(
                      controller: minController,
                      decoration: const InputDecoration(
                        label: Text("Minimum Amount"),
                      ),
                    ),
                    TextField(
                      controller: maxController,
                      decoration: const InputDecoration(
                        label: Text("Maximum Amount"),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    DoneDonation(
                      donation: donationController.text,
                      min: minController.text,
                      max: maxController.text,
                    ),
                  ],
                ),
              );
            });
      },
      child: const Padding(
          padding: EdgeInsets.all(15),
          child: Icon(
            Icons.edit_sharp,
            color: Colors.black,
          )),
    );
  }
}
