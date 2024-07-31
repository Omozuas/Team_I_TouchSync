import 'package:flutter/material.dart';
import 'package:touchsync/global-colors/colorsHex.dart';
import 'package:touchsync/views/home_screen/homeScreen.dart';

import 'widget/action_botton.dart';

class ReadTagPage extends StatefulWidget {
  const ReadTagPage({super.key});

  @override
  State<ReadTagPage> createState() => _ReadTagPageState();
}

class _ReadTagPageState extends State<ReadTagPage> {
  @override
  void initState() {
    super.initState();
    // initialize the code with delay once clicked
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
          height: screenHeight / 2,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10),
              Text('Ready to scan'),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/icon.png',
                height: screenHeight / 6,
                width: screenWidth / 4,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Text('Hold your phone steady'),
              SizedBox(height: 20),
              ActionBtn(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                info: Text("Cancel"),
                func: () => Navigator.pop(context),
                btnColor1: GlobalColors.blue,
                btnColor2: GlobalColors.blue,
              ),
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
      body: HomeScreen(),
    );
  }
}
