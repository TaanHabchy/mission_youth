import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/models/prayer_data.dart';
import 'package:flutter_application_1/services/prayer_service.dart';
import 'package:flutter_application_1/widgets/make_prayer.dart';

class PrayersPage extends StatefulWidget {
  const PrayersPage({super.key});

  @override
  PrayersPageState createState() => PrayersPageState();
}

class PrayersPageState extends State<PrayersPage> {
  final service = PrayerService();
  List<PrayerData> list = []; // list of prayers and their dates

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
        title: const Text('Intentions'),
      ),
      backgroundColor: regnumBrown,
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 15),
            color: Colors.black,
            child: Text(
              list[index].prayer,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
      floatingActionButton: MakePrayer(),
    );
  }
}
