import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/routers/bottomNavRoute/bottomNav_Route.dart';
import 'package:touchsync/widgets/custom_elevated_button.dart';

class TagsavedSuccessful extends StatelessWidget {
  const TagsavedSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    final controller = Get.put(BottomNavigationController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.29,
          ),
          Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/succesful.png')),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Text(
            'Tag Saved Successfully',
            style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                height: 1.2,
                letterSpacing: -1),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomElevatedButton(
                  text: 'Go to profile',
                  backgroundColor: Color(0xff007192),
                  textColor: Colors.white,
                  borderColor: const Color(0xff007192),
                  // navigate to profile screen
                  onPressed: () => controller.selectedIndex.value = 1)),
        ],
      ),
    );
  }
}
