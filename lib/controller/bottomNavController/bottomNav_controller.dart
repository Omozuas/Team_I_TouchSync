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
              height: 80,
              decoration: BoxDecoration(shape: BoxShape.rectangle),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
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
                              CupertinoIcons.house_alt_fill,
                              color: controller.selectedIndex.value == 0
                                  ? GlobalColors.blue
                                  : Colors.black,
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
                      onTap: () {},
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.dashboard_outlined,
                              color: Colors.black,
                            ),
                            Text(
                              'Contacts',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => CartpageScreen()));
                      },
                      child: Container(
                        width: 34,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.shopping_cart,
                              color: Colors.black,
                            ),
                            Text(
                              'History',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.badge_outlined,
                              color: Colors.black,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.profile_circled,
                              color: Colors.black,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
