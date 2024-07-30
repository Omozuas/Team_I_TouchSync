import 'package:flutter/material.dart';
import 'package:touchsync/controller/bottomNavController/bottomNav_controller.dart';

import 'views/read_tag_screen/exchange_contact_page.dart';
import 'views/read_tag_screen/read_tag_screen.dart';
import 'views/read_tag_screen/scan_success.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReadTagPage(), //const BottomNavigation(),
    );
  }
}
