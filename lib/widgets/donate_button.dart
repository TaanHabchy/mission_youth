// Will take you to the donations page
import 'package:flutter/material.dart';
import '../pages/donations_page.dart';

class DonateButton extends StatelessWidget {
  const DonateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 25),
        backgroundColor: Colors.black);

    return Center(
      child: ElevatedButton(
          style: style,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DonationsPage()));
          },
          child: const Text('Donations Page')),
    );
  }
}
