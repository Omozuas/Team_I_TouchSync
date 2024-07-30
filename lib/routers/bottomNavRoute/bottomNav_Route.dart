import 'package:get/get.dart';
import 'package:touchsync/views/home_screen/homeScreen.dart';
import 'package:touchsync/views/profile%20screen/profile_screen.dart';

class BottomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    HomeScreen(),
    ProfileScreen(),
  ];
}
