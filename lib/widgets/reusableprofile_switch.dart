import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/global-colors/colorsHex.dart';

class ReusableProfileSwitch extends StatefulWidget {
  final String text;
  final String url;
  bool isToggled;
  ReusableProfileSwitch({
    Key? key,
    required this.text,
    required this.url,
    required this.isToggled,
  }) : super(key: key);

  @override
  _ReusableProfileSwitchState createState() => _ReusableProfileSwitchState();
}

class _ReusableProfileSwitchState extends State<ReusableProfileSwitch> {
  void _toggleSwitch(bool value) {
    setState(() {
      widget.isToggled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              widget.url,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              widget.text,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: const Color(0xff111827),
                height: 1.2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Switch(
          value: widget.isToggled,
          onChanged: _toggleSwitch,
          activeColor: Colors.white,
          activeTrackColor: GlobalColors.teal,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: GlobalColors.inactive,
        ),
      ],
    );
  }
}
