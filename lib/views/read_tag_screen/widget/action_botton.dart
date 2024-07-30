import 'package:flutter/material.dart';
import 'package:touchsync/global-colors/colorsHex.dart';

class ActionBtn extends StatelessWidget {
  const ActionBtn({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.info,
    required this.func,
    required this.btnColor1,
    required this.btnColor2,
  });

  final double screenWidth;
  final double screenHeight;
  final Text info;
  final btnColor1;
  final btnColor2;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight / 12,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: btnColor1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: btnColor2, width: 2),
          ),
        ),
        onPressed: func,
        child: info,
      ),
    );
  }
}
