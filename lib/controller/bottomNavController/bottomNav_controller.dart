import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touchsync/global-colors/colorsHex.dart';
import 'package:touchsync/routers/bottomNavRoute/bottomNav_Route.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationController());

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Obx(() => controller.screen[controller.selectedIndex.value]),
        ),
        bottomNavigationBar: Obx(
          () => Container(
              height: 60,
              decoration: const BoxDecoration(shape: BoxShape.rectangle),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => controller.selectedIndex.value = 0,
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.home,
                                color: controller.selectedIndex.value == 0
                                    ? GlobalColors.blue
                                    : Colors.black,
                                size: 24,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  color: controller.selectedIndex.value == 0
                                      ? GlobalColors.blue
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.selectedIndex.value = 1,
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.person_2,
                                color: controller.selectedIndex.value == 1
                                    ? GlobalColors.blue
                                    : Colors.black,
                                size: 24,
                              ),
                              Text(
                                'Contacts',
                                style: TextStyle(
                                  color: controller.selectedIndex.value == 1
                                      ? GlobalColors.blue
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.selectedIndex.value = 2,
                        child: Container(
                          // width: 34,
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.chart_bar,
                                color: controller.selectedIndex.value == 2
                                    ? GlobalColors.blue
                                    : Colors.black,
                                size: 24,
                              ),
                              Text(
                                'History',
                                style: TextStyle(
                                  color: controller.selectedIndex.value == 2
                                      ? GlobalColors.blue
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.selectedIndex.value = 3,
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.profile_circled,
                                color: controller.selectedIndex.value == 3
                                    ? GlobalColors.blue
                                    : Colors.black,
                              ),
                              Text(
                                'Profile',
                                style: TextStyle(
                                  color: controller.selectedIndex.value == 3
                                      ? GlobalColors.blue
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
