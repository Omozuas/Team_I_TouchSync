import 'package:flutter/material.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
