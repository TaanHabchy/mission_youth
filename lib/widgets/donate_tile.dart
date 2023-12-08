import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/donation_data.dart';
import 'package:flutter_application_1/pages/donations_page.dart';

class DonateTile extends StatefulWidget {
  const DonateTile(this.donationData, {super.key});

  final DonationData donationData;
  @override
  State<DonateTile> createState() => _DonateTileState();
}

class _DonateTileState extends State<DonateTile> {
  IconData leadIcon = Icons.square_outlined;

  Text supplied = Text('Tap to supply items', style: myStyle);

  @override
  void initState() {
    super.initState();
    supplied = Text(
        'Tap to supply ${widget.donationData.min} - ${widget.donationData.max} items',
        style: myStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: ListTile(
        leading: Icon(
          leadIcon,
          color: Colors.white,
        ),
        title: Text(widget.donationData.donation, style: myStyle),
        subtitle: supplied,
        onTap: () {
          setState(() {
            if (leadIcon == Icons.square_outlined) {
              leadIcon = Icons.check_box;
              supplied = Text('Supplied', style: myStyle);
            } else {
              leadIcon = Icons.square_outlined;
              supplied = Text(
                  'Tap to supply ${widget.donationData.min} - ${widget.donationData.max} items',
                  style: myStyle);
            }
          });
        },
      ),
    );
  }
}
