// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:touchsync/views/write_tag_screen.dart';

// class ChooseTagProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0XFFFEFBFD),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Row(
//                     children: [
//                       const ImageIcon(
//                         AssetImage(
//                           'assets/images/arrow-circle-left.png',
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Text(
//                         'Go back',
//                         style: GoogleFonts.syne(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text('Choose Tag Profile',
//                     style: GoogleFonts.poppins(
//                         fontSize: 20,
//                         color: Color(0xff1B1C1D),
//                         height: 1.2,
//                         letterSpacing: -1,
//                         fontWeight: FontWeight.w500)),
//                 const SizedBox(height: 10),
//                 Text(
//                   'Enter the details you would like to write to the tag',
//                   style: GoogleFonts.syne(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: const Color(0xff9E9E9E),
//                     height: 1.71,
//                   ),
//                 ),
//             ListTile(
//               title: Text('Personal Profile',
//               style: GoogleFonts.syne(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color:  Colors.black,
//                     height: 0.8,
//                   ),
//                 ),
//               trailing: Icon(Icons.chevron_right),
//               onTap: () {
//                 // Handle Personal Profile tap
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => WritingTagScreen()));
//               },
//             ),
        
//             ListTile(
//               title: Text('Professional Profile',
//               style: GoogleFonts.syne(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color:  Colors.black,
//                     height: 0.8,
//                   ),),
//               trailing: Icon(Icons.chevron_right),
//               onTap: () {
//                 // Handle Professional Profile tap
//                  Navigator.push(context, MaterialPageRoute(builder: (context) => WritingTagScreen()));
//               },
//             ),
//           ],
//         ),
//       ),
//     )));
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/views/write_tag_screen.dart';

class ChooseTagProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFEFBFD),
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
                        color: Color(0xff1B1C1D),
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
                ListTile(
                  title: Text(
                    'Personal Profile',
                    style: GoogleFonts.syne(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 0.8,
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WritingTagScreen(profileType: 'Personal Profile'),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Professional Profile',
                    style: GoogleFonts.syne(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 0.8,
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WritingTagScreen(profileType: 'Professional Profile'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
