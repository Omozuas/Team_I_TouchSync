import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/widgets/reusable_text_switch.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xfffdfefd),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(CupertinoIcons.arrow_left_circle)),
                          SizedBox(
                            width: 10,
                          ),

                        ),
                      const SizedBox(width: 10),
                      Text(
                        'Go back',
                        style: GoogleFonts.syne(
                          fontSize: 17,
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
                            fontSize: 21,
                            color: Colors.black,
                            height: 1.2,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w500)
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Profile Visibility',
                 style: GoogleFonts.syne(
                            fontSize: 17,
                            color: const Color(0xff111827
),
                            height: 1.2,
                            fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 5,),
                Text('Control who can see your profile',
                 style: GoogleFonts.lato(
                            fontSize: 13,
                            color: const Color(0xff6b6b6b
),
                            height: 1.2,
                            fontWeight: FontWeight.w400)
                 ),
                 SizedBox(height: 10,),
                 const ReusableTextSwitch(text: 'Public'),
                 const SizedBox(
                  height: 20,
                 ),
                 const ReusableTextSwitch(text: 'Private'),
                 const SizedBox(height: 20,),

                  Text('Data Sharing',
                 style: GoogleFonts.syne(
                            fontSize: 16,
                            color: const Color(0xff191919
),
                            height: 1.2,
                            fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 5,),
                Text('Share anonymous usage data to improve the app',
                 style: GoogleFonts.lato(
                            fontSize: 12,
                            color: const Color(0xff111827
),
                            height: 1.2,
                            fontWeight: FontWeight.w400)
                 ),
                 SizedBox(height: 10,),
                 const ReusableTextSwitch(text: 'Public'),
                 const SizedBox(
                  height: 20,
                 ),

                  const SizedBox(height: 20),
                Text(
                  'App Preferences',
                  style: GoogleFonts.syne(
                            fontSize: 20,
                            color: Colors.black,
                            height: 1.2,
                            fontWeight: FontWeight.w500)
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notifications',
                 style: GoogleFonts.syne(
                            fontSize: 16,
                            color: const Color(0xff111827
),
                            height: 1.2,
                            fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 5,),
                Text('set notification alerts',
                 style: GoogleFonts.lato(
                            fontSize: 12,
                            color: const Color(0xff6b6b6b
),
                            height: 1.2,
                            fontWeight: FontWeight.w400)
                 ),
                 SizedBox(height: 15,),
                 const ReusableTextSwitch(text: 'Enable notifications'),
                 const SizedBox(
                  height: 20,
                 ),
                 const ReusableTextSwitch(text: 'New contact alert'),
                 const SizedBox(height: 20,),
                 
                  ],
                )
   ] )]))));

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
                      const SizedBox(height: 20),
                      Text('Settings',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.black,
                              height: 1.2,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Profile Visibility',
                              style: GoogleFonts.syne(
                                  fontSize: 16,
                                  color: const Color(0xff111827),
                                  height: 1.2,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('Control who can see your profile',
                              style: GoogleFonts.lato(
                                  fontSize: 12,
                                  color: const Color(0xff111827),
                                  height: 1.2,
                                  fontWeight: FontWeight.w400)),
                          const ReusableTextSwitch(text: 'Public')
                        ],
                      )
                    ]))));

  }
}
