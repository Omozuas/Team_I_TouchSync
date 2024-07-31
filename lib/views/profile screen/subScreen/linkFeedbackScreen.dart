import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/controller/bottomNavController/bottomNav_controller.dart';
import 'package:touchsync/routers/bottomNavRoute/bottomNav_Route.dart';

class LinkFeedbackScreen extends StatelessWidget {
  const LinkFeedbackScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationController());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(0xffCCE3EA),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_rounded,
                color: Color(0xff007198),
                size: 60,
              ),
            ),
            Gap(30),
            Text(
              'Link added successfully',
              style:
                  GoogleFonts.syne(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Gap(24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff007198))),
                  onPressed: () {
                    //This should go back to profile...
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavigation()));
                    controller.selectedIndex.value = 3;
                  },
                  child: Text(
                    'Back to profile',
                    style: GoogleFonts.poppins(
                        color: Color(0xffFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
