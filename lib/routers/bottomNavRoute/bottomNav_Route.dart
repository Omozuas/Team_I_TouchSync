import 'package:get/get.dart';
import 'package:touchsync/views/contact_screen/contactScreen.dart';
import 'package:touchsync/views/history_screen/historyScreen.dart';
import 'package:touchsync/views/home_screen/homeScreen.dart';
import 'package:touchsync/views/homescree1.dart';

import 'package:touchsync/views/profile%20screen/profile_screen.dart';

class BottomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    HomeScreen(),
    ContactScreen(),
    // HomeScreen1(),
    HistoryScreen(),
    ProfileScreen(),
  ];
}
