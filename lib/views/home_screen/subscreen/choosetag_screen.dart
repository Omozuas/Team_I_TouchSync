import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/views/home_screen/subscreen/write_tag_screen.dart';

import '../../../widgets/reusable _arrow_buttons.dart';

class ChooseTagProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEFBFD),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      const ImageIcon(
                        AssetImage(
                          'assets/images/arrow-circle-left.png',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Go back',
                        style: GoogleFonts.syne(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text('Choose Tag Profile',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: const Color(0xff1B1C1D),
                        height: 1.2,
                        letterSpacing: -1,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                Text(
                  'Enter the details you would like to write to the tag',
                  style: GoogleFonts.syne(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff9E9E9E),
                    height: 1.71,
                  ),
                ),
                 InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const WritingTagScreen(profileType: 'Personal Profile',)));
                            },
                    child: const ReusableArrowButtons(
                      text: 'Personal profile', url: 'assets/images/arrow-left.png',
                     
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const WritingTagScreen(profileType: 'Professional Profile',)));
                            },
                    child: const ReusableArrowButtons(
                      text: 'Professional Profile', url: 'assets/images/arrow-left.png',
                     
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
