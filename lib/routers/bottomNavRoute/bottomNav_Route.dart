import 'package:get/get.dart';
import 'package:touchsync/views/home_screen/homeScreen.dart';

class BottomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    HomeScreen(),
  ];
}
