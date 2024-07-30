import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:touchsync/global-colors/colorsHex.dart';
import 'package:touchsync/views/read_tag_screen/scan_success.dart';

import '../home_screen/homeScreen.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showHalfScreenPopup(context);
    });
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReadTagSuccessPage(),
        ),
      );
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
          height: screenHeight / 1.8,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10),
              Text('Ready to scan', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/icon.png',
                height: screenHeight / 6,
                width: screenWidth / 4,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Text('Hold your phone steady', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              ActionBtn(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                info: Text("Cancel", style: TextStyle(color: Colors.white)),
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
      body: Text("from Home"),
    );
  }
}
