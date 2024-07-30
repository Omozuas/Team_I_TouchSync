import 'package:get/get.dart';
import 'package:touchsync/views/history_screen/historyScreen.dart';
import 'package:touchsync/views/home_screen/homeScreen.dart';
import 'package:touchsync/views/homescree1.dart';
import 'package:touchsync/views/profile%20screen/profile_screen.dart';

class BottomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    HomeScreen(),
    HomeScreen1(),
    HistoryScreen(),
    ProfileScreen(),
  ];
}
