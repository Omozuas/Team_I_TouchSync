import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/views/home_screen/subscreen/all_exchange_screen.dart';

class RowWithTwoTexts extends StatelessWidget {
  final String text1;
  final String text2;

  const RowWithTwoTexts({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
         style: GoogleFonts.syne(
                  fontSize: 16,
                  color: const Color(
                    0xff1B1C1D,
                  ),
                  height: 1.3,
                  letterSpacing: -0.41,
                  fontWeight: FontWeight.w400),
        ),
        GestureDetector(
          // navigate to the all exchange screen
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AllExchangeScreen()));
          },
          child: Text(
            text2,
           style: GoogleFonts.syne(
                    fontSize: 16,
                    color: const Color(
                      0xff007198,
                    ),
                    height: 1.3,
                    letterSpacing: -0.41,
                    fontWeight: FontWeight.w400),
              ),
        ),
      ],
    );
  }
}
