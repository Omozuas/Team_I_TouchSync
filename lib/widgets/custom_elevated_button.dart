// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CustomElevatedButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final Color backgroundColor;
//   final Color textColor;

//   const CustomElevatedButton({
//     Key? key,
//     required this.text,
//     required this.onPressed,
//     this.backgroundColor = const Color(0xff007198),
//     this.textColor = Colors.white,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: backgroundColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           padding: EdgeInsets.symmetric(vertical: 16),
//         ),
//         child: Text(
//           text,
//           style: GoogleFonts.syne(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: textColor,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xff007198),
    this.textColor = Colors.white,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none,
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          text,
          style: GoogleFonts.syne(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
