import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/routers/bottomNavRoute/bottomNav_Route.dart';
import 'package:touchsync/views/profile%20screen/profile_screen.dart';
import 'package:touchsync/widgets/custom_elevated_button.dart';

class WriteSuccesfulScreen extends StatelessWidget {
  const WriteSuccesfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
      final controller = Get.put(BottomNavigationController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.29,),
          Align(alignment:Alignment.center,
          child: Image.asset('assets/succesful.png')),
          SizedBox(height: screenHeight*0.05,),
          Text('Tag Written Successfully',
          style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 1.2,
                          letterSpacing: -1
                        ),
                      ),
                      SizedBox(height: screenHeight*0.03,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomElevatedButton(
                          text: 'Add More Tags',
                          //function to add more tags
                           onPressed: (){}),
                      ),
                       SizedBox(height: screenHeight*0.02,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomElevatedButton(text: 'Go to profile', 
                        backgroundColor: Colors.white, textColor: Color(0xff007192),
                        borderColor: const Color(0xff007192),
                        // navigate to profile screen
                         onPressed: () =>
                         controller.selectedIndex.value = 1)
                         ),
                      
        ],
      ),
    );
  }
}