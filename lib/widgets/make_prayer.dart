// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/done_prayer.dart';

///Prayer
///Date

class MakePrayer extends StatelessWidget {
  MakePrayer({super.key});

  TextEditingController prayerController = TextEditingController();
  TextEditingController dateController = TextEditingController();

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
                      controller: prayerController,
                      decoration: const InputDecoration(
                        label: Text("Prayer Intention"),
                      ),
                    ),
                    TextField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        label: Text("Date"),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    DonePrayer(
                      prayer: prayerController.text,
                      date: dateController.text,
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
