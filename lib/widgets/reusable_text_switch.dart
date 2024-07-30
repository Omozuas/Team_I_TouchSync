import 'package:flutter/material.dart';
import 'package:touchsync/global-colors/colorsHex.dart';

class ReusableTextSwitch extends StatefulWidget {
  final String text;

  const ReusableTextSwitch({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  _ReusableTextSwitchState createState() => _ReusableTextSwitchState();
}

class _ReusableTextSwitchState extends State<ReusableTextSwitch> {
  bool _isToggled = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _isToggled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Switch(
          value: _isToggled,
          onChanged: _toggleSwitch,
          activeColor:Colors.white,
                activeTrackColor:  GlobalColors.teal,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: GlobalColors.inactive, 
        ),
      ],
    );
  }
}
