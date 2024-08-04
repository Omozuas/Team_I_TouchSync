import 'package:flutter/material.dart';
import 'package:touchsync/global-colors/colorsHex.dart';
import 'package:touchsync/views/home_screen/subscreen/read_tag_screen/widget/action_botton.dart';
import 'widget/sucees_Icon.dart';

class SuccessExchangePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: screenWidth / 5,
                height: screenHeight / 5,
                decoration: BoxDecoration(
                  color: GlobalColors.transparentBlue,
                  shape: BoxShape.circle,
                ),
                child: SuccessIcon(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Contact saved  Successful!y',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 20),
            ActionBtn(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              info: Text("Return to Home"),
              func: () => Navigator.pop(context),
              btnColor1: GlobalColors.blue,
              btnColor2: GlobalColors.blue,
            ),
            SizedBox(height: 20),
            ActionBtn(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              info: Text(
                "Scan more Tags ",
                style: TextStyle(color: GlobalColors.blue),
              ),
              func: () => {},
              btnColor1: GlobalColors.white,
              btnColor2: GlobalColors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
