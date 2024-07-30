import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/widgets/reusable_text_switch.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                            'assets/arrow-circle-left.png',
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
                Text(
                  'Settings',
                  style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black,
                            height: 1.2,
                            fontWeight: FontWeight.w500)
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Profile Visibility',
                 style: GoogleFonts.syne(
                            fontSize: 16,
                            color: const Color(0xff111827
),
                            height: 1.2,
                            fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 5,),
                Text('Control who can see your profile',
                 style: GoogleFonts.lato(
                            fontSize: 12,
                            color: const Color(0xff111827
),
                            height: 1.2,
                            fontWeight: FontWeight.w400)
                 ),
                 const ReusableTextSwitch(text: 'Public')
                  ],
                )
   ] ))));
  }
}