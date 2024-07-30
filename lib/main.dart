import 'package:flutter/material.dart';
import 'package:touchsync/controller/bottomNavController/bottomNav_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BottomNavigation(),
    );
  }
}
