import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/prayer_button.dart';
import 'widgets/donate_button.dart';
import 'colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: regnumBrown,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Viva Christo Rey!"),
            backgroundColor: Colors.black,
          ),
          body: ListView(
            children: const [
              SizedBox(height: 15),
              PrayerButton(),
              SizedBox(height: 15),
              DonateButton(),
            ],
          )),
    );
  }
}
