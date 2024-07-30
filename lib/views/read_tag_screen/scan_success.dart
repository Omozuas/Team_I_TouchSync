import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:touchsync/global-colors/colorsHex.dart';

import '../home_screen/homeScreen.dart';
import 'widget/sucees_Icon.dart';

class ReadTagSuccessPage extends StatefulWidget {
  const ReadTagSuccessPage({super.key});

  @override
  State<ReadTagSuccessPage> createState() => _ReadTagSuccessPageState();
}

class _ReadTagSuccessPageState extends State<ReadTagSuccessPage> {
  @override
  void initState() {
    super.initState();
    // init the function on navigation with a popup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showHalfScreenPopup(context);
    });
  }

  void _showHalfScreenPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final mediaQuery = MediaQuery.of(context);
        final screenHeight = mediaQuery.size.height;
        final screenWidth = mediaQuery.size.width;

        return Container(
          width: screenWidth,
          height: screenHeight / 3,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: screenWidth / 5,
                height: screenHeight / 5,
                decoration: BoxDecoration(
                  color: GlobalColors.transparentBlue,
                  shape: BoxShape.circle,
                ),
                child: SuccessIcon(),// widget for success screen 
              ),
              Text('Scan Successful'),
            ],
          ),
        );
      },
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("overrides the home screen"),
    );
  }
}
